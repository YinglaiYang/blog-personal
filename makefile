#include makefile_credentials

.PHONY: build preview upload deploy

build:
	zola build

serve:
	zola serve

upload:
	@rsync -avrz --progress --delete-excluded --rsh=ssh public/* ${IONOS_PRIVATE_BLOG_SSH_USER}@${IONOS_PRIVATE_BLOG_SSH_SERVER}:./main

deploy: build upload
