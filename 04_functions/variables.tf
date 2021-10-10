variable "test" {
  description = "testing variable to print as `output`"
  type        = string
  sensitive   = false
  validation {
    condition     = length(var.test) > 4
    error_message = "The `test` variable has to be longer than 4 characters."
  }
  validation {
    condition     = !can(regex("^.*\\.$", var.test))
    error_message = "The `test` variable can not end on a dot `.`."
  }
}
