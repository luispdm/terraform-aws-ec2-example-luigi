locals {
  instance_owner = "module-test"
  component      = "module-test"
  service        = "module-test"
  environment    = "test"
  name           = "${local.instance_owner}-terraform-test"

  tags = {
    Name        = local.name
    component   = local.component
    environment = local.environment
    service     = local.service
  }
}
