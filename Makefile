NAME=mrevdots
SHELL=/bin/bash

RED:=\033[0;31m
GREEN:=\033[0;32m
PURPLE:=\033[0;35m
CLEAR:=\033[0m

.PHONY: all
all: clean install

.PHONY: install
install:
	@echo -e "${GREEN}Running install script${CLEAR}"
	@./scripts/install
	@echo -e "${PURPLE}Install complete${CLEAR}"

.PHONY: clean
clean:
	@echo -e "${RED}Cleaning any dangling symlinks${CLEAR}"
	@find ~ -type l -maxdepth 1 | xargs rm

