🌐 Wordpress-Terraform

🚀 Deploying a Fully Automated WordPress Stack on AWS Using Terraform
This project provisions and configures a complete WordPress environment on AWS EC2 using Terraform.
It automates the setup of networking, compute, and security layers — enabling reproducible, scalable, and secure WordPress deployments in minutes.

🧱 Infrastructure Overview
The Terraform configuration builds the following components automatically:
🌩️ VPC with both public and private subnets
🌐 Internet Gateway for external connectivity
🔁 NAT Gateway for secure private subnet access
🧱 Security Groups for controlled ingress & egress (HTTP, HTTPS, SSH)
💻 EC2 Instance (Ubuntu) hosting WordPress + Apache + PHP
🗄️ MySQL Database (locally hosted on EC2; optional RDS integration)
🔐 Key Pair for SSH access
📡 Elastic IP (optional) for persistent public access

⚙️ Terraform Modules Implemented
The project uses the official, production-ready Terraform AWS modules:
Module	                        
terraform-aws-modules/vpc/aws - Creates VPC, public & private subnets, NAT, and routing

terraform-aws-modules/security-group/aws -	Configures firewall rules for HTTP/HTTPS/SSH

terraform-aws-modules/ec2-instance/aws	- Deploys the EC2 instance running WordPress

🌍 Region & Configuration
AWS Region: eu-west-2 (London)
Instance Type: t2.micro (free-tier eligible)
AMI Used: ami-046c2381f11878233 (Ubuntu 24.04 LTS)
Availability Zone: eu-west-2a
VPC CIDR: 10.0.0.0/16
Public Subnets: 10.0.101.0/24
Private Subnets: 10.0.1.0/24

📁 Project Structure
Wordpress-terraform/
├── main.tf              # Core infrastructure (VPC, EC2, Security Groups)
├── variables.tf         # Input variables for modular configuration
├── outputs.tf           # Terraform output values
├── provider.tf          # AWS provider definition
├── .gitignore           # Ignored Terraform files and cache
└── README.md            # Project documentation

🚀 Deployment Steps
git clone https://github.com/MohamedA15/Wordpress-terraform.git
cd Wordpress-terraform

Initialise Terrafor
terraform init

Review the plan
terraform plan

Apply configuration
terraform apply 

Access WordPress
Copy the public IP from the Terraform output.
Open it in your browser: http://<public-ip>/
Complete the WordPress installation wizard.

🔒 Security Considerations
Only HTTP (80), HTTPS (443), and SSH (22) are allowed inbound.
You can restrict SSH access by editing:
variable "ingress_cidr_blocks" {
  default = ["<your-public-ip>/32"]
}
Use strong MySQL passwords and disable anonymous users (done via mysql_secure_installation).
Regularly patch your EC2 instance using:
sudo apt update && sudo apt upgrade -y

🧰 Tech Stack
Component	Description
Terraform	Infrastructure as Code
AWS EC2	Virtual server for WordPress
AWS VPC	Networking and isolation
AWS Security Groups	Firewall configuration
Ubuntu 24.04 LTS	EC2 base image
Apache2	Web server
PHP 8.3	Backend scripting
MySQL 8.0	WordPress database

👨‍💻 Author
Mohamed Amiin