#!/bin/bash

ZCASH_CONF="$HOME/.zcash/zcash.conf"

if ! [ -f "$ZCASH_CONF" ]; then
	mkdir -p $HOME/.zcash/
	echo "testnet=${TESTNET:-0}" > ${ZCASH_CONF}
	echo "addnode=${ADDNODE:-mainnet.z.cash}" > ${ZCASH_CONF}
	echo "rpcbind=${RPCBIND:-0.0.0.0}" > ${ZCASH_CONF}
	echo "rpcallowip=${RPCALLOWIP:-0.0.0.0/0}" > ${ZCASH_CONF}
	echo "rpcuser=${RPCUSER:-zcashrpc}" > ${ZCASH_CONF}
	echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ${ZCASH_CONF}
	echo "rpcport=${RPCPORT:-8232}" >> ${ZCASH_CONF}
fi


ZCASH_PARAMS="$HOME/.zcash-params/sprout-verifying.key.dl"
if ! [ -f "$ZCASH_PARAMS" ]; then
	zcash-fetch-params
fi

zcashd

