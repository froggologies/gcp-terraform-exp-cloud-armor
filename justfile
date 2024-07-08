set dotenv-load

set-bucket:
  #!/usr/bin/env bash
  terraform_backend_bucket=$(terraform -chdir="00-root" output -raw "terraform_backend_bucket")
  backend="terraform {
    backend \"gcs\" {
      bucket = \"${terraform_backend_bucket}\"
      prefix = \"terraform/resources\"
    }
  }"
  printf '%s\n' "$backend" |
  tee >(sed "s|prefix = .*|prefix = \"terraform/api\"|" > '01-api/backend.tf') |
  sed "s|prefix = .*|prefix = \"terraform/resources\"|" > '02-resources/backend.tf'

set-project:
  #!/usr/bin/env bash
  main_project_id=$(terraform -chdir="00-root" output -raw "main_project_id")
  project_id="project_id = \"\""
  printf '%s\n' "$project_id" |
  sed "s|project_id = .*|project_id = \"${main_project_id}\"|" |
  tee '01-api/terraform.tfvars' '02-resources/terraform.tfvars'

root +action:
  @terraform -chdir="00-root" {{action}}

api +action:
  @terraform -chdir="01-api" {{action}}

resources +action:
  @terraform -chdir="02-resources" {{action}}