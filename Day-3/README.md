# Terraform workspaces
Terraform workspaces are used to manage multiple environments with the same Terraform configuration by maintaining separate state files for each workspace.

**List Workspaces**
terraform workspace list
terraform workspace show
* * = current workspace
**create workspace**
terraform workspace new dev
**Switching between workspaces**
terraform workspace select dev
**Delete workspace**
terraform workspace delete dev

# Locals

Locals in Terraform are used to store reusable expressions or values that help simplify and standardize Terraform configurations.
--> Syntax 
locals {
  instance_type = "t2.micro"
}

--> Use
instance_type = local.instance_type

