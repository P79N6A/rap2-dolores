FROM dev.dr:5000/qy_node_backend_base:1.0
MAINTAINER qy

# 时区设置成当前时区

ARG PROJECT_NAME=rap2-dolores

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY start_app.sh /start_app.sh
COPY tmp/rap2-dolores.tgz /root
RUN cd /root;tar xfz rap2-dolores.tgz;rm -rf rap2-dolores.tgz;cd ${PROJECT_NAME};

ENTRYPOINT /start_app.sh