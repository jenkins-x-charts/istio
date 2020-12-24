WORKLOAD_DASHBOARD?=7630
SERVICE_DASHBOARD?=7636
MESH_DASHBOARD?=7639
CONTROL_PLANE_DASHBOARD?=7645
PERFORMANCE_DASHBOARD?=11829
DASHBOARD_REVISION?=46

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
	cp -r chartTemplates/ charts
	mv downloads/istio/samples/addons/extras/prometheus-operator.yaml charts/istio-prometheus/templates
	curl -s https://grafana.com/api/dashboards/$(WORKLOAD_DASHBOARD)/revisions/$(DASHBOARD_REVISION)/download > charts/istio-dashboards/dashboards/istio-workload-dashboard.json
	curl -s https://grafana.com/api/dashboards/$(SERVICE_DASHBOARD)/revisions/$(DASHBOARD_REVISION)/download > charts/istio-dashboards/dashboards/istio-service-dashboard.json
	curl -s https://grafana.com/api/dashboards/$(MESH_DASHBOARD)/revisions/$(DASHBOARD_REVISION)/download > charts/istio-dashboards/dashboards/istio-mesh-dashboard.json
	curl -s https://grafana.com/api/dashboards/$(CONTROL_PLANE_DASHBOARD)/revisions/$(DASHBOARD_REVISION)/download > charts/istio-dashboards/dashboards/istio-control-plane-dashboard.json
	curl -s https://grafana.com/api/dashboards/$(PERFORMANCE_DASHBOARD)/revisions/$(DASHBOARD_REVISION)/download > charts/istio-dashboards/dashboards/istio-performance-dashboard.json
	git add charts

