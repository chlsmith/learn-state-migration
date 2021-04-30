## Terraform configuration

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = "~> 0.14"
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "TwoDadsConstruction"
    workspaces {
      name = "TwoDadsConstruction"
    }
  }
}


variable "name_length" {
  description = "The number of words in the pet name"
  default     = "2"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}
