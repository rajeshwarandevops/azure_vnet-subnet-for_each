# make sure terraform CLI is installed
terraform

# format the tf files
terraform fmt -recursive

sleep 5
# initialize terraform Azure modules
terraform init

# validate the template
terraform validate

sleep 5
# plan and save the infra changes into tfplan file
terraform plan -out tfplan

sleep 5

# # show the tfplan file
# terraform show -json tfplan
# terraform show -json tfplan >> tfplan.json
# #sleep 5

# terraform show -json tfplan | ./jq-win64.exe '.' > tfplan.json

# # show only the changes
# cat tfplan.json | ./jq-win64.exe -r '(.resource_changes[] | [.change.actions[], .type, .change.after.name]) | @tsv'
# cat tfplan.json | ./jq-win64.exe '[.resource_changes[] | {type: .type, name: .change.after.name, actions: .change.actions[]}]' 


# # Plan the infra changes
# # terraform plan tfplan

# # apply the infra changes
# #terraform apply tfplan
# sleep 5

# # cleanup files
# #rm tfplan
# #rm tfplan.json
# #rm tfplan.json~
