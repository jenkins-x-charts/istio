# istio charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

for installing [istio](https://istio.io/) via [helm](https://helm.sh) 

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```bash 
helm repo add istio https://jenkins-x-charts.github.io/istio/
```

you can then do

```bash
helm search repo istio
```

The chart installs resources into the `tekton-pipelines` namespace

## Repository 

You can [browse the chart repository](https://jenkins-x-charts.github.io/istio/)

Or view the YAML at: [index.yaml](https://jenkins-x-charts.github.io/istio/index.yaml)
