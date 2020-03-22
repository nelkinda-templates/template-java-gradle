## Port for the SonarQube server.
SONAR_PORT?=9000
plugins:=$(shell grep -v ^\\\# plugins.txt)
plugin-deps:=$(addprefix plugins/,$(notdir $(plugins)))

.PHONY: sonard
## Starts a local SonarQube server using Docker.
# If a Docker container sonarqube exists, it will (re)start it.
# If it doesn't exist, it will download the sonarqube docker image and start a container with the same name.
sonard: docker-nelkinda-sonarqube
	docker start nelkinda-sonarqube || docker run -d --name nelkinda-sonarqube -p ${SONAR_PORT}:9000 nelkinda-sonarqube

.PHONY: docker-nelkinda-sonarqube
## Builds the docker image nelkinda-sonarqube.
# The customized image is used to provide a set of additional plugins beyond the default.
docker-nelkinda-sonarqube: SHELL:=/bin/bash
.ONESHELL: docker-nelkinda-sonarqube
docker-nelkinda-sonarqube: plugins pluginsToDelete
	docker build -t nelkinda-sonarqube .

.PHONY: plugins
## Downloads the SonarQube plugins which will be part of the docker image.
plugins: $(plugin-deps)

pluginsToDelete: plugins.txt
	grep -v '^\#' $^ | grep '\.jar$$' | sed -e 's/.*\///' -e 's/\(.*-\)[^-]*\.jar/\1*/' -e 's/^/\/opt\/sonarqube\/extensions\/plugins\//' >$@

.PHONY: clean
## Removes all auto-generated files.
clean:: ;

.PHONY: distclean
## Removes all auto-generated files and caches.
distclean::
	$(RM) -r plugins/

plugins/%.jar: | plugins/
	wget -O $@ $(filter %/$(notdir $@),$(plugins))

plugins/:
	mkdir -p $@

-include ../.makehelp/include/makehelp/Help.mk

ifeq (help, $(filter help,$(MAKECMDGOALS)))
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif

-include .User.mk
-include ../.User.mk
-include ~/.User.mk
