DATE = $(shell date)

clean-up: ## Delete Files
	@echo "Cleaning Up"
	rm -f test.out

build: clean-up ## Generate Date
	@echo "Building new file"
	@echo "Author: Harsha" > test.out
	@echo "$(DATE)" >> test.out
	@echo "Build Completed"


help: ## Shows the help
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
        awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

.PHONY: clean-up build help
