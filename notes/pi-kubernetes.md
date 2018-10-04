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



