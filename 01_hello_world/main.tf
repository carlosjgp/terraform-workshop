/*
 * # 01 hello_world
 */


terraform {
  required_version = ">= 0.13"
}

output "hello_world" {
  value = "Hello, World!"
}