# Terraform settings
terraform {

  # The required providers Terraform will use to provision your infrastructure.
  # For each provider, the `source` attribute defines an optional hostname, a namespace, and the provider type.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


# The `provider` block configures the specified provider, in this case AWS
provider "aws" {

  # The `profile` attribute in the AWS provider block refers Terraform to the AWS credentials stored in your AWS configuration file
  profile = "default"
  region  = "us-east-1"

}

# Resource blocks define components of your infrastructure.
# A resource might be a physical or virtual component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

# Resource blocks have two strings before the block: the resource type and the resource name. 
# Together, the resource type and resource name form a unique ID for the resource.
resource "aws_instance" "app_server" {
  ami           = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}