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