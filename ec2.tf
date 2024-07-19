data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "wordpresswebserver" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"

    tags = {
    Name = "WordpressWebserver"
    }
}