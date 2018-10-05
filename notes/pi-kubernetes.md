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


