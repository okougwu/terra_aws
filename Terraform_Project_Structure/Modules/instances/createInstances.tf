# Create Instance uisng Custom VPC
#Resource key pair
resource "aws_key_pair" "project_key" {
  key_name      = "project_key"
  public_key    = file(var.public_key_path)
}

#Secutiry Group for Instances
resource "aws_security_group" "ssh-sg" {
  vpc_id      = var.VPC_ID
  name        = "ssh-sg-${var.ENVIRONMENT}"
  description = "security group that allows ssh traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "ssh-sg"
    Environmnent = var.ENVIRONMENT
  }
}

# Create Instance Group
resource "aws_instance" "my-instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE

  # the VPC subnet
  subnet_id = element(var.PUBLIC_SUBNETS, 0)
  availability_zone = "${var.AWS_REGION}a"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}"]

  # the public SSH key
  key_name = aws_key_pair.project_key.key_name

  tags = {
    Name         = "instance-${var.ENVIRONMENT}"
    Environmnent = var.ENVIRONMENT
  }
}
