set dotenv-load

root action:
    @terraform -chdir="00-root" {{action}}

_set-root-tfvars:
    @terraform -chdir=phase1 output > phase2/terraform.tfvars

api action: _set-root-tfvars
    @terraform -chdir=phase2 {{action}}