module "rg" {
    source = "../../child-module/rg"
    rgs=var.rgs
  
}

module "vnet" {
    source = "../../child-module/vnet"
    depends_on = [ module.rg ]
    vnets=var.vnets
  
}

module "subnet" {
    source = "../../child-module/subnet"
    depends_on = [ module.vnet ]
    subnets=var.subnets
  
}
module "pip" {
    source = "../../child-module/public_ip"
    pipes = var.pipes
    depends_on = [ module.rg ]
  
}
module "vm" {
    source = "../../child-module/vm"
    depends_on = [module.subnet]
    vms=var.vms
  
}