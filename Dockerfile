# Python base image [pre-built debian-base python env]
FROM continuumio/miniconda3:latest

# user
ARG USERNAME=mamba
ARG USERID=1000
RUN adduser --disabled-password --uid $USERID $USERNAME

# set up environment (reduce package overhead)
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    BUILD_HOME=/build \
    PATH=/root/.local/bin:$PATH

# install dependencies
RUN apt-get update &&  apt-get install -y --no-install-recommends build-essential \
	git \
	libgl1-mesa-glx \
	gfortran \
	zlib1g-dev && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# workspace
RUN mkdir -p $BUILD_HOME && chown -R $USERNAME:$USERNAME $BUILD_HOME
WORKDIR $BUILD_HOME

# (always specify exact version for python packages)
COPY --chown=$USERNAME:$USERNAME . .

# create conda env
RUN conda env create -f environment.yml

# python shell
SHELL ["conda", "run", "-n", "ogenki", "/bin/bash", "-c"]

# jupyter notebook
EXPOSE 8888
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
CMD ["jupyter", "nbconvert", "--execute", \
     "--ExecutePreprocessor.timeout=600", \
     "--to", "notebook", \
     "/notebook/genki_test.ipynb"]
