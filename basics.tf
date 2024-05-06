#Blocks 
/*
block_type "*"{
    attribute1 = value1
    attribute2 = value2
}

*/

/*
resource "aws_instance" "example"{
    ami = "ami-0iofjoe1223er23"
    instance_type = "t2.micro"
    count = 3
    enabled = true
}

# Attributes - key value pair

# Data Types


"strings"
number 1 2 3
boolean true false

-List


list = ["item1", "item2", "item3"]

security_groups = ["sg-dnf", "sg-fbejrnf"]


#-Maps
variable "example_map"{
    type = map
    default = {key1 = "value1", key2 = "value2"}
}

locals{
    my_map = {        name = "John",   age = 40,     is_admin = true    }
}

#get value
locals.my_map["age"]


# Conditions
resource "aws_instance" "server"{
    instance_type = var.environment == "development" ? "t2.micro" : "t2.medium"
}

# Functions
locals{
    name = "Ujjwal Jamuar"
    fruits = ["mango", "banana", "pineapple"]
    message = "Hello, ${upper(locals.name)}!, I know you like ${join(", ", locals.fruits)}"
}

# Resource Dependency

resource "aws_instance" "name of the instance" {
    vpc_security_group_ids = aws_security_group.mysg.id
}

resource "aws_security_group" "mysg" {
    #inbound rules
}

# provisioner

resource "null_resource" "filename"{
    provisioner "local-exec" {
        command = "echo 'Message: ${upper("Hello World")}' > challenge.txt"
    }
}

*/