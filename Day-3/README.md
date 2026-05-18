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
**Syntax** 
locals {
  instance_type = "t2.micro"
}

**Use**
instance_type = local.instance_type

# Taint
Taint in Terraform is used to mark a resource as damaged or needing recreation during the next apply operation.

# replace
The replace option in Terraform explicitly forces a resource to be recreated during terraform apply.

# lyfecycle
Lifecycle rules in Terraform control how resources are created, updated, or destroyed to ensure safe infrastructure management.

**Prevent Destroy**
lifecycle {
  prevent_destroy = true
}

**Ignore Changes**
lifecycle {
  ignore_changes = [tags]
}



