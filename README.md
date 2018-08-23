Zcash for Docker
================

Docker image that runs the Zcash node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. Vultr, Digital Ocean, KVM or XEN based VMs) running Ubuntu 14.04 or later (*not OpenVZ containers!*)
* At least 4 GB to store the block chain files
* At least 1 GB RAM + 2 GB swap file

Recommended and tested on Vultr 1024 MB RAM/320 GB disk instance @ $8/mo.  Vultr also *accepts Bitcoin payments*!  May run on the 512 MB instance, but took *forever* (1+ week) to initialize due to swap and disk thrashing.


Really Fast Quick Start
-----------------------

Quick Start
-----------

1. Create a `zcash-data` volume to persist the zcash blockchain data, should exit immediately.  The `zcash-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=zcash-data
        docker run -v zcash-data:/dash --name=zcash-node -d \
            -p 8232:8232 \
            dashpay/zcash

2. Verify that the container is running and zcash node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        d0e1076b2dca        temonich/zcash:latest         "zcash_oneshot"      2 seconds ago       Up 1 seconds        127.0.0.1:8232->8232/tcp				 zcash-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f zcash-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* To run in testnet, add environment variable `TESTNET=1` to `docker run` as such:

        docker run -v zcash-data:/dash --name=zcash-node -d \
            --env TESTNET=1 \
            -p 8232:8232 \
            dashpay/zcash

* Additional enviroments with default values:

          --env TESTNET=1
	  --env ADDNODE=mainnet.z.cash
	  --env RPCBIND=0.0.0.0
	  --env RPCALLOWIP=0.0.0.0/0
	  --env RPCUSER=ZcashUserName
	  --env RPCPASSWORD=YouSecPass
	  --env RPCPORT=8232

* Folder for NET params and Data
	/home/zcash/.zcash-params/
	/home/zcash/.zcash/