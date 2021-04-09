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

RUN sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-generic-recommended
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install elasticsearch-dsl elasticsearch pandas matplotlib plotly cufflinks notebook-as-pdf jupyter-cjk-xelatex pyppeteer pillow


WORKDIR ${HOME}
EXPOSE 8888
USER ${USER}
