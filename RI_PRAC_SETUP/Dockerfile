FROM kernsuite/base:3
MAINTAINER Ben Hugo "bhugo@ska.ac.za"

ENV DEB_REQ casacore-dev \
            casacore-data \
            python-casacore \
            aoflagger \
            graphviz \
            vim \
            virtualenv \
            build-essential \
            libpython2.7-dev \
            libboost-all-dev \
	    wcslib-dev \
	    libcfitsio3-dev

RUN mkdir /src
COPY requirements.txt /src/requirements.txt

RUN apt-get update
RUN apt-get install -y --allow-unauthenticated $DEB_REQ
RUN virtualenv /src/jupyter
RUN . /src/jupyter/bin/activate && pip install -U pip setuptools wheel && pip install -r /src/requirements.txt && deactivate

RUN apt-get install -y --allow-unauthenticated openssh-server sudo libpam0g-dev
RUN /usr/bin/ssh-keygen -A
RUN mkdir /var/run/sshd
RUN sed 's/Port 22/Port 50122/g' -i /etc/ssh/sshd_config 
RUN chmod a+rx /etc/init.d/ssh
RUN echo "bash" > /run_script.sh
RUN chmod a+rx /run_script.sh
CMD /run_script.sh       
