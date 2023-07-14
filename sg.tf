resource "aws_security_group" "allow_dynamic_ports" {
  name        = "allow_dynamic_ports"
  description = "Allow Dynamic Ports"


  dynamic "ingress" {
    for_each = var.dyport
    iterator = port
    content {
      description = "Allow Dynamic Ports"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }
  tags = {
    Name = "allow_dynamic_port"
  }
}