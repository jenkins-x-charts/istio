CHART_REPO := gs://jenkinsxio-labs/charts
NAME := istio
OS := $(shell uname)

CHARTMUSEUM_CREDS_USR := $(shell cat /builder/home/basic-auth-user.json)
CHARTMUSEUM_CREDS_PSW := $(shell cat /builder/home/basic-auth-pass.json)

setup:
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
	helm repo add jx-labs $(CHART_REPO)
	helm gcs push ${NAME}*.tgz jx-labs --public
	rm -rf ${NAME}*.tgz%

