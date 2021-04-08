# Reporting notebook
# Build Stage: Alpha
# Author: Steven Goossens
# License: GPL-3.0
#

FROM jupyter/base-notebook:latest
LABEL maintainer="Steven Goossens"
LABEL description="Dockerfile for reporting notebook on top of Elastic"

ENV DEBIAN_FRONTEND noninteractive
USER ${NB_USER}

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install elasticsearch-dsl elasticsearch pandas

WORKDIR ${HOME}
ENTRYPOINT ["/opt/jupyter/scripts/jupyter-entrypoint.sh"]
CMD ["/opt/jupyter/scripts/jupyter-cmd.sh"]
EXPOSE 8888
USER ${USER}
