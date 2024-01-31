#######################
#         Provider    #
#######################

variable "region" {
  description = "Region of AWS"
  type        = string
}

#######################
#         Vpc         #
#######################

variable "cidr-block" {
  description = "cidr of VPC"
  type        = string
}
variable "vpc-tag" {
  description = "name of vpc"
  type        = string
}

#######################
#         EC2         #
#######################

variable "type-ec2" {
  description = "size of EC2"
  type        = string
}
variable "key-pair" {
  description = "key pair of ec2"
  type        = string
}

#######################
#         Subnet      #
#######################

variable "sub" {
  description = "Public Subnet"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
}

#######################
#    Security Group   #
#######################

variable "cidr-SG" {
  description = "cidar of SG"
  type        = list(string)
}

#######################
#   Internet Gateway  #
#######################

variable "internet-gateway" {
  description = "name of IGW"
  type        = string
}

#######################
#     Route Table     #
#######################

variable "cidr-rt" {
  description = "cidr-block of Route Table"
  type        = string
}
variable "tag_public" {}

#######################
#     CloudWatch      #
#######################

variable "email" {
  description = "Email For SNS Topic Subscription "
  type        = string
}
variable "time" {
  description = "Time of CloudWatch Alarm "
  type        = string
}

#######################
#      S3 Bucket      #
#######################

variable "name_bucket" {
  description = "Name Of S3 Bucket "
  type        = string
}
variable "region_bucket" {
  description = "Region Of S3 Bucket "
  type        = string
}