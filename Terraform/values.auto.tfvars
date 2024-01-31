#######################
#         Provider    #
#######################

region = "us-west-1"

#######################
#         Vpc         #
#######################

cidr-block = "10.0.0.0/16"

vpc-tag = "Project"

#######################
#         Subnet      #
#######################

sub = {
  "public-subnet" = {
    cidr_block        = "10.0.0.0/24"
    availability_zone = "us-west-1a"
    name              = "public-Sub"
  }
}

#######################
#    Security Group   #
#######################

cidr-SG = ["0.0.0.0/0"]

#######################
#   Internet Gateway  #
#######################

internet-gateway = "Project-IGW"

#######################
#     Route Table     #
#######################

cidr-rt    = "0.0.0.0/0"
tag_public = "public RT"

#######################
#         EC2         #
#######################

type-ec2 = "t2.large"
key-pair = "Project"

#######################
#     CloudWatch      #
#######################

email = "amr_abunemr16@yahoo.com"
time  = "300" # it's 300 sec = 5 mins

#######################
#      S3 Bucket      #
#######################

name_bucket   = "abunemr-project"
region_bucket = "us-west-1"





