# AWS Infrastructure Deployment with Terraform

## Project Overview

This Terraform project automates the deployment of a web server infrastructure on AWS. It sets up a VPC, subnet, Internet Gateway, security group, and an EC2 instance running Apache2 in the eu-north-1 (Stockholm) region.

## Infrastructure Components

1. VPC
2. Internet Gateway
3. Custom Route Table
4. Subnet
5. Security Group
6. Network Interface
7. Elastic IP
8. EC2 Instance (Ubuntu with Apache2)

## Requirements

- Terraform installed
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

## Files

- `main.tf`: Contains the main infrastructure configuration
- `provider.tf`: Specifies the AWS provider and region

## Usage

1. Clone the repository:
git clone https://github.com/NaghmeM/Terraform.git
cd Terraform
2. Initialize Terraform:
terraform init
3. Review the planned changes:
terraform plan
4. Apply the configuration:
terraform apply
5. To destroy the infrastructure:
terraform destroy
## Configuration Details

- **Region**: eu-north-1 (Stockholm)
- **VPC CIDR**: 10.0.0.0/16
- **Subnet CIDR**: 10.0.1.0/24
- **Availability Zone**: eu-north-1b
- **EC2 Instance Type**: t3.micro
- **AMI**: ami-0014ce3e52359afbd (Ubuntu)

## Security

The security group allows inbound traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS) from any source. Adjust these settings as needed for your security requirements.

## Customization

You can modify the `main.tf` and `provider.tf` files to adjust the infrastructure according to your needs. Key areas for customization include:

- CIDR blocks
- Instance type
- AMI ID
- Security group rules
- User data script
- AWS region

## Contributing

Contributions to improve the project are welcome. Please follow these steps:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the Apache2 License - see the [LICENSE](LICENSE) file for details.

## Contact

Najme - nmohajeri@gmail.com

 https://github.com/NaghmeM/Terraform