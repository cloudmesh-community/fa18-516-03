# Notes for E516

## Resources:

* [516 signup sheet](https://docs.google.com/spreadsheets/d/1muSL3jbAiydonj5vX3X4nVOCOpxG9OgczP1dCwh85dw/edit#gid=0)
* [516 Piazza](https://piazza.com/class/jgxybbf5rnx5qd)
* [cloudmesh-community / book](https://github.com/cloudmesh-community/book)
* [book / pi](https://github.com/cloudmesh-community/book/tree/master/chapters/pi)
* [pi / kubernetes](https://github.com/cloudmesh-community/book/tree/master/chapters/pi/kubernetes)
* [YAML Syntax from Ansible](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html)
* [YAML Syntax from Wikipedia](https://en.wikipedia.org/wiki/YAML)
* [YAML Validator](https://codebeautify.org/yaml-validator)

# TODO
* Install libcloud
* Read MQTT section

## Section sign-up details:
### Legend
 * :o: `:o:` section not yet released
 * :question: `:question:` section can be improved by student
 * :hand: `:hand:` section taken by studen (put hid bellow heading)
 * :smiley: `:smiley:` section marked ready by students for grading. We keep it in this
   state for a whileso other students can review and contribute
 * :wave: `:wave:` TAs or other students suggest a modification.
 * :+1: `:+1:` section is graded, grade is not posted on web 

## Students with good PI info

* [hid-sp18-412](https://github.com/cloudmesh-community/hid-sp18-412)

## Some other interesting projects

### Cloudmesh v4
David D working on `cm` tool for tracking files across clouds.
* [Piazza description](https://piazza.com/class/jgxybbf5rnx5qd?cid=142)
* [cloudmesh-community / cm](https://github.com/cloudmesh-community/cm)
* [davidmdem / cm](https://github.com/cloudmesh-community/cm)
* [Google Drive CLI Client](https://github.com/prasmussen/gdrive)

## 10/22/18 Gregor

### Take over NOW
### Update cm-burn images with the new network diagram
### Access internet from PIs
      * At IU internet the PIs cannot directly access the internet
### Use a cluster over a single ssh
      * pdsh
      * cssh
### Boot 100 PIs on Chameleon Cloud

# PI Master-Cluster setup

## Need another NIC

For setting up the PIs as a cluster we need some device that has two NICs,
either two Ethernet ports or an Ethernet and a WiFi connection. Ideally, we
would use wired connections for everything, but this is problematic for the PIs
since they only contain one Ethernet port.

One idea is to buy a USB-Ethernet adapter and use it on the master PI to be able
to connect to both networks. This seems like the most stable solution. There are
some notes about [NIC naming changes in Raspbian
Stretch](https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/)
and also a list of [RPi compatible USB Ethernet
adapters](https://elinux.org/RPi_USB_Ethernet_adapters).

## Virtual Networking

I thought maybe I could just setup a virtual Ethernet so the Master PI could be
on two networks at the same time. This might work, but there is still a problem
of assigned IP addresses to the rest of the PIs in the cluster. DHCP will be a
problem if the non-master PIs can access the real network. DHCP is first come
first served so we cannot ensure that a PI will get an IP address from the
Master or from some other DHCP server on the network. Therefore we would have to
manually assign IP addresses (which could clash when a cluster is combined) or
we must segregate the PI cluster from the external network by using a PI (or
other device) that has two NICs.

  * Linux virtual network interfaces
    * https://linuxconfig.org/configuring-virtual-network-interfaces-in-linux#h3-2-dhcp
    * https://stackoverflow.com/questions/2082722/how-do-i-create-virtual-ethernet-devices-in-linux
    * https://unix.stackexchange.com/questions/152331/how-can-i-create-a-virtual-ethernet-interface-on-a-machine-without-a-physical-ad

## Sync tmux ssh panes

<https://sanctum.geek.nz/arabesque/sync-tmux-panes/>

:setw synchronize-panes

## 10/29/2018 Gregor

  * 

