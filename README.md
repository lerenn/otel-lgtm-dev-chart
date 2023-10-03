# OpenTelemetry Collector + LGTM (Grafana stack) Umbrella Helm Chart for Development only

⚠️ This chart should be used as a tool **for development only**, and preferably
locally (with a tool like [Minikube](https://minikube.sigs.k8s.io/docs/start/)).

## Usage

### Deployment

To use this chart, you can run these commands:

```shell
# Add the specific repository
helm repo add otel-lgtm-dev https://lerenn.github.io/packages/helm/otel-lgtm-dev

# Install the chart
helm upgrade --install lgtm otel-lgtm-dev/otel-lgtm-dev
# Add these arguments to separate to another namespace as it will pop a lot of resources:
# `--namespace <namespace> --create-namespace`
```

### Link to application

Everything is customizable through the `values.yaml`. However, to use it out of
the box, you should use one of these two variables as connection for your application
opentelemetry exporters:

* **gRPC**: `lgtm-opentelemetry-collector.<namespace>:4317`
* **HTTP**: `lgtm-opentelemetry-collector.<namespace>:4318`

**Important**: for ease of use, TLS is disabled, you should add an argument to
enable the insecure connection.
