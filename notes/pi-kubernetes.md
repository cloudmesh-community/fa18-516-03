# Notes about work on pi-kubernetes

## Overview
There are many sections in the book about pi and kubernetes. Currently there are
two complete sections in 
[chapters/pi/clusters/pi-kubernetes](https://github.com/cloudmesh-community/book/blob/master/chapters/pi/clusters/pi-kubernetes.md).
I believe these are merges of
the content under
[pi/kubernetes](https://github.com/cloudmesh-community/book/tree/master/chapters/pi/kubernetes).

# Note says Docker can't use swap, but Docker can, kubernetes can't
Should just disable swap for Docker

* [Kubelet no swap](https://github.com/kubernetes/kubernetes/issues/7294)
* [Can Kubernetes swap](https://stackoverflow.com/questions/36517472/is-it-possible-to-add-swap-space-on-kubernetes-nodes)
* [Docker: disable swap](https://docs.docker.com/config/containers/resource_constraints/#--memory-swap-details)


# Kubernetes on PI

* [From Hypriot people](https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster/)
* [Kubernetes documentation](https://kubernetes.io/docs/setup/independent/install-kubeadm/)
* [Kubernetes on PI lite](https://gist.github.com/alexellis/fdbc90de7691a1b9edb545c17da2d975)

# Issues installing on new stretch

Setting up aufs-dkms (4.9+20161219-1) ...
Loading new aufs-4.9+20161219 DKMS files...
It is likely that 4.14.79-v7+ belongs to a chroot's host
Building for 3.6-trunk-rpi, 4.14.79+ and 4.14.79-v7+
Building initial module for 3.6-trunk-rpi
Error!  The dkms.conf for this module includes a BUILD_EXCLUSIVE directive which
does not match this kernel/arch.  This indicates that it should not be built.
Skipped.
Module build for kernel 4.14.79+ was skipped since the
kernel headers for this kernel does not seem to be installed.
Module build for kernel 4.14.79-v7+ was skipped since the
kernel headers for this kernel does not seem to be installed.
Setting up linux-headers-3.6-trunk-rpi (3.6.9-1~experimental.1+rpi7) ...
Examining /etc/kernel/header_postinst.d.
run-parts: executing /etc/kernel/header_postinst.d/dkms 3.6-trunk-rpi
Error!  The dkms.conf for this module includes a BUILD_EXCLUSIVE directive which
does not match this kernel/arch.  This indicates that it should not be built.

