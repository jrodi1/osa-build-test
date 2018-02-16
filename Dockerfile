FROM centos

RUN yum -y install epel-release
RUN yum -y update

#RUN ln -s /usr/lib64/libpcre.so.1 /usr/lib64/libpcre.so.0
#RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash && yum -y install git-lfs

ADD osa.tgz /root/osa
RUN ls -lotra /root/ && ls -lotr /root/osa

ADD osa11_init.sh /root/osa11_init.sh

RUN yum -y install libX11 libXext libXpm libXft libgfortran

ADD entrypoint.sh /root/entrypoint.sh

#RUN DISPLAY=:0 bash entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
