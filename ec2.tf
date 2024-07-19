data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "wordpresswebserver" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.deham14-sg.id]
  key_name               = "vockey"
  subnet_id              = aws_subnet.public_subnet_1.id
  user_data              = file("userdata.sh")

  tags = {
    Name = "WordpressWebserver"
  }
}