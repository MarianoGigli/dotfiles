SHELL = /bin/sh

.DEFAULT_GOAL := help

SUBDIRS = $(shell ls -d */) 

.PHONY: check $(SUBDIRS)
check: ## run stow in dry run mode to validate actions
	@for dir in $(SUBDIRS); do \
		stow -vvn $$dir; \
		echo ""; \
	done

.PHONY: create $(SUBDIRS)
create: ## create symlinks using stow
	@for dir in $(SUBDIRS); do \
		stow -vv $$dir; \
		echo ""; \
	done

.PHONY: update $(SUBDIRS)
update: ## delete and create symlinks using stow
	@for dir in $(SUBDIRS); do \
		stow -vvR $$dir; \
		echo ""; \
	done

GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

## Help:
.PHONY: help
help: ## Show this help.
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} { \
		if (/^[a-zA-Z_-]+:.*?##.*$$/) {printf "    ${YELLOW}%-20s${GREEN}%s${RESET}\n", $$1, $$2} \
		else if (/^## .*$$/) {printf "  ${CYAN}%s${RESET}\n", substr($$1,4)} \
		}' $(MAKEFILE_LIST)
