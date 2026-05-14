**day-1 terraform-practice**

# 1. What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool used to provision and manage cloud resources using code.

# 2. Basic File Structure
provider.tf        → provider configuration
resource.tf        → infrastructure (EC2)
variables.tf       → variable definitions
terraform.tfvars   → variable values
**In terraform variables are use to make your code resable and dynamic instead of hardcoding values**
# 3. Variables in Terraform
✔ Definition (variables.tf)
variable "instance_type" {
  type = string
}
✔ Usage (resource.tf)
instance_type = var.instance_type
✔ Values (terraform.tfvars)
instance_type = "t2.micro"
# 4. Variable Types
Type	Example
string	"t2.micro"
number	10
bool	true
list	["web-1","web-2"]
map	{ Name = "web" }
object	structured config
# 5. EC2 Creation (Using Variables)
resource "aws_instance" "web" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.name
  }

  root_block_device {
    volume_size = var.volume_size
  }
}
# 6. Multiple EC2 (count)
resource "aws_instance" "web" {

  count = var.icount

  ami           = var.iami[count.index]
  instance_type = var.itype

  tags = {
    Name = var.iname[count.index]
  }
}

👉 Creates multiple instances dynamically

# 7. Important Rules
✔ Rule 1: No Quotes for Variables
ami = var.ami        ✅
ami = "var.ami"      ❌
✔ Rule 2: Correct File Usage
variables → variables.tf
values → terraform.tfvars
✔ Rule 3: Data Types Must Match
volume_size = 10     ✅
volume_size = "10"   ❌
✔ Rule 4: tfvars Naming

Terraform auto-loads:

terraform.tfvars
*.auto.tfvars
# 8. Mistakes You Made (Important)
❌ 1. Quotes around variables

👉 "var.ami" → wrong

❌ 2. Wrong file name

👉 terraform.tfvar → wrong

❌ 3. Variables defined in tfvars

👉 should be in variables.tf

❌ 4. Typo errors
varibale
vaolume
iam
❌ 5. Wrong type
ivolume = "10" ❌
❌ 6. Variable mismatch
iam ≠ iami
# 9. Debugging Approach

When error occurs:

Read error message carefully
Check:
variable name
file name
data type
Run:
terraform validate
terraform plan
# 10. Commands
terraform init
terraform validate
terraform plan
terraform apply
# 11. Best Practices
Separate variables and values
Use tfvars for environments
Avoid hardcoding
Use lists for multiple resources
Maintain clean file structure
# 12. Interview Ready Answer

Terraform variables are used to make infrastructure code reusable and dynamic. They are defined in variables.tf, assigned in tfvars files, and accessed using var.<name>.

🔥 Final Summary

You learned:

Variables ✔
tfvars ✔
EC2 creation ✔
count ✔
Debugging ✔

👉 This is real DevOps Terraform foundation
