variable "aws_region" {
    description = "The aws region to deploy"
    default     = "us-east-1"
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
    description =  " Instance type for the Ec2 instance"
    default     = "t2.micro"
}

variable "private_key_path" {
    description = "Path to private key for SSH access"
}