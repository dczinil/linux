#!/bin/bash

echo "Swap Size"
read SWAPSIZE

dd if =/dev/zero of=/swap bs=1024 count=$SWAPSIZE

mkswap /swap $SWAPSIZE

/etc/sync
Swapon /swap