CHART_REPO := http://jenkins-x-chartmuseum:8080
NAME := istio
OS := $(shell uname)
VERSION := 0.1.1
KNATIVE_VERSION := 0.12.1

CHARTMUSEUM_CREDS_USR := $(shell cat /builder/home/basic-auth-user.json)
CHARTMUSEUM_CREDS_PSW := $(shell cat /builder/home/basic-auth-pass.json)

init:
	helm init --client-only

setup: init
	helm repo add jenkinsxio http://chartmuseum.jenkins-x.io

build: clean setup
	helm lint istio

install: clean build
	helm upgrade ${NAME} istio --install

upgrade: clean build
	helm upgrade ${NAME} istio --install

delete:
	helm delete --purge ${NAME} istio

clean:
	rm -rf istio/charts
	rm -rf istio/${NAME}*.tgz
	rm -rf istio/requirements.lock

release: clean build
ifeq ($(OS),Darwin)
	sed -i "" -e "s/version:.*/version: $(VERSION)/" istio/Chart.yaml

else ifeq ($(OS),Linux)
	sed -i -e "s/version:.*/version: $(VERSION)/" istio/Chart.yaml
else
	exit -1
endif
	helm package istio
	curl --fail -u $(CHARTMUSEUM_CREDS_USR):$(CHARTMUSEUM_CREDS_PSW) --data-binary "@$(NAME)-$(VERSION).tgz" $(CHART_REPO)/api/charts
	rm -rf ${NAME}*.tgz

