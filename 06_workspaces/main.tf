/*
 * # 01 hello_world
 */


terraform {
  required_version = ">= 0.13"
}

locals {
  config = file("${path.module}/${terraform.workspace}.yaml")
  data   = yamldecode(local.config)
}

output "hello_world" {
  value = "Hello, World from ${terraform.workspace} workspace!"
}

output "config_data" {
  value = local.data
}

output "report" {
  value = <<-REPORT
    Planet report:
      - Name:               ${terraform.workspace}
      - Oceans:             ${local.data.oceans}
      - Atmosphere density: ${local.data.atmosphere_density}
REPORT
}
