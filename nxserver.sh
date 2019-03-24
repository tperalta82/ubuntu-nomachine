#!/bin/sh
/etc/init.d/dbus start
/etc/NX/nxserver --startup
tail -f /usr/NX/var/log/nxserver.log