
------------------------------------------------------------
  INSTALL NVIDIA DRIVER
------------------------------------------------------------

Use the drivers with your OS or do it from:

https://www.nvidia.com/object/unix.html


------------------------------------------------------------
  PATCH NVIDIA DRIVER
------------------------------------------------------------

This patch removes the 2 transcode limit within the NVIDIA
drivers.

https://github.com/keylase/nvidia-patch


------------------------------------------------------------
  INSTALL DOCKER CE
------------------------------------------------------------

Do not use the built-in Docker packages, instead install
Community Edition from:

https://docs.docker.com/install/

------------------------------------------------------------
  INSTALL DOCKER COMPOSE
------------------------------------------------------------

Install docker-compose from your OS repo.

------------------------------------------------------------
  INSTALL NVIDIA DOCKER RUNTIME
------------------------------------------------------------

Install the NVIDIA docker drivers

https://github.com/NVIDIA/nvidia-docker

------------------------------------------------------------
  BUILD IT!
------------------------------------------------------------

Modify volumes.yaml to properly point to the drive location
of your Plex volumes, and then run:

	$ docker-compose -f volumes.yaml -f compose.yaml \
		up -d --build
