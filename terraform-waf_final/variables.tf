variable "AWS_region" {
    default = "us-east-1"
}

variable "AMI" {
        default = "ami-04505e74c0741db8d"
    }



variable "PUBLIC_KEY_PATH" {
        default = "/home/anil/.ssh/id_rsa.pub"
    }

variable "PRIVATE_KEY_PATH" {
        default = "/home/anil/.ssh/id_rsa"
    }

variable "EC2_USER" {
        default = "aprajapati@presidio.com"
    }

variable "db_password" {
    default = "sgnons#0123jkhjamjbm"
}

variable "db_username" {
    default = "sgnroot"
}
variable "db_name" {
    default = "sgndb"
}

variable "db_url" {
    default = "education.cdy41ij0uhih.us-east-1.rds.amazonaws.com"
}
