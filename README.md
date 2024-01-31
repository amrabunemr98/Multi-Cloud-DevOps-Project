<div align="center">
  <h1 style="color: red;"> Deploy Spring Boot APP on OpenShift Cluster using Jenkins :globe_with_meridians:</h1>
</div>

## :dizzy: Project Overview:-
- Welcome to Deploy Spring Boot APP on OpenShift Cluster using Jenkins, an innovative and comprehensive DevOps initiative aimed at streamlining the development, deployment, and management of applications across multiple cloud environments. This project leverages industry-standard tools such as GitHub, AWS, Terraform, Ansible, Docker, SonarQube, Jenkins and OpenShift, providing a robust foundation for efficient and scalable DevOps practices.
***
## 🚀 Objective:-

- The primary objective of Deploy Spring Boot APP on OpenShift Cluster using Jenkins is to establish an end-to-end DevOps pipeline that seamlessly integrates various cloud services, automates infrastructure provisioning, configuration management, and facilitates continuous integration and deployment. This project is designed to showcase best practices for managing a modern, cloud-native application stack while promoting collaboration and automation.
***

## :gear: Requirements:-
- :white_check_mark: Github
- :white_check_mark: Terraform
- :white_check_mark: AWS
- :white_check_mark: Docker 
- :white_check_mark: Ansible
- :white_check_mark: SonarQube
- :white_check_mark: OpenShift Cluster
- :white_check_mark: Jenkins
***

## :scroll: Project Structure:-
- **GitHub:** GitHub Actions workflow directory containing the CI/CD configuration.
- **Terraform:** Configurations for AWS infrastructure provisioning (VPC, Subnets, EC2, S3 Bucket, CloudWatch, SNS, etc.).
- **Ansible:** Automated setup of EC2 instances with SonarQube, Jenkins, and OpenShift CLI.
- **Docker:** Dockerfiles for building Spring Boot App containers.
- **SonarQube:** Ensures code quality, security, and upholds high standards in Spring Boot development.
- **OpenShift Cluster:** Kubernetes manifests for deploying the app and centralized monitoring/logging on OpenShift.
- **Jenkins:** Configures a Release Pipeline for automated build, test, push, and deployment processes.
***
## :computer: Quick Start Guide:
**1. Clone the Repository:**
```
git clone https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project.git
```
**2. Sign in to the AWS Management Console :arrow_right: Select "Users" from the Dashboard :arrow_right: Go to the "Security credentials" tab :arrow_right: Under "Access keys," click "Create access key"**

![Screenshot from 2024-01-31 13-44-32_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/bd72cfa7-07a4-4829-8cd4-392d39dd90d3)
------------------------------------------------
**3.Open local terminal to add AWS credentials:**
```
cd .aws/
```
```
nano credentials
```

![Screenshot from 2024-01-31 13-48-05_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/ea2869a7-9939-47dd-ab20-4dbab61bea94)

![Screenshot from 2024-01-31 13-47-29_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/b52e5515-2ae8-47f0-b787-a4f3d56fab14)
------------------------------------------------------------------------

**4.Navigate to the EC2 Console :arrow_right: Access "Key Pairs" Section :arrow_right: Create Key Pair :arrow_right: Download the Key Pair:**
```
sudo chmod 400 Project.pem
```
![Screenshot from 2024-01-31 13-49-56_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/cdf4d3a3-703e-4685-a2a7-3ab38ed43be5)


**5.Run [Bash Script](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/blob/main/Build.sh) that Run [Terraform](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/tree/main/Terraform) and [Ansible](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/tree/main/Ansible):**
```
sudo chmod +x build.sh
```
```
./build.sh
```
 ![Screenshot from 2024-01-31 14-19-52_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/452f7ee4-5ebe-414a-b94d-29c39bae0e96)
 ![Screenshot from 2024-01-31 14-25-16_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/a2b3cb3f-4167-454e-9873-d823ad51db70)

 **6. Access SonarQube Web, Create Project and Token:**
 
  - **[http://your_ec2_ip:9000](http://your_ec2_ip:9000) ▶️ 👤UserName: admin  & 🔒PassWord: admin ▶️ create new PassWord**
 
 ![Screenshot from 2024-01-31 14-40-16_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/65065f8c-ab6a-4916-944a-696340d7b227)

- **Create Project:**
![Screenshot from 2024-01-31 14-43-55_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/180202da-50d5-4e4e-8c7d-89090d5d9f66)

- **Create Token to use in Jenkins:**
![Screenshot from 2024-01-31 14-44-49_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/e36e580d-2662-4441-ae58-79e13ae4870f)

**7.Creating Docker-Hub Token:**
![Screenshot from 2024-01-31 14-56-37_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/2cde350f-93c5-44b1-ab24-61f8c843aa4c)


**8.Access Jenkins, Create Pipeline, Add Credentials and Install Plugin:**
![Screenshot from 2024-01-31 14-37-17_Original](https://github.com/amrabunemr98/Multi-Cloud-DevOps-Project/assets/128842547/5a8dda2a-3575-41e7-8ccf-f227b825e2d1)














 








