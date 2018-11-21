# Raspberry PI Cluster Report :hand: fa18-516-03

| Jonathan Branam
| jobranam@iu.edu
| Indiana University
| hid: fa18-516-03
| github: [:cloud:](https://github.com/cloudmesh-community/fa18-516-03)
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
file system driver. The most commonly used driver is provided by Paragon Systems
and is $20 USD for the Windows version and $40 USB for the macOS version.

:o: TODO: Add links to Paragon

## Design

## Architecture

## Dataset

## Implementation

## Benchmark

## Conclusion

## Acknowledgement

## Markdown Syntax

In [@vonLaszwski-fa18-sample-report] we can find a sample report.

+@fig:fromonetotheorther shows a nice figure exported from Powerpoint
to png. If you like you can use this as a basis for your drawings.

![A simple flow chart](images/from-one-to-the-other.png){#fig:fromonetotheorther}

Figures must not be cited with an explicit number, but automated
numbering must be used. Here is how we did it for this paper:

```
+@fig:fromonetotheorther shows a nice
figure exported from Powerpoint to png.
If you like you can use this as a basis
for your drawings.

![A simple flow chart](images/from-one-to-the-other.png){#fig:fromonetotheorther}
```

If the figure is copied form another source you MUST use a citation in the caption. 

![A simple flow chart [@vonLaszwski-fa18-sample-report]](images/from-one-to-the-other.png){#fig:fromonetotheorther}

This is done as follows

```
![A simple flow chart [@vonLaszwski-fa18-sample-report]](images/from-one-to-the-other.png){#fig:fromonetotheorther}
```

