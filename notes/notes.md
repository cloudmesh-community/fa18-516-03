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

  * How to organize PI networking sections?
    * In `setup-ultimate.md`
    * 7.7 Setting up a small cluster with cm-burn
    * Setup for single PI
      * One without cm-burn
      * One with cm-burn
    * Network of Workstations
      * Uses cm-burn
    * Move all setup of multiple PIs to NOW section
    * How to use tmux
    * cm-burn
    * Setup the DMZ with another NAT
    * Assign IP addresses all at the beginning for each cluster.
    * Could track HW ARP addresses in the database
  * On the dev PC
    * REST service
    * Put Docker swarm on the entire cluster
    * Next day, replace Docker Swarm with Kubernetes
    * How to enable/disable the services

  * Make sure Gregor can read documentation and build a cluster


## 12/04/2018 Finish PI book cleanup

### Scanning for computers on network

Some guides recommend sending a ping to the broadcast address of your network
but Raspbian ignores broadcast pings by default so the Raspberry Pis will not
respond to this and then will not show up in arp tables. `nmap` will work,
however.

Note that name lookup depends on DHCP on your DHCP server. The Pi will broadcast
its hostname to the DHCP server when it requests an IP address as long as the Pi
has been setup properly. However, if you manually assign IP addresses then DHCP
is not used and therefore you will not be able to use the hostname
automatically. For static networking you will need to edit `/etc/hosts` on every
computer to have an entry for each Pi or manually enter hostnames on your
router.

This works on a Pi:

```bash
$ sudo apt-get install -y nmap
$ nmap -sn 10.0.0.0/24
# will list all devices on the network
$ arp -a
# will list devices in arp cache and lookup hostname
$ arp -a -n
# Same as previous but skips hostname lookup
```

For example you can find the hostname of all `blue` servers with:

```bash
$ nmap -sn 10.0.0.0/24
$ arp -a | grep '^blue'
blue02.hsd1.in.comcast.net (10.0.0.21) at b8:27:eb:35:9c:e2 [ether] on wlan0
```

As long as you are on the same domain, you can connect to this Pi by just using
the first part of the full hostname `blue02`.

`nmap` is also available on macOS. It can be downloaded directly from 
[Nmap installation instructions](https://nmap.org/book/inst-macosx.html) or
using Homebrew as `brew install nmap`.

  * [nmap host discovery](https://nmap.org/book/man-host-discovery.html)

For network tasks, `dig` and `nslookup` are part of `dnsutils`:

```bash
$ sudo apt-get install -y dnsutils
```

Ask the nameserver if it has an entry for a host:

```bash
$ dig blue02 @10.0.0.1
```

### DHCP

Renew lease. This will kill your connection if you are using it but it should
come back after the lease renews.

```bash
$ sudo dhclient -r -v wlan0; sleep 10; sudo dhclient wlan0
```

## TODO
  * Chapter 6: Raspberry PI Setup (small number of Pis)
    * `setup-ultimate.md`
    * 6.3 Setup by hand
      * [x] 6.3.5 Wireless Network at Home update with wpa_passphrase setup
    * 6.4 Setting up a Small Cluster by Hand
      * [ ] Refer to NOW section
      * [ ] Is there another section like this?
        * Yes, in `clusters/pi-kubernetes.md`
      * [ ] 6.4.1 Wireless network addresses by hand
      * [ ] 6.4.2 Static network addresses by hand
      * [ ] 6.4.3 Mixed wireless and static network
    * 6.6.2 Post configuration
      * [ ] Generate and copy keys from Pis to each other so they can all login
        without passwords. At least to the master.
    * 6.7 Setting up a small cluster with cm-burn
      * [ ] this is totally empty!
    * 6.8 Setting up a large cluster with cm-burn
      * [ ] this should be a link to chapter 7 `setup-multiple.md`
          Setting up Large PI clusters :o: :hand: fa18-516-23
  * 6.15 `setup-dev.md`
    * [ ] Update Python 2 and 3 versions
    * [ ] Explain how to install `pip` and `pip3`
  * 7-8 `setup-multiple.md`
    * really needs attention but it's marked `fa18-516-23`
  * 9.1 Cluster Setup `setup.md`
    * looks mostly useless
  * 10.1 Network of Pis (NOW) `clusters/pi-now.md`
    * [ ] Copy/move/write cluster setup to here.
    * [ ] Move from `clusters/pi-kubernetes.md` Raspberry Pi Cluster Setup
      * Mostly about DHCP and using `rpcluster`
    * [ ] Setup small cluster by hand
    * [ ] Three networking options: all on network, route through wifi or usb
      ethernet
    * [ ] Setup small cluster with `cm-burn`
    * [ ] Setup large cluster with `cm-burn` (copy and fix `setup-multiple.md`)
    * [ ] Describe setup using [cm-com/pi](https://github.com/cloudmesh-community/pi.git)
      * Setup locale is important
  * Awesome TODOs
    * [ ] Write script for Docker Swarm install
    * [ ] Write script for Spark install
    * [ ] Update Hadoop install
    * [ ] Why isn't there an OpenFaas for Pi?






