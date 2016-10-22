FROM python:3
MAINTAINER yuuki0xff <yuuki0xff@gmail.com>
EXPOSE 8000
VOLUME /srv
ADD ./entrypoint /usr/local/bin

RUN set -euv && \
    useradd saku && \
    mkdir -p /opt/saku /srv && \
    chown saku:saku /srv && \
    \
    cd /opt/saku && \
    git clone --depth=1 https://github.com/shingetsu/saku . && \
    mv file file.original && \
    ln -s /srv/cache . && \
    ln -s /srv/file . && \
    ln -s /srv/log . && \
    ln -s /srv/run .
ADD ./saku.ini ./spam.txt /opt/saku/file.original/

USER saku
ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["python3", "/opt/saku/saku.py"]
