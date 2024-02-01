# Infrastructure as Code with Terraform

## AWS Environment Setup

This Terraform configuration sets up an AWS environment with essential components such as VPC, Subnets, Security Groups, Internet Gateway, Route Tables, EC2 Instances, CloudWatch, and an S3 Bucket.

### Prerequisites:

1. **Terraform Providers:**
   - Ensure you have Terraform installed, and the required AWS provider version (~> 5.0) is available.

2. **AWS Credentials:**
   - Configure your AWS credentials with a profile named "Terraform" to be used by the AWS provider.

### Configuration:

1. **Inserting VPC:**
   - Utilizes the `./VPC` module to create a Virtual Private Cloud (VPC) with the specified CIDR block.

     ```hcl
     module "tf-vpc" {
       source     = "./VPC"
       cidr-block = var.cidr-block
       vpc-tag    = var.vpc-tag
     }
     ```

2. **Inserting Subnets:**
   - Utilizes the `./Subnet` module to create subnets within the VPC.

     ```hcl
     module "tf-subnet" {
       source = "./Subnet"
       vpc    = module.tf-vpc.vpc
       sub    = var.sub
     }
     ```

3. **Inserting Security Group:**
   - Utilizes the `./SG` module to create a security group within the VPC.

     ```hcl
     module "tf-security-group" {
       source  = "./SG"
       vpc     = module.tf-vpc.vpc
       cidr-SG = var.cidr-SG
     }
     ```

4. **Inserting Internet Gateway:**
   - Utilizes the `./IGW` module to create an Internet Gateway.

     ```hcl
     module "tf-igw" {
       source           = "./IGW"
       vpc              = module.tf-vpc.vpc
       internet-gateway = var.internet-gateway
     }
     ```

5. **Inserting Route Table:**
   - Utilizes the `./RT` module to create a route table.

     ```hcl
     module "tf-route-table" {
       source     = "./RT"
       vpc        = module.tf-vpc.vpc
       sub_pub    = [ module.tf-subnet.sub-pub ]
       cidr-rt    = var.cidr-rt
       igw        = module.tf-igw.igw
       tag_public = var.tag_public
     }
     ```

6. **Inserting EC2 Instance:**
   - Utilizes the `./EC2` module to create an EC2 instance.

     ```hcl
     module "tf-instance" {
       source           = "./EC2"
       sub_pub          = [ module.tf-subnet.sub-pub ]
       sg-pub           = module.tf-security-group.sg-pub
       ec2-type         = var.type-ec2
       profile_instance = "Terraform"
       key-pair         = var.key-pair
     }
     ```

7. **CloudWatch Configuration:**
   - Utilizes the `./CloudWatch` module to set up CloudWatch monitoring with alarms.

     ```hcl
     module "tf-cloudwatch" {
       source = "./CloudWatch"
       ec2    = module.tf-instance.ec2_id[0]
       email  = var.email
       time   = var.time
     }
     ```

8. **S3 Bucket Creation:**
   - Utilizes the `./S3` module to create an S3 bucket.

     ```hcl
     module "tf-s3" {
       source        = "./S3"
       name_bucket   = var.name_bucket
       region_bucket = var.region_bucket
     }
     ```

### Running Terraform:

1. **Initialize:**
   - Run `terraform init` to initialize the working directory.

2. **Plan:**
   - Run `terraform plan` to preview the changes that will be applied.

3. **Apply:**
   - Run `terraform apply` to apply the configuration changes.

### Cleanup:

1. **Destroy:**
   - Run `terraform destroy` to destroy all resources created by this configuration.

### Note:

- This configuration assumes that you have AWS credentials properly configured with the necessary permissions.

Feel free to customize this README to better fit the specifics of your project. Add additional sections as needed.
