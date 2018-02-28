# Saku
Unofficial image for [saku](https://github.com/shingetsu/saku).
Saku is a implements of [P2P anonymous BBS](http://shingetsu.info/).

## Quick Start
1. Open of TCP/8000 port. Please change the firewall settings and router settings so that we can access TCP/8000 from the outside. If your using router supported UPnP, it is easier to run `upnpc -r 8000 tcp`.
2. `docker volume create saku-data`
3. `docker run --rm --net=host -v saku-data:/srv yuuki0xff/gou`
4. Open the ["http://localhost:8000"](http://localhost:8000). You can see front page of saku.

## Customize
If you need customization, copy the configuration file into `/file/` directory on `saku-data` volume.
See [default configuration files of saku](https://github.com/shingetsu/saku/tree/master/file).

