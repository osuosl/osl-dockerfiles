FROM nvidia/cuda-ppc64le:9.1-cudnn7-devel-ubuntu16.04
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN groupadd -g ${gid} ${group} && \
    useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup sudo
RUN apt-get update && \
    apt-get install --no-install-recommends -y sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install packages we need
RUN apt-get update && \
    apt-get install --no-install-recommends -y autoconf binutils-doc bison \
    build-essential flex gettext ncurses-dev automake asciidoc curl wget \
    libopenblas-dev libopenmpi-dev lsb-release xsltproc docbook-xsl docbook-xml \
    gfortran ccache ca-certificates openjdk-8-jdk git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install conda py3
RUN curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-ppc64le.sh \
    -o ${JENKINS_AGENT_HOME}/miniconda.sh && \
    bash ${JENKINS_AGENT_HOME}/miniconda.sh -b -p ${JENKINS_AGENT_HOME}/miniconda && \
    export PATH=${JENKINS_AGENT_HOME}/miniconda/bin:$PATH && \
    conda install -y pyyaml && \
    pip install numpy && \
    conda clean -ya

# Install conda py2
RUN export PATH=${JENKINS_AGENT_HOME}/miniconda/bin:$PATH && \
    conda create -n py2k python=2 -y && \
    bash -c "source activate py2k" && \
    export CONDA_ROOT_PREFIX="${JENKINS_AGENT_HOME}/miniconda/envs/py2k" && \
    conda install -y pyyaml && \
    ${CONDA_ROOT_PREFIX}/bin/pip install numpy && \
    conda clean -ya

# Install ninja
RUN git clone https://github.com/ninja-build/ninja.git && cd ninja && \
    git checkout tags/v1.7.2 && \
    ./configure.py --bootstrap && \
    cp ninja /usr/local/bin/ && cd ../ && rm -rf ninja

# Install magma
RUN curl -o magma-2.3.0.tar.gz "http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-2.3.0.tar.gz" && \
    gunzip -c magma-2.3.0.tar.gz | tar -xvf - && cd magma-2.3.0 && \
    cp make.inc-examples/make.inc.openblas make.inc && \
    sed -i 's/nvcc/\/usr\/local\/cuda\/bin\/nvcc/' make.inc && \
    sed -i 's/#OPENBLASDIR/OPENBLASDIR/' make.inc && \
    sed -i 's/\/usr\/local\/openblas/\/usr/' make.inc && \
    sed -i 's/#CUDADIR/CUDADIR/' make.inc && \
    sed -i 's/#GPU_TARGET ?= Kepler Maxwell Pascal/GPU_TARGET ?= Kepler Maxwell Pascal/' make.inc && \
    make -j20 install && cd ../ && rm -rf magma-2.3.0.tar.gz magma-2.3.0

# Ensure all files are owned by jenkins in its homedir
RUN chown -R ${user}:${group} ${JENKINS_AGENT_HOME}

# setup SSH server
RUN apt-get update && \
    apt-get install --no-install-recommends -y openssh-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config && \
    sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config && \
    mkdir /var/run/sshd

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
