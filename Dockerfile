FROM ubuntu

RUN apt-get -y update

#RUN ln -s /usr/lib64/libpcre.so.1 /usr/lib64/libpcre.so.0
#RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash && yum -y install git-lfs

ADD osa.tgz /root/osa
RUN ls -lotra /root/ && ls -lotr /root/osa

ADD osa11_init.sh /root/osa11_init.sh

RUN apt-get -y install libx11-6 libxext6 libxpm4 libxft2 libgfortran3


ADD entrypoint.sh /root/entrypoint.sh

#RUN DISPLAY=:0 bash entrypoint.sh
ENTRYPOINT bash /root/entrypoint.sh
