SHELL := /bin/bash

setup:
	sh setup.sh

dev-up:
	docker-compose -f docker-compose.dev.yaml up
