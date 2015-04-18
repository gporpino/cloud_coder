require 'aws-sdk'

module CloudCoder
    class EC2
        
        attr_accessor :ec2
        
        def initialize(args={})
            Aws.config.update({ region: 'us-west-2', credentials: Aws::Credentials.new('AKIAJWJID3CX72CMSG7Q', 'sFhOywHRM4S+a3iKs3OIAPUJ1IwUWJ/amPMrfPwG'), })
            
           @ec2 = Aws::EC2::Client.new
        end
        
        
    end
end