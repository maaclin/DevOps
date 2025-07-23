Providers

Providers are necessary when stating an exact version we desire to use. When we run terraform init, plugins required are automatically downloaded and saved locally to a .terraform directory. Terraform init -upgrade installs the latest module and provider versions allowed within configured constraints. 

Provider blocks are not necessary when the version does not need to be explicitly set and the latest version can be used. You cannot define config related to regions, access keys/secret keys inside the required_provider block, instead in the provider block. There are official, partner and community provider tiers. 


terraform { 
 required_providers {    
mycloud = {     
 source  = "mycorp/mycloud"     
 version = "~> 1.0" 
}

Provider "aws" {
Region = 
Project = 
}

Version constraints key

>=1.0 - greater than equal to the version
<=1.0 - less than equal to the version
~>2.0 - any version in the 2.x range
>=2.10,<2.30 - any version between 2.10 and 2.30 

Dependency lock file 

This file will allow us to lock to specific version of the version even if a newer version has become available. You can override that by running terraform init -upgrade.  Terraform has implicit dependencies which create resources in the correct order i.e instance before eip. If a resource needs to explicitly rely on another resource the meta-argument depends_on is used. 

State file 

When the state file is locked running terraform apply or any other command that modifies the state file and terraform refresh which updates the state file will fail. The state file does not always match current state infrastructure as manual online changes will not reflect. If you using a GIT repo for committing code the .gitignore should be configured to ignore certain terraform files that contain sensitive data i.e. terraform.tfstate file, *.tfvars files. If supported by your backend terraform will lock your state for all operations that can write state. Not all backends support locking functionality. Terraform has a force-unlock command to manually unlock the state if unlocking has failed - terraform force-unlock LOCK_ID [DIR]

Alias

Alias can be used for using the same provider with different configurations for different resources. 
Provider "aws" {
Region = eu-west-2}

Provider "aws" {Alias = usa
Region = us-west-1} 
---->
Resource "aws_instance" "myec2" {
provider = aws.usa
ami = ami-1234
instance_type = t2.micro


Terraform plan, apply, destroy

Terraform plan is used to create an execution plan it does not modify the state file. You can save your plan file with the command terraform plan -out=FILE. You can then pass the file to terraform apply to execute later. 

Terraform apply command is used to apply the changes required to reach the desired state of the configuration. The state file gets modified in this command named terraform.tfstate. It can change, destroy and provision resources but not import resources.  You can use apply -replace to destroy and recreate a specific resource, regardless of whether its configuration has changed.

Terraform destroy is used to destroy terraform managed resources. You can also destroy resources by commenting out or removing text from our configuration files. 

Terraform fmt

Terraform fmt formats the text in our configuration file to maintain a proper style. We can use -check to validate input before changing and -recursive to process all files in subdirectories. The formatting recommended practices are ident two spaces for each nesting level and when multiple arguments with single-line values appear on consecutive lines at the same level align their equals signs.  
 
Terraform refresh

This reads the current settings from all managed remote objects and updates the state to match. This wont modify objects but will modify the terraform state. This command is deprecated as it is unsafe. 

Terraform state

This command is used for advanced state management. 

List - lists resources in state file
Mv - moves item with terraform state
Pull - manually download and output the state from remote state
Push - manually upload a local state file to remote state
Rm - remove items from the terraform state
Show - show the attributes of a single resource in the state

When configuring a backend for the first time from an undefined backend, terraform will give you the option to migrate your state to the new backend without losing any existing current state. If you don’t specify where the state is stored using a backend it will store on the local disk -

Terraform {
Backend "s3" {
Bucket = abcdef
Key = path/to/my/key
Region = eu-west-2
    }
}

Terraform import 

Allows importing existing infrastructure to Terraform. Automatic code generation for imported resources is supported. Terraform plan -generate-config-out="FILENAME" will generate a new config file imported from the new additions to your resources which can be pushed using terraform apply. 


Terraform workspace

Allows us to manage multiple set of deployments from the same sets of configuration files found in the terraform.tfstate.d

Create a new workspace - terraform workspace new "name"
Switch to a specific workspace - terraform workspace select "name"

Debugging in terraform

Terraform have detailed logs that can be enabled by setting the TF_LOG environment value in the cli output. You can set it to TRACE, DEBUG, INFO , WARN or ERROR to change the verbosity of logs. 

To keep the logged output you have to set the TF_LOG_PATH.

Data sources 

This allows terraform to use/ fetch information defined outside of Terraform. 

Data "" aws_instances" "example" {}
Data "local_file" "abc" {
 filename = "${path.module}/demo.txt"
}

Data types in terraform -

String -  sequence of Unicode characters
Number - a number value
Bool - true or false
List - a sequence of values, [us-west-1],[us-west-2]
Set - a collection of unique values
Map - a group of values identified by named values {name = "mabel", age = 52}
Null - a value that represents absence or omission

Terraform modules

Instead of writing code from scratch we can use multiple ready made modules. We can call a module using module "resource_name" "source". After running terraform init the source code is downloaded and can be used. Local paths must start with ./ to indicate a local path. They do not support versions in local paths. Git repositories are prefixed using ::git, and can be specified by version argument.  This will use the default branch in the repo and can be overridden using ?ref=<version-number> .

Root module vs child module

Root modules reside in the main directory on your terraform config, the entry point for your infrastructure definition. A module being called by another module is often referred to as a child module. A child module can use outputs to expose a subset of its resource attributes to a parent module in the format <module name>.<output name>.

Terraform registry 

This hosts the public available terraform modules, each terraform module has an associated address using the syntax hostname/namespace/name/system. 

Requirements for publishing public modules in registries - 
    - GitHub public repo
    - Follows naming structure: terraform-provider-resource-name i.e. terraform-aws-aws-ec2-instance
    - Repo description 
    - Standard module structure 
    - X.y.z tags for releases i.e. v1.9.3 or 1.3.2

Terraform console 

Terraform console provides an interactive environment to test functions before integrating them into your main code. 

Functions in terraform

The terraform language includes built in functions you can use to transform and combine values. 

Numeric functions - abs, ceil, floor, max, min 
String functions - concat, replace, split, join, tolower.toupper
Collection functions - element, keys, length, merge, sort, slice
Filesystem functions - file, filename64, dirname

Lookup - retrieves the value of a single element from a map given a key
Zipmap - constructs a map from a list of keys and a correspending list on values. 
Index - finds the element index for a given value in a list
Element - retrieves a single element from a list 
Toset - converts the list to a set 
Timestamp - returns a UTC timestamp
File - references to a file 

Meta arguments 

Allows some details of this standard resource behaviour to be customized on a per resources basis. 

Depends_on - dependencies that terraform cannot automatically infer
Count - creates that many instances of a resource
For_each - a map or a set of strings and creates an instance for each item in that map or set
Provider - specifies which provider config to use for a resource overriding terraforms default behaviour

Lifecycle - allows modification of the resource lifecycle
    - Create_before_destroy - new replacement object is created first and the prior object is destroyed after the replacement is created
    - Prevent_destroy - terraform to reject with an error any plan that would destroy infra 
    - Ignore changes - ignore certain changes to a live resource that does not match the configuration
    - Replace_trigged_by - replaces the resource when any of the referenced items change 
    
Splat expressions allow us to get a list of all with the same attributes. Resources that use the For_each argument will appear in expressions as a map, so you cannot use splat expressions with those resources used as localname[*] similarly to Linux wildcard. 

Fetching values from list vs map 

List - reference key value number positioni.e. var.size[0,1,2,3]
Map - reference key name i.e. var.types["eu-west-2"]
 
Terraform graph

This allows us to have a visual representation of the dependency relationships between resources in our config. The output is in a DOT format which can easily be converted to an image. 

Terraform input variables 

Terraform input variables are used to pass certain values from outside of the configuration. This can be used in a variables file, terraform.tfvars file, command line and environment variables. This approach leads to easier setup for multi-project deployments. It is recommended to store credentials outside of terraform config in environment variables.   

You can specify individual variables on the command line using the -var option to make iterations without changing the config files - terraform plan/apply -var"resource=name". You can also set variables using TF_VAR_ followed by the name of the declared value. 

If you have multiple variable definitions files it can be overwritten so there is variable precendence -

    1) Environment variables - lowest
    2) Terraform.tfvars
    3) Terraform.tfvars.json
    4) *.auto.tfvars or *.auto.tfvars.json
    5) Any -var and -var-file options on the command line - highest 

