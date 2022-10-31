# terraform-k8s

spin-up cluster

terraform plan -out "plans/m.tfplan" -var "subscription_id=$sub" -var "tenant_id=$tenant" -var "ssh_key=$key"

$tenant="76a2ae5a-9f00-4f6b-95ed-5d33d77c4d61"
$sub="5c75785e-25fb-4be9-a33c-7440b2f81783"
$key = $(cat C:\Users\mhutnik\.ssh\kub.pub)