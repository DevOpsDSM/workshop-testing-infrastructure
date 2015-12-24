# testing infrastructure workshop

This repo is used in infrastructure testing workshops.

## Types of Tests

 - [Configuration management testing](config-management/README.md)
 - TODO: Service status testing
 - TODO: Integration testing

## Pre Workshop setup

These are notes for how the workshop virtual machines were setup.

The workshop format is to all use a pool of virtual machines. These machines
are all preconfigured and setup to include the base software that you would
need to complete the workshop. Once the machine IP address is given to you,
you will be able to ssh into the machine.

The machines are hosted on [Digital Ocean](https://www.digitalocean.com/)
and setup using [Terraform](https://terraform.io/)

If you are attending the workshop, you do not need to do the following, but
if you would like to setup your own machine:

__note__ be sure to not set a passphrase on the ssh key

```bash
$ ssh-keygen -f id_rsa
$ terraform apply
```

When this completes, you will get a list of IP addresses you may ssh into:

```bash
$ ssh -i id_rsa root@<IPADDRESS>
```

