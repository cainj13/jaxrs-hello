
REPO_LOCATION = https://github.com/cainj13/jaxrs-hello
BUILDER_IMAGE = s2i-example/java-builder
IMAGE_NAME = s2i-example/wildfly-rest-hello
ARTIFACT_LOCATION = /tmp/jaxrs-hello.war

.PHONY: all builder-image build run
.DEFAULT: all

all: builder-image build run

builder-image:
	docker build -t $(BUILDER_IMAGE) builder

# Turn on debugging for s2i build (if you're having problems)
#   --loglevel=5
build:
	s2i build $(REPO_LOCATION) --ref=s2i $(BUILDER_IMAGE) $(IMAGE_NAME) --runtime-image jboss/wildfly:10.0.0.Final --runtime-artifact $(ARTIFACT_LOCATION)

# TODO get this log level lower, allow parameters
# TODO figure out how to expose ports automatically instead of doing theme here ^
# TODO save-artifacts and restore

run:
	docker run --rm -p 8080:8080 $(IMAGE_NAME)
