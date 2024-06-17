CHART_NAME     := lgtm
NAMESPACE_NAME := telemetry

.PHONY: deploy
deploy: ## Deploy telemetry on kind cluster
	@helm upgrade --install $(CHART_NAME) .  \
		-n $(NAMESPACE_NAME) --create-namespace

.PHONY: delete
delete: ## Destroy telemetry on kind cluster
	@helm uninstall lgtm -n $(NAMESPACE_NAME)
	@kubectl delete ns telemetry

.PHONY: expose
expose: ## Expose grafana service
	@kubectl port-forward -n $(NAMESPACE_NAME) service/$(CHART_NAME)-grafana 8080:80

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
