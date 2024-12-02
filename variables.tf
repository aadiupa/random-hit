variable "instance_name" {
  type = string
  description = "Name of an EC2 instance"
}

variable "instance_size" {
  type = string
  description = "Type of an EC2 instance. Allowed values are small, medium and large."
}
