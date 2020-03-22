GRADLE:=./gradlew
GRADLEFLAGS:=--warning-mode all
BUILD:=$(GRADLE)
BUILDFLAGS:=$(GRADLEFLAGS)
GRADLE_BOOTSTRAP:=$(firstword $(wildcard $(GRADLE) $(shell which gradle)))

.PHONY: all
## Builds and verifies the project.
all: build

.PHONY: pipeline
## Runs the same thing as the pipeline.
pipeline:
	$(BUILD) $(BUILDFLAGS) build pitest

.PHONY: continuous
## Builds and tests continuously.
continuous:
	$(BUILD) $(BUILDFLAGS) --continuous test pitest

.PHONY: build
## Builds and verifies the project.
build: $(BUILD)
	$(BUILD) $(BUILDFLAGS) $@

.PHONY: clean
clean:: $(BUILD)
	$(BUILD) $(BUILDFLAGS) $@

.PHONY: run bootRun
## Runs the application.
run: bootRun
bootRun: $(BUILD)
	$(BUILD) $(BUILDFLAGS) $@

.PHONY: pitest
## Runs the Pitest mutation tests.
pitest: $(BUILD)
	$(BUILD) $(BUILDFLAGS) $@

.PHONY: dependencyUpdates
## Checks for dependency updates.
dependencyUpdates: $(BUILD)
	$(BUILD) $(BUILDFLAGS) $@

.PHONY: wrapper
## Generates the wrapper.
wrapper: $(BUILD)
$(BUILD):
	$(GRADLE_BOOTSTRAP) wrapper

.PHONY: sonard
## Starts a local SonarQube server using Docker.
# If a Docker container sonarqube exists, it will (re)start it.
# If it doesn't exist, it will download the sonarqube docker image, configure the plugins, and start a container with the same name.
sonard:
	$(MAKE) -C sonarqube/

.PHONY: sonarqube
## Runs the SonarQube analysis.
# Requires the project to be built and the SonarQube server to be running.
sonarqube:
	$(BUILD) $(BUILDFLAGS) $@

-include .makehelp/include/makehelp/Help.mk

ifeq (help, $(filter help,$(MAKECMDGOALS)))
.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git .makehelp
endif

-include ~/.User.mk
-include .User.mk
