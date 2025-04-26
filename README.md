# EC2 + VPC Terraform Setup

This Terraform module sets up a basic VPC with public/private subnets, a security group, and multiple EC2 instances.

## Features
- Create a new VPC
- Create public and private subnets
- Create internet gateway
- Create route tables
- Create security group
- Launch multiple EC2 instances
- Dynamically fetch the latest Ubuntu AMI
- Generate a new key pair

## Prerequisites
- Terraform >= 1.0
- AWS CLI configured
- An AWS account

## How to Use

1. Clone the repo:

```bash
git clone https://github.com/yourusername/your-repo.git
cd your-repo
```

2. Initialize Terraform:

```bash
terraform init
```

3. Set your variables in `terraform.tfvars`:

```hcl
region = "ap-south-1"
vpc_cidr = "10.0.0.0/16"
vpc_name = "my-vpc"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["ap-south-1a", "ap-south-1b"]
instance_type = "t2.micro"
ec2_instance_count = 2
```

4. Plan and apply:

```bash
terraform plan
terraform apply
```

5. After apply, retrieve your private key file:

```bash
terraform output -raw ec2_private_key_pem > my-key.pem
chmod 400 my-key.pem
```

6. Connect to your EC2 instance:

```bash
ssh -i my-key.pem ubuntu@<public-ip>
```

## Project Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars (you create this)
├── modules
│   └── ec2
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── .gitignore
└── README.md
```

## Future Work
- Add Elastic IP attachment for instances.
- Modify security group to allow inbound rules based on input variables.

## License
This project is open-source and free to use.

