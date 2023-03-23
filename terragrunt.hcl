terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var-file=secret.tfvars"
    ]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["/bin/bash", "backend.sh"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan"]
    execute      = ["echo", "Upload Terraform state file to remote container"]
  }
}

#generate "versions" {
#  path = "versions.tf"
#  if_exists = "overwrite_terragrunt"
#  contents = <<EOF
#terraform {
#  required_version = ">= 1.0.0"
#
#  required_providers {
#    openstack = {
#      source  = "terraform-provider-openstack/openstack"
#      version = "~> 1.49.0"
#    }
#  }
#}
#EOF
#}
