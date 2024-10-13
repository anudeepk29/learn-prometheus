


resource "aws_instance" "vishal" {
  ami           = "ami-09da212cf18033880"
  instance_type = "t2.micro"
  key_name = "keyPair"
  # count = 2

  tags = {
    Name = "HelloWorld"
  }
  user_data = <<-EOF
              #!/bin/bash
              # Update and install Apache web server
              # sudo yum update -y
              wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
              tar xvfz node_exporter-*.*-amd64.tar.gz
              cd node_exporter-*.*-amd64
              ./node_exporter

              EOF

}