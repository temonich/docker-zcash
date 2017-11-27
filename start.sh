#!/bin/bash

ZCASH_CONF="$HOME/.zcash/zcash.conf"

if ! [ -f "$ZCASH_CONF" ]; then
	mkdir -p $HOME/.zcash/
	echo "addnode=mainnet.z.cash" > ${ZCASH_CONF}
	echo "rpcuser=username" >> ${ZCASH_CONF}
	echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ${ZCASH_CONF}
fi

zcash-fetch-params

zcashd
