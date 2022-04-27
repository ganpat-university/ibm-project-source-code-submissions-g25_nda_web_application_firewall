resource "aws_security_group" "ssh-allowed" {
    vpc_id = "vpc-0c782d18f87d5df13"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }    
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
          
    }    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 8000
        to_port = 9000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        //security_groups = [ "${aws_security_group.elb-sg.id}" ]

    }    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        //security_groups = [ "${aws_security_group.elb-sg.id}" ]

    }    



    tags ={
        Name = "ssh-allowed-ANilP"
    }
}
