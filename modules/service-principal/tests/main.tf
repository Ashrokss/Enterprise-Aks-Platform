# Service principal creation - smoke test for the module
module "service_principal" {
  source                 = "../"
  service_principal_name = var.service_principal_name
}
