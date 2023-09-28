CHART_NAME := otel-lgtm

.PHONY: deploy
deploy:
	@helm upgrade --install $(CHART_NAME) .

.PHONY: delete
delete:
	@helm delete $(CHART_NAME) || true

.PHONY: expose
expose:
	@kubectl port-forward service/$(CHART_NAME)-grafana 8080:80
