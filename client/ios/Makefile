SHELL := /bin/bash

download-schema:
	apollo schema:download --endpoint=http://localhost:3000/graphql ./apollo/schema.json
apollo-generate:
	./apollo-ios-cli generate