ARG VERSION="9.0-devel-centos7"
FROM nvidia/cuda-ppc64le:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Point to our mirrors and update to latest
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
COPY epel.repo /etc/yum.repos.d/epel.repo
RUN yum upgrade -y && \
    yum clean all && \
    rm -rf /var/cache/yum

# Below was taken from https://github.com/jenkinsci/docker-ssh-slave

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV JENKINS_AGENT_HOME ${JENKINS_AGENT_HOME}
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN groupadd -g ${gid} ${group} && \
    useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m -s /bin/bash "${user}"

# setup sudo
RUN yum install -y sudo && \
    yum clean all && \
    rm -rf /var/cache/yum && \
	echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# install build-essential
RUN yum install -y autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 \
    ncurses-devel automake asciidoc bzip2 curl wget openblas-devel \
    openmpi-devel redhat-lsb libxslt docbook-style-xsl docbook-dtds \
    gcc-gfortran ca-certificates patch java-1.8.0-openjdk git \
    libcublas-devel cuda-misc-headers-${VERSION/./-} cuda-nvcc-${VERSION/./-} \
    cuda-cusparse-dev-${VERSION/./-} cuda-cudart-dev-${VERSION/./-} && \
    yum clean all && \
    rm -rf /var/cache/yum

# install CUDA headers
RUN export CUDA_VER=${NVIDIA_REQUIRE_CUDA/cuda>=/} && \
    export VER=${CUDA_VER/./-} && \
    yum install -y libcublas-devel cuda-misc-headers-${VER} cuda-nvcc-${VER} \
    cuda-cusparse-dev-${VER} cuda-cudart-dev-${VER} && \
    yum clean all && \
    rm -rf /var/cache/yum

# Setup ccache
RUN yum install -y ccache && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    mkdir -p /var/cache/ccache && \
    chown ${user}:${group} /var/cache/ccache && \
    chmod 2777 /var/cache/ccache

COPY ccache.conf /etc/ccache.conf

# Install conda py3
RUN curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-ppc64le.sh \
    -o ${JENKINS_AGENT_HOME}/miniconda.sh && \
    bash ${JENKINS_AGENT_HOME}/miniconda.sh -b -p ${JENKINS_AGENT_HOME}/miniconda && \
    export PATH=${JENKINS_AGENT_HOME}/miniconda/bin:$PATH && \
    conda install -y pyyaml && \
    ${CONDA_ROOT_PREFIX}/bin/pip install numpy && \
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
RUN curl -o magma-2.5.2.tar.gz "http://icl.cs.utk.edu/projectsfiles/magma/downloads/magma-2.5.2.tar.gz" && \
    gunzip -c magma-2.5.2.tar.gz | tar -xvf - && cd magma-2.5.2 && \
    cp make.inc-examples/make.inc.openblas make.inc && \
    sed -i 's/nvcc/\/usr\/local\/cuda\/bin\/nvcc/' make.inc && \
    sed -i 's/#OPENBLASDIR/OPENBLASDIR/' make.inc && \
    sed -i 's/\/usr\/local\/openblas/\/usr/' make.inc && \
    sed -i 's/#CUDADIR/CUDADIR/' make.inc && \
    sed -i 's/#GPU_TARGET ?= Kepler Maxwell Pascal/GPU_TARGET ?= Kepler Maxwell Pascal/' make.inc && \
    make -j20 install && cd ../ && rm -rf magma-2.5.2.tar.gz magma-2.5.2

# Ensure all files are owned by jenkins in its homedir
RUN chown -R ${user}:${group} ${JENKINS_AGENT_HOME}

# setup SSH server
RUN yum install -y openssh-server && \
    yum clean all && \
    rm -rf /var/cache/yum && \
	sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
	sed -i 's/#RSAAuthentication.*/RSAAuthentication yes/' /etc/ssh/sshd_config && \
	sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
	sed -i 's/#SyslogFacility.*/SyslogFacility AUTH/' /etc/ssh/sshd_config && \
	sed -i 's/#LogLevel.*/LogLevel INFO/' /etc/ssh/sshd_config && \
	mkdir /var/run/sshd && \
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"

COPY setup-sshd /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["/usr/local/bin/setup-sshd"]
