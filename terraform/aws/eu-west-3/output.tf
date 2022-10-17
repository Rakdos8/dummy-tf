resource "local_file" "ansible_inventory" {
  filename             = "../../../ansible/inventory.inv"
  file_permission      = "0640"
  directory_permission = "0750"

  content = templatefile(
    "template/inventory.tmpl",
    {
      dummyNodes = aws_instance.dummy.*.public_ip
    }
  )
}
