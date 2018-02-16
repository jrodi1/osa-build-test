tarball?=osa11-CentOS_7.4.1708_x86_64.tar.gz

CONTAINER_NAME="volodymyrsavchenko/docker-integral-osa:osa11-test"

build: 
	cp -fv ../artifacts/$(tarball) osa.tgz && \
	docker build -t $(CONTAINER_NAME) .

push: build
	docker push $(CONTAINER_NAME)

run: build
	docker run --privileged \
       -e DISPLAY=$(DISPLAY) \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
        $(CONTAINER_NAME)


run-it: build
	docker run --privileged --entrypoint=bash -it $(CONTAINER_NAME) 
