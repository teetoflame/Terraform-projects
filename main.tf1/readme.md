Here’s a basic `README.md` for your "Deploy Configurable Web Server using Terraform" project:

```markdown
# Deploy Configurable Web Server using Terraform

This project demonstrates how to deploy a configurable web server on AWS using Terraform. It provisions an EC2 instance with customizable configurations such as instance type, region, and key pair name, and it includes a security group to allow HTTP traffic.

## Prerequisites

Before running the Terraform code, ensure the following:

- **Terraform** is installed on your machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
- **AWS Account** with access to the AWS resources used in this project.
- **AWS CLI** installed and configured with your AWS credentials. You can configure it by running:
  ```bash
  aws configure
  ```

## Variables

The following input variables are defined in the `main.tf` file:

- **aws_region**: The AWS region where the resources will be deployed (default is `eu-north-1`).
- **instance_type**: The type of EC2 instance (default is `t3.micro`).
- **ami_id**: The Amazon Machine Image (AMI) ID used for the EC2 instance (default is an Ubuntu 20.04 AMI).
- **key_pair_name**: The name of the existing SSH key pair for accessing the EC2 instance (default is `bincom`). (this is my existing key pair)



## Resources

- **AWS Security Group**: A security group is created to allow inbound HTTP (port 80) traffic to the EC2 instance.
- **AWS EC2 Instance**: An EC2 instance is provisioned based on the specified AMI ID, instance type, and key pair.
- **Output**: The public IP address of the EC2 instance will be output after the deployment.

## Terraform Configuration

The following AWS resources are created:

- **AWS Security Group**: Allows HTTP traffic (port 80) from anywhere.
- **AWS EC2 Instance**: A configurable web server instance using Ubuntu 20.04 AMI.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/teetoflame/Terraform-project.git
   cd terraform-configurable-web-server
   ```

2. Initialize Terraform to install the required providers:

   ```bash
   terraform init
   ```

3. Plan the deployment to ensure the configuration is correct:

   ```bash
   terraform plan
   ```

4. Apply the configuration to create the resources:

   ```bash
   terraform apply
   ```

   Terraform will prompt you to confirm the changes. Type `yes` to proceed.

5. After the resources are created, Terraform will output the **public IP address** of the EC2 instance. You can use this IP to access the web server.

6. To destroy the resources (when you're done), run the following command:

   ```bash
   terraform destroy
   ```

   Terraform will prompt you to confirm. Type `yes` to delete all the resources.

## Notes

- Make sure you have an existing SSH key pair in your AWS account with the name `bincom` (or update the key pair name variable).
- The EC2 instance is configured to allow HTTP traffic. You can update the security group rules if additional ports are required.
- Modify the `ami_id` variable if you want to use a different AMI (e.g., a different OS version).

## Troubleshooting

If you encounter issues, consider the following:

- **SSH Access**: Ensure that your security group allows inbound traffic on port 22 (SSH) for remote access to the EC2 instance.
- **Region**: Make sure that the AWS region specified in the `aws_region` variable is valid and available in your account.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```

