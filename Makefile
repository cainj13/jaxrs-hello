
REPO_LOCATION = https://github.com/cainj13/jaxrs-hello
BUILDER_IMAGE = s2i-example/java-builder
IMAGE_NAME = s2i-example/wildfly-rest-hello
ARTIFACT_LOCATION = /tmp/jaxrs-hello.war

.PHONY: all builder-image build run test
.DEFAULT: all

all: builder-image build run test

builder-image:
	docker build -t $(BUILDER_IMAGE) builder

# Turn on debugging for s2i build (if you're having problems)
#   --loglevel=5
build:
	s2i build $(REPO_LOCATION) --ref=s2i $(BUILDER_IMAGE) $(IMAGE_NAME) --runtime-image jboss/wildfly:10.0.0.Final --runtime-artifact $(ARTIFACT_LOCATION)

# TODO figure out how to expose ports automatically instead of doing theme here ^
# TODO save-artifacts and restore

run:
	docker run --rm -p 8080:8080 -d $(IMAGE_NAME)

test:
	curl localhost:8080/jaxrs-hello?name=vger

kill:
	docker ps | grep $(IMAGE_NAME) | awk '{print $1}' | xargs docker kill
