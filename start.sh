#!/bin/bash

ZCASH_CONF="$HOME/.zcash/zcash.conf"

if ! [ -f "$ZCASH_CONF" ]; then
    mkdir -p $HOME/.zcash/
    echo "rpcuser=zcash" > ${ZCASH_CONF}
    echo "rpcpassword=`pwgen 20 1`" >> ${ZCASH_CONF}
    echo "addnode=mainnet.z.cash" >> ${ZCASH_CONF}
fi

zcash-fetch-params

zcashd
