provider "aws" {
    region = "eu-west-2"
}
resource "aws_instance" "example" {
    ami = "ami-09a1e275e350acf38"
    instance_type = "t2.micro"
}
