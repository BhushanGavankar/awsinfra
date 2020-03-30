# Environment Variables
variable "region" {
    type = "string"
    default = "us-east-1"
} 
variable "zone" {
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]  
}
variable "instance_type" {
  type = "string"
  default = "t2.micro"
}
