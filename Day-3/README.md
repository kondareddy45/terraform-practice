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

