module "my_key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "my-key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCXhqpHj3IRI1AV+sGh7H4n9PMZV/+S01cJXWXMTrqNx6JN+82ssrVLYcoN5KAdG0eqdOZQmZxmdCPCW2V1zK42JKNJ4yR/R3kP8TXSthrI3zs6NNS6UwGjKULraSTk7DL9/feTQK4lYk758JV7X1zFn9xs6hTzIyYzH7ecm6pzRRPWTNgTHEyowDUoYwcRYL27K7xNaL6+yhz5AivloUBAuRRGAlRHd/jG2pqPL0y/I/4xsuNc7F6CzYkrwdygP4yok73nBA9b5TLjD4AbjyC7DTv+ORIMazWqNjAEV8Rby/uIE+yz9oId71mfng4sibRhXlblWu8WGfWf4+RqTfKd"

}