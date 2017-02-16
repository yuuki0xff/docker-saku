FROM python:3
MAINTAINER yuuki0xff <yuuki0xff@gmail.com>
EXPOSE 8000
VOLUME /srv
ADD ./entrypoint /usr/local/bin

RUN set -euv && \
    useradd saku && \
    mkdir -p /opt/saku /srv && \
    \
    cd /opt/saku && \
    git clone --depth=1 https://github.com/shingetsu/saku . && \
    mv file file.original && \
    ln -s /srv/cache . && \
    ln -s /srv/file . && \
    ln -s /srv/log . && \
    ln -s /srv/run . && \
    \
    cd /tmp && \
    wget https://github.com/ncopa/su-exec/raw/v0.2/su-exec.c && \
    gcc -o /usr/local/bin/su-exec su-exec.c && \
    rm /tmp/su-exec.c
ADD ./saku.ini ./spam.txt /opt/saku/file.original/

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["python3", "/opt/saku/saku.py"]
