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
  key_name       = data.aws_key_pair.std.key_name

  vpc_security_group_ids = [
    data.aws_security_group.std_sg.id
    aws_security_group.sg_node_exporter.id
  ]
}

resource "aws_security_group" "sg_node_exporter" {
  name = "node_exporter"
  vpc_id = data.aws_vpc.std_vpc.id

  egress {
    from_port = 9100
    protocol  = "-1"
    to_port   = 9100
  }
}
