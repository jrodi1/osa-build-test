tarball?=osa11-CentOS_7.4.1708_x86_64.tar.gz

CONTAINER_NAME="volodymyrsavchenko/docker-integral-osa:osa11-test"

run: build
	docker run --privileged \
       -e DISPLAY=$(DISPLAY) \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
	   -v /isdc/arc/rev_3/scw/:/data/rep_base_prod/scw:ro \
	   -v /isdc/arc/rev_3/aux/:/data/rep_base_prod/aux:ro \
	   -v /isdc/arc/rev_3/cat/:/data/rep_base_prod/cat:ro \
	   -v /home/isdc/savchenk/osa11_deployment/ic_copy/ic/ic:/data/rep_base_prod/ic:ro \
	   -v /home/isdc/savchenk/osa11_deployment/ic_copy/ic/idx/ic:/data/rep_base_prod/idx/ic:ro \
        $(CONTAINER_NAME)
	   #-v /home/isdc/savchenk/osa11_deployment/ic_copy/idx:/data/rep_base_prod/idx/ic:ro  \
	   #-v /isdc/arc/rev_3/idx/:/data/rep_base_prod/idx:ro \

build: 
	cp -fv ../artifacts/$(tarball) osa.tgz && \
	docker build -t $(CONTAINER_NAME) .

push: build
	docker push $(CONTAINER_NAME)



run-it: build
	docker run --privileged --entrypoint=bash -it $(CONTAINER_NAME) 
