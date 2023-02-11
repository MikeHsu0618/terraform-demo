output "instance_azs" {
  value = data.aws_availability_zones.demo-azs.names
}