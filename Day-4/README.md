# Terraform Drift:
Terraform drift occurs when infrastructure resources are manually modified outside Terraform, making the actual infrastructure different from Terraform’s recorded state.

How to Detect Drift
**terraform plan
# Terraform Refresh 
Terraform refresh updates the Terraform state file by synchronizing it with the current real infrastructure without making any infrastructure changes.

Command 
---> terraform apply -refresh-only
