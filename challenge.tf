# provisioner

resource "null_resource" "filename"{
    provisioner "local-exec" {
        command = "echo 'Message: ${upper("Hello World")}' > challenge.txt"
    }
}