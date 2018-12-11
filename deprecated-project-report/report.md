# Raspberry PI Cluster Report :hand: fa18-516-03

| Jonathan Branam
| jobranam@iu.edu
| Indiana University
| hid: fa18-516-03
| github: [:cloud:](https://github.com/cloudmesh-community/fa18-516-03/blob/master/project-report/report.md)
| code: [:cloud:](https://github.com/cloudmesh-community/cm-burn)
| code: [:cloud:](https://github.com/cloudmesh-community/pi)

---

Keywords: Cloud, Cluster, Raspberry PI, Kubernetes

---

## Abstract

The Raspberry Pi offers a unique platform for developing and exploring cluster
computing in a small form factor and for a minimal cost. A single Pi computer
can be purchased for around $35 USD and a large cluster can therefore be built
with minimal investment. In this project I improved the existing support for the
`cm-burn` tool to setup an SD card for the Pi and also installed and ran
experiments on Kubernetes on the Raspberry Pi. I also created a new set of tools
to help setup a Raspberry Pi for use in cluster computing.

## Introduction

## Requirements

A network of 4-5 Raspberry Pi computers is recommended to fully experiment with
the cluster setup and running different pods across the Kubernetes cluster. We
devote one of the Pis to serve as the Kubernetes master node and so a minimum of
three other Pis makes the experiment interesting. In addition to the Raspberry
Pis themselves, you will need a power supply and networking cables for our
preferred setup. A small 5- or 8-port network hub is also used for connecting
the Pis together and joining a local network. You may also with to purchase or
build individual cases or a cluster case for the Pis in order to handle them
more conveniently.

In order to use the `cm-burn` tool you must use an operating system that
supports the ext file system. Currently only Linux has native support for ext,
so if you are using Windows or macOS then you must purchase a 3rd-party ext
file system driver. The most commonly used driver is provided by 
[Paragon Software](https://paragon-software.com)
and is $20 USD for the Windows version and $40 USB for the macOS version.

## Design

This project is designed to test the setup and performance of a Kubernetes
cluster running on a set of Raspberry Pi tiny computers. The Raspberry Pis run a
64-bit ARM processor at 1.2GHz with 1GB RAM. They have builtin micro SD Card,
USB, Ethernet, Bluetooth, WiFi, and HDMI connections. The operating system and
storage for the Pi is loaded onto a micro SD Card which limits the overall
system capacity. However, using the USB connections a larger external hard drive
can be attached to improve their storage capacity.

The design of this cluster is to install the Kubernetes packages onto each of
five Raspberry Pi computers and additionally to setup one of them as the cluster
master. The other four Pis will then connect to the cluster master to receive
their commands. Each computer in a Kubernetes cluster is called a node and each
running application is called a pod. Each pod will always be deployed on the
same node, that is, on the same computer. A pod may be comprised of one or
several containers that are closely related or share a resource such as disk
access. An example of a pod might be a database instance or an application
instance. A database and application container should usually never be combined
into a single pod but rather made as two pods so that they can be hosted on
different nodes (computers) to more efficiently utilize resources. Also, the
application instances can then be scaled when the database does not need to be.

As part of this project several different pods will be started on the Kubernetes
cluster to demonstrate how to start and stop different services. These pods will
use the Docker container system which is standard with Kubernetes, although
other container solutions are supported.

## Architecture

## Dataset

## Implementation

To test the Kubernetes performance on the Raspberry Pis I installed a Python
function through OpenFaas. I followed the instructions to
[deploy OpenFaas on Kubernetes](https://docs.openfaas.com/deployment/kubernetes/).
Since Helm/Tiller don't seem to be well supported on ARM yet, I used the YAML
setup option to deploy OpenFaas on Kubernetes.

```bash
$ git clone https://github.com/openfaas/faas-netes
$ sudo kubectl apply -f faas-netes/namespaces.yml
$ sudo kubectl apply -f faas-netes/yaml_armhf/
$ sudo kubectl get nodes -n openfaas
```

Once the system is running and all nodes are Ready we can deploy some of the
functions.

```bash
$ # ? git clone https://github.com/openfaas/faas-cli
$ curl -sL https://cli.openfaas.com | sudo sh
$ git clone https://github.com/openfaas/faas
$ cd faas
$ faas-cli deploy -f stack_arm.yml -g 10.0.0.101:31112
$ echo -n "Test" | faas-cli invoke echoit -g http://127.0.0.1:31112
```

From my computer:
```bash
$ ssh -L 8080:127.0.0.1:31112 pi@blue00
```

Then I can open <http://127.0.0.1:8080/ui/> to view the OpenFaas Portal.

## Benchmark

Download, load, and process the NYC Green Taxi data from 2017. Available here

```
https://s3.amazonaws.com/nyc-tlc/trip+data/green_tripdata_2014-01.csv
...
https://s3.amazonaws.com/nyc-tlc/trip+data/green_tripdata_2014-12.csv
```


## Conclusion

## Acknowledgement
