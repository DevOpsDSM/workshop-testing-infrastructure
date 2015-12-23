
resource "digitalocean_ssh_key" "default" {
    name = "Testing Server"
    public_key = "${file("id_rsa.pub")}"
}

resource "digitalocean_droplet" "db" {
    count = "${var.instance_count}"

    image = "ubuntu-14-04-x64"
    name = "db-${count.index}"
    region = "nyc2"
    size = "512mb"
    ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

output "ips" {
    value = "\n${join("\n", digitalocean_droplet.db.*.ipv4_address)}"
}

resource "template_file" "setup" {
    template = "${file("scripts/setup.sh")}"
}

resource "null_resource" "setup" {
    depends_on = ["digitalocean_droplet.db"]
    count = "${var.instance_count}"

    triggers {
        SETUP = "${template_file.setup.rendered}"
    }

    connection {
        user = "root"
        host = "${element(digitalocean_droplet.db.*.ipv4_address, count.index)}"
        key_file = "id_rsa"
    }

    provisioner "remote-exec" {
        inline = "${template_file.setup.rendered}"
    }
}
