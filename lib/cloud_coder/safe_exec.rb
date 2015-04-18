module CloudCoder
  class SafeExec
    def self.exec(command, *args)
      # Create a list of things to rescue from. Since this is OS
      # specific, we need to do some defined? checks here to make
      # sure they exist.
      # rescue_from = []
      # rescue_from << Errno::EOPNOTSUPP if defined?(Errno::EOPNOTSUPP)
      # rescue_from << Errno::E045 if defined?(Errno::E045)
      # rescue_from << SystemCallError

      fork_instead = false
      begin
        pid = nil
        pid = fork if fork_instead
        Kernel.exec(command, *args) if pid.nil?
        Process.wait(pid) if pid
      rescue *rescue_from
        # We retried already, raise the issue and be done
        raise if fork_instead

        # The error manifested itself, retry with a fork.
        fork_instead = true
        retry
      end
    end
  end
end
