tarball?=osa11-Ubuntu_16.04_x86_64.tar.gz
platform?=ubuntu

CONTAINER_NAME="volodymyrsavchenko/docker-integral-osa:osa11-test-ubuntu"

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

store-deps:
	cat Dockerfile | grep apt > ../artifacts/$(tarball)-dependencies.txt

build: 
	cp -fv ../artifacts/$(tarball) osa.tgz && \
	docker build -t $(CONTAINER_NAME) -f Dockerfile.$(platform) .

push: build
	docker push $(CONTAINER_NAME)



run-it: build
	docker run --privileged --entrypoint=bash -it $(CONTAINER_NAME) 
