download:
	rm -rf charts
	rm -rf downloads
	mkdir -p downloads
	cd downloads && curl -L https://istio.io/downloadIstio | sh -
	mv downloads/istio-*  downloads/istio
	mv downloads/istio/manifests/charts charts


