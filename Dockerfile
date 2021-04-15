# Reporting notebook
# Build Stage: Alpha
# Author: Steven Goossens
# License: GPL-3.0
#

FROM jupyter/base-notebook:latest
LABEL maintainer="Steven Goossens"
LABEL description="Dockerfile for reporting notebook on top of Elastic"

ENV DEBIAN_FRONTEND noninteractive

USER root
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install texlive-xetex texlive-fonts-recommended texlive-plain-generic pandoc -y

USER ${NB_USER}

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install sphinx docxbuilder elasticsearch-dsl elasticsearch pandas isort plotly cufflinks notebook-as-pdf jupyter-cjk-xelatex yapf pyppeteer pillow autopep8 jupyter-docx-bundler jupyterlab_templates nb-mermaid
RUN pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter bundlerextension enable --py jupyter_docx_bundler --sys-prefix
RUN jupyter bundlerextension enable --py jupyterlab_templates

WORKDIR ${HOME}
EXPOSE 8888
USER ${USER}
