This documents the information I have been able to collect
regarding getting NVIDIA decoding working in Plex within a Docker container.
The  information is available other places, so I'm not providing
or discovering some brand new process... this was my attempt
to build some documentation for my own personal use on how
to make it happen from one spot.

So instead of outlining a long, complex process within this
README, I am going to just state the high level steps and
refer to other pages/documents about the specific details
for those steps -- since they are already well documented.

I do provide some colorful commentary along the way though.

;)

For my implementation, I am using a GTX1660 that I picked up
from Microcenter in an open box for like $160 -- so well 
worth it.

------------------------------------------------------------
  INSTALL NVIDIA DRIVER
------------------------------------------------------------
Oddly enough, the first step to using NVIDIA graphics cards
within a Docker container is to install the NVIDIA drivers
for your graphics card.

Your OS may include drivers already, but if not you can 
download and install the drivers for your OS from NVIDIA
directly:

https://www.nvidia.com/object/unix.html

I originally tried to setup my UEFI to prefer the iGPU
instead of the NVIDIA card, and then hoping to leverage
the NVIDIA just for transcoding, but this didn't work for
me.  Keep this in mind if you're configured this way
and this process doesn't work.

------------------------------------------------------------
  PATCH NVIDIA DRIVER
------------------------------------------------------------
If you're running a consumer-grade card, NVIDIA
[artifically] limits the number of transcodes the graphics
card can handle to 2 via a setting in the drivers.

Fortunately someone has discovered this configuration
setting and has written a script to patch the driver to
remove this limitation.  You can view
This patch removes the 2 transcode limit within the NVIDIA
drivers.

https://github.com/keylase/nvidia-patch

NO WARRANTY EXPRESSED OR IMPLIED

------------------------------------------------------------
  INSTALL DOCKER CE
------------------------------------------------------------
Further on in the document, we install the NVIDIA docker
runtime packages.  This NVIDIA runtime recommends using
the latest Docker Community Edition (CE) instead of what may
be packaged within your OS.  So if you choose to use your
OS's version, YMMV.

https://docs.docker.com/install/

------------------------------------------------------------
  INSTALL NVIDIA DOCKER RUNTIME
------------------------------------------------------------
NVIDIA provides a special runtime to hook NVIDIA drivers of
the host into a Docker container.  Details on making this
happen are within the URL below, but the compose.yaml within
this repository provides the necessary parameters to make
this happen, too.

https://github.com/NVIDIA/nvidia-docker

------------------------------------------------------------
  INSTALL DOCKER COMPOSE
------------------------------------------------------------

Install docker-compose from your OS repo.  I use docker-
compose because I feel it's more comprehensive than a basic,
traditional Dockerfile (although I also use a Dockerfile 
within this setup to inject some custom container startup
scripts).

------------------------------------------------------------
  CONFIGURE AND BUILD IT!
------------------------------------------------------------
Here is where you need to modify volumes.yaml and compose.yaml
to reflect your environment.  The volumes.yaml I provide are
for *my* setup which is where the media files, plex
configuration, etc. exist on a FreeNAS box connected via NFS.
Your chosen setup may be different.

Once the changes to the *.yaml files are complete, you can
run this docker-compose command to set everything up:

	$ docker-compose -f volumes.yaml -f plex.yaml \
		up -d --build

Optionally, you can also create/modify your own network
configuration, too.  If you wanted to do this, and include
it when you run docker-compose, just add '-f network.yaml'
to your command.

Also optionally, you can run tautulli at the same time by
adding '-f tautulli.yaml'.

------------------------------------------------------------
  MONITOR CONTAINER STARTUP
------------------------------------------------------------
You may want to monitor the startup of your container:

	$ docker logs -f plex

------------------------------------------------------------
  RUNNING A SHELL WITHIN THE CONTAINER
------------------------------------------------------------
Basic docker stuff, but in case you didn't know:

	$ docker exec -ti plex /bin/bash


