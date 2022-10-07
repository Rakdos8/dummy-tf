data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-0493936afbe820b28"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "std" {
  key_name = "std"
}

data "aws_security_group" "std_sg" {
  id = "sg-0786c97402c28f62e"
}

resource "aws_instance" "dummy" {
  ami = data.aws_ami.ubuntu.id

  instance_type  = "t2.micro"
  instance_state = "running"
  key_name       = data.aws_key_pair.std.key_name

  vpc_security_group_ids = [
    data.aws_security_group.std_sg.id
  ]
}
