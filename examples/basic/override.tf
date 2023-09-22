# Make sure we're using working version (from local directory, not git).

module "vm_bastion" {
  source = "./../.."
}

module "network" {
  source = "/Users/stawi/work/opsd/terraform-module-aws-network"
}
