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
RUN python3 -m pip install elasticsearch-dsl elasticsearch pandas matplotlib plotly cufflinks notebook-as-pdf xelatex pyppeteer pillow


WORKDIR ${HOME}
EXPOSE 8888
USER ${USER}