If you variables with undefined values you will be prompted every time you run a plan to enter a value for the variable. Input variables are not stored in the state file, only output values will be stored in the state file.

Sensitive values

Sensitive = true 
Adding sensitive parameters ensure you do  accidentally expose this data in CLI output and log output. The sensitive value will be present in the state file. 

Local values

Locals are primary used when you want to repeat the same expression multiple times. Variables are for external input (flexible, user-defined values). Locals are for internal convenience (fixed or computed values within your code).

Locals {
Common_tags = team
Team = payments-team} --> local.team

Dynamic blocks 

Dynamic blocks allow us to dynamically construct repeatable nested blocks, which are supported inside resource, data, provider and provisioner blocks. If overused can be hard to read and maintain. An example for this would be a security group with 10+ rules can use the following to clean up the code and not repeat yourself - 

locals {
  ingress_rules = [
    { port = 80, protocol = "tcp", cidr = "0.0.0.0/0" },
    { port = 22, protocol = "tcp", cidr = "0.0.0.0/0" },
  ]
}

resource "aws_security_group" "my_sg" {
  name = "my-security-group"

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr]
    }
  }
}

HCP

A HCP workspace is linked to a version control repository (git, bitbucket) and runs start automatically when you merge or commit changes. A workspace is linked to one repository and ignores changes to other branches i.e. prod, dev. To protect secret values in HCP, you can mark as sensitive data using the checkbox when editing making it write-only and prevents everyone from viewing its value. 

    - Secure variable storage 
    - Private module registry
    - Remote state storage
    - Encryption of state file 


Terraform Enterprise

Enterprise provides several added advantages compared to HCP. Some of these include:

    - Single sign on
    - Auditing 
    - Private Data Center Networking
    - Clustering 

Team and governance feats are not available for HCP Free Tier. Sentinel is a policy as code framework integrated with the hashicorp enterprise products. Can be used to verify if a ec2 instance has tags or a s3 bucket has encryption enabled.

Terraform plan -> Sentinel checks -> Terraform apply

Air Gapped Environment 

For enterprise users, they can install terraform in an air gapped environment not connected to the public internet. 

Dealing with larger infrastructure 

Cloud providers have set a certain rate limit so Terraform can only request a certain number of resources over a period of time. It is important to break larger configurations into multiple smaller configs to independently applied. 