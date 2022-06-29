DATE = $(shell date)

clean-up: ## Delete Files
	@echo "Cleaning Up"
	rm -f output.html
	cp output.html.original output.html

build: clean-up ## Generate Date
	@echo "Rebuilding Static Website"
	sed -i "s/UPDATE_ME/$(DATE)/g" output.html
	@echo "Rebuild Completed"

help: ## Shows the help
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
        awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

.PHONY: clean-up build help
