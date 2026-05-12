**day-1 terraform-practice**

1. What You Practiced
✔ EC2 Creation using Variables
Created EC2 using:
aws_instance
Used variables for:
AMI
Instance type
Key pair
Volume
Tags
✔ Variable Types Used
Type	Example
string	instance_type
number	volume_size
list	iname, iami
bool	(optional)
map	tags
object	(concept learned)
✔ Multi-Instance Creation

Used:

count = var.icount

Accessed:

var.iname[count.index]
var.iami[count.index]

👉 This creates multiple EC2 instances dynamically

📁 Correct Terraform Structure
provider.tf        → provider config
resource.tf        → infrastructure
variables.tf       → variable definitions
terraform.tfvars   → values
🔥 Key Concepts You Learned
1️⃣ Variables Usage
ami = var.ami

👉 NOT:

ami = "var.ami" ❌
2️⃣ Variable Declaration
variable "volume_size" {
  type = number
}
3️⃣ tfvars Usage
volume_size = 10

👉 No variable keyword here

4️⃣ Count Usage
count = var.icount

👉 Used for multiple resources

5️⃣ Root Block Device
root_block_device {
  volume_size = var.ivolume
}
❌ Mistakes You Made (Important 🔥)
❌ 1. Using Quotes with Variables
ami = "var.ami" ❌
✅ Fix:
ami = var.ami

👉 Quotes convert variable into string

❌ 2. Wrong File Usage
terraform.tfvar ❌
✅ Fix:
terraform.tfvars ✅

👉 Terraform won’t auto-load wrong file name

❌ 3. Defining Variables in tfvars
variable "name" { } ❌
✅ Fix:
Move to variables.tf
❌ 4. Typo Errors
varibale ❌
vaolume ❌
iam ❌
✅ Fix:
variable
volume_size
iami
❌ 5. Wrong Data Type
ivolume = "10" ❌
✅ Fix:
ivolume = 10

👉 number ≠ string

❌ 6. Variable Not Declared

Error:

Reference to undeclared variable

👉 Cause:

variable missing or wrong name
❌ 7. AWS Error (Invalid AMI)
Invalid id: "var.ami"

👉 Cause:

variable inside quotes
🧠 Key Debugging Learnings

When Terraform fails:

✔ Step 1:
terraform validate
✔ Step 2:

Check:

variable names
file names
data types
✔ Step 3:

Check error message carefully 🔥

🚀 Commands You Used
terraform init
terraform validate
terraform plan
terraform apply
💡 Best Practices You Learned
Use separate files:
variables.tf
terraform.tfvars
Avoid hardcoding values
Use lists + count for multiple resources
Always match variable types
Avoid quotes around variables
🔥 Final Working Example (Simplified)
resource "aws_instance" "web-server" {

  count = var.icount

  ami           = var.iami[count.index]
  instance_type = var.itype

  tags = {
    Name = var.iname[count.index]
  }

  root_block_device {
    volume_size = var.ivolume
  }
}
🧠 Interview Ready Points

You can now confidently answer:

What are Terraform variables?
Types of variables
Difference between .tf and .tfvars
What is count
Common Terraform errors
🔥 Your Level Now

👉 You are no longer beginner
👉 You are at practical DevOps Terraform level
