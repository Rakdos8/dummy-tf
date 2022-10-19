build {
  sources = [
    "source.amazon-ebs.basic-ebs"
  ]

  provisioner "ansible" {
    user          = "ubuntu"
    galaxy_file   = "../../ansible/playbooks/roles/requirements.yml"
    playbook_file = "../../ansible/playbooks/init-stack.yml"
  }
}

source "amazon-ebs" "basic-ebs" {
  ami_name      = "{{ timestamp }}_custom_ubuntu"
  region        = "eu-west-3"
  instance_type = "t2.micro"
  communicator  = "ssh"
  ssh_username  = "ubuntu"

  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "Ubuntu 20.04.*"
      root-device-type    = "ebs"
    }

    owners      = ["099720109477"] # Canonical Group Limited
    most_recent = true
  }
}
