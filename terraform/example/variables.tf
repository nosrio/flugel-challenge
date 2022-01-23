variable region{
    type = string
    description = "AWS region to deploy resources"
    default = "us-east-1"
}

variable instance_type{
    type = string
    description = "AWS EC2 instance type"
    default = "t3.micro"
}