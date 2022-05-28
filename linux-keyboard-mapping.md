# Linux Keyboard Mappings

- Clone and build [caps2esc](https://github.com/alanoliveira/caps2esc)
```bash
git clone https://github.com/alanoliveira/caps2esc ~/caps2esc
cd ~/caps2esc
gcc caps2esc.c -o caps2esc -I/usr/include/libevdev-1.0 -levdev -ludev
```

- Create init.d file in `/etc/init.d/caps2esc` with the following content:
  - replace `$(pwd)/caps2esc` path if necessary
```bash
#! /bin/sh

# The following part always gets executed.
# echo "This part always gets executed"

# The following part carries out specific functions depending on arguments.
case "$1" in
  start)
    echo "Starting caps2esc"
    nice -n 20 $(pwd)/caps2esc >/var/log/caps2esc.log 2>/var/log/caps2esc.log&
    echo "caps2esc is alive"
    ;;
  stop)
    echo "Stopping caps2esc"
    killall caps2esc
    echo "caps2esc is dead"
    ;;
  *)
    echo "Usage: /etc/init.d/caps2esc {start|stop}"
    exit 1
    ;;
esac

exit 0
```

- Add it as a service
```
sudo chmod 755 /etc/init.d/caps2esc
sudo update-rc.d caps2esc defaults
```

- To remove the service
```
sudo update-rc.d -f caps2esc remove # to remove
```
