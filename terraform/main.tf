terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}
# Configure the AWS provider
provider "aws"  {
    region = "eu-west-1"
    default_tags{

        tags  ={
            Application = "static_website"
            Owner = "SergioCloud"
        }

    }
}
# Creating the website module
module "staticwebsite" { 
    source = "./../staticwebsite"
}
