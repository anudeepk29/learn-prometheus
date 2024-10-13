
output "public_ip"{
    value = [aws_instance.vishal[*].public_ip]
}