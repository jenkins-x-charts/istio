download:
	rm -rf charts
	rm -rf downloads
	mkdir -p downloads
	cd downloads && curl -L https://istio.io/downloadIstio | sh -
	mv downloads/istio-*  downloads/istio
	mv downloads/istio/manifests/charts charts
	mv charts/gateways/* charts
	rm -rf charts/gateways
	mv charts/istio-control/* charts
	rm -rf charts/istio-control
	git add charts

