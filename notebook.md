# E516 Notebook
* Jonathan Branam

# Bio
Jonathan Branam was born in Muncie, IN, USA. He received the B.A. degree in
English from Ball State University, Muncie, IN, USA in 2005. From 2000 to 2002
he was a lead software engineer with LithTech, Inc. in Kirkland, WA, USA. From
2005 to 2007 he was a software architect with Ontario Systems, LLC. in Muncie,
IN, USA. From 2007 to 2008 he was a software consultant working remotely with
Cynergy Systems in Washington, D.C., USA. From 2008 to 2011 he was a senior
software engineer working remotely with EffectiveUI in Denver, CO, USA. From
2011 to 2016 he was a senior software engineer with JWeb Technologies, LLC in
Tianjin, China. He is currently Director of R&D with JWeb Technologies, LLC in
Muncie, IN, USA.

# Project ideas

## Raspberry PI Audio

Placing several raspberry pis in a conference room, meeting hall, etc.
that are equipped with microphones that record and perform initial
processing on the audio data to distinguish speakers and distance then
upload the processed audio signal to the cloud to be combined and
built into a cohesive recording of the event including speaker tags
and ability to isolate speakers and cut background noise.

## Raspberry PI cluster

Configure the 5 PI cluster to run kubernetes and write a Python
script to support routing jobs to the cluster. Use DocOpts and
allow user to specify: 

* folder to upload
* command to execute
* number of machines required
* timeout

# Week 1: 08/20/2018 - 08/26/2018

* Meetings
* Logistics
  * 08/21/2018 Posted bio to Piazza
* Theory
  * 08/26/2018 Read Cloud Computing - Introduction
* Practice
* Writing

# Week 2: 08/27/2018 - 09/02/2018

* Meetings
  * 08/31/2018 Attended class in person
    * Obtained 5 PI cluster (to return at end of semester):
      * 5 Raspberry PIs Model B
      * 5 USB mini power cables
      * 1 AC->USB power supply
      * 5 Ethernet cables
      * 1 8-port Ethernet Switch
      * 5 32gb Sandisk microSD cards
    * Discussed project ideas with professor
* Logistics
  * 08/26/2018 Read Cloud Computing - Tools
  * 08/26/2018 Read Cloud Computing - Python
* Theory
* Practice
  * 08/31/2018 Setup Github; created README.yml
  * 08/31/2018 Setup Virtualbox and Vagrant
  * 08/31/2018 Review linux commands and Python
* Writing

# Week 3: 09/03/2018 - 09/09/2018

* Meetings
* Logistics
  * 09/03/2018 Create notebook.md and add some details
* Theory
  * 09/06/2018 Read Cloud Computing - Data Center
* Practice
  * 09/05/2018 Setup futuresystems & Chameleon Cloud
  * 09/11/2018 Learn docopt by building some tools
* Writing

# Week 4: 09/10/2018 - 09/16/2018

* Meetings
* Logistics
* Theory
  * 09/15/2018 Read Cloud Computing - Architectures
* Practice
  * 09/15/2018 Install Raspbian and boot PI cluster
* Writing

# Week 5: 09/17/2018 - 09/23/2018

* Meetings
  * 09/17/2018 Attend office hours
* Logistics
  * 09/22/2018 Fix notebook.md format
* Theory
  * 09/22/2018 Read Cloud Computing - Infrastructure
* Practice
* Writing
  * 09/20/2018 Review contents of pi and pi2 directories

# Week 6: 09/24/2018 - 09/30/2018

* Meetings
* Logistics
* Theory
  * 09/29/2018 Read Cloud Computing - Virtualization
* Practice
* Writing

# Week 7: 10/01/2018 - 10/07/2018

* Meetings
  * 10/01/2018 Attend office hourse - discuss PI project
* Logistics
* Theory
* Practice
  * 10/03/2018 Use cm-burn to setup 5 PIs
  * 10/04/2018 Update cm-burn with new options, OS X fixes, improvements
* Writing

# Week 8: 10/08/2018 - 10/14/2018

* Meetings
* Logistics
* Theory
  * 10/11/2018 Read Infrastructure as a Service
* Practice
* Writing

# Week 9: 10/15/2018 - 10/21/2018

* Meetings
* Logistics
* Theory
* Practice
* Writing
  * 10/17/2018 Typos and grammar fixes for Virtualization Chapter
  * 10/18/2018 Merged all the separate notes for PI Kubernetes
  * 10/18/2018 Added pandoc-index requirement to preface.

# Week 10: 10/22/2018 - 10/28/2018

* Meetings
  * 10/22/2018 Discuss Raspberry PI with Gregor and diagnose problems with
    CircleCI setup for cloudmesh/technologies build process. Also find the way
    to update a fork using the Github Web UI
* Logistics
* Theory
* Practice
* Writing
  * 10/27/2018 Setting up a single large cluster with cm-burn

# Week 11: 10/29/2018 - 11/04/2018

* Meetings
  * 10/29/2018 Discuss PI networking and Kubernetes next steps
* Logistics
* Theory
* Practice
* Writing

# Week 12: 11/05/2018 - 11/11/2018

* Meetings
* Logistics
* Theory
* Practice
* Writing

# Week 13: 11/12/2018 - 11/18/2018

* Meetings
* Logistics
* Theory
* Practice
* Writing

# Week 14: 11/19/2018 - 11/26/2018

## Thanksgiving!

* Meetings
* Logistics
* Theory
* Practice
  * Fixed cm-burn `pip install .` issues
    1. `cm-burn.py` had to be renamed to `cmburn.py` due to Python's module naming
       rules.
    2. `pyyaml` needed to be added as a dependency in `setup.py`.
* Writing

