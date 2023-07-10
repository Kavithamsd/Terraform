data "aws_subnet" "filtered_subnet" {
  filter {
    name   = "tag:Name"
    values = ["publicsubnet"]  
  }
}

data "aws_security_group" "filtered_sg" {
  filter {
    name   = "tag:Name"
    values = ["sg"]
         } 
}
resource "aws_instance" "new_instance" {
  ami           = "ami-0310483fb2b488153"
  instance_type = "t2.micro"

  subnet_id     = data.aws_subnet.filtered_subnet.id
  vpc_security_group_ids = [data.aws_security_group.filtered_sg.id]
}
