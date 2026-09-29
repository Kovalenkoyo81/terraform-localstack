resource "aws_instance" "this" {
  ami           = "ami-00000000"
  instance_type = var.instance_type

  tags = {
    Name        = "${var.app_name}-server"
    Environment = var.environment
  }
}
