# Infrastructure as code
## Best practices
  - Run terraform command with var-file
  - Enable version control on terraform state files bucket
  - Use remote backend for managing state in a team
  - Turn on debug when you need do troubleshooting
  - Use shared modules
  - Isolate environment
  - Use terraform import to include as many resources you can
  - Avoid hard coding the resources
  - validate and format terraform code
Repository with in-depth description of best practices: https://github.com/ozbillwang/terraform-best-practices

## Virtualbox
Currently the official provider for virtualbox does not exist and is unlikely to appear since the default way to manage virtualbox instances is to use [vagrant](https://www.vagrantup.com/), which is another product from the company that develops terraform.
The unofficial virtualbox provider, [terra-farm](https://registry.terraform.io/providers/terra-farm/virtualbox/latest/docs), is badly outdated and does not support modern versions of virtualbox

## Dev environment
I created a terraform configuration that instantiates an aws ec2 instance, installs docker on it and run the jenkins container. Additionaly I used a module that creates all the necessary network components
