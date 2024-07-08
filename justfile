set dotenv-load

root action:
    @terraform -chdir="00-root" {{action}}
    @if [ "{{action}}" = "apply" ]; then \
        terraform_backend_bucket=$(terraform -chdir="00-root" output -raw "terraform_backend_bucket"); \
        sed -i "" "s|bucket = .*|bucket = \"${terraform_backend_bucket}\"|" "01-api/backend.tf"; \
        sed -i "" "s|bucket = .*|bucket = \"${terraform_backend_bucket}\"|" "02-resources/backend.tf"; \

        main_project_id=$(terraform -chdir="00-root" output -raw "main_project_id"); \
        sed -i "" "s|project_id = .*|project_id = \"${main_project_id}\"|" "01-api/terraform.tfvars"; \
        sed -i "" "s|project_id = .*|project_id = \"${main_project_id}\"|" "02-resources/terraform.tfvars"; \
    fi

api action:
    @terraform -chdir="01-api" {{action}}