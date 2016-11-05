
#!/bin/bash

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2

#sabnzbdplus --daemon --config-file /config/sabnzbd -s 0.0.0.0:8080

su -pc "./SABnzbd.py -b 0 -d -f /config/sabnzbd -s 0.0.0.0:8080"

sleep 5

tail -f /config/sabnzbd/logs/sabnzbd.*
