build:
	@${CONTAINER_CLI} build ../../../ -f Dockerfile -t ${IMAGE_NAME} \
		--build-arg base_image_repo=${BASE_IMAGE_REPO} \
		--build-arg base_image_tag=${BASE_IMAGE_TAG} \
		--build-arg project=${PROJECT_NAME} \
		--build-arg app=${APP_NAME} \
		--build-arg app_home=${APP_HOME} \
		--build-arg version=${APP_VERSION} \
		--build-arg release_tag=${RELEASE_TAG} \
		--build-arg build_number=${BUILD_NUMBER} \
		--build-arg authors=${APP_AUTHORS} \
		--build-arg app_source=${APP_SOURCE} \
		--build-arg image_repo=${IMAGE_REPO} \
		--build-arg image_tag=${IMAGE_TAG} \
		--build-arg ruby_version=${RUBY_VERSION} \
		--build-arg alpine_version=${ALPINE_VERSION} \
		--build-arg created_at=${CREATED_AT} \
		&& ${CONTAINER_CLI} image tag ${IMAGE_NAME} ${IMAGE_REGISTRY_NAME}

push:
	@${CONTAINER_CLI} push ${IMAGE_REGISTRY_NAME}

run:
	@${CONTAINER_CLI} run -it --rm ${IMAGE_REGISTRY_NAME} /bin/sh

image:
	@${CONTAINER_CLI} images | grep ${IMAGE_REPO} | grep ${IMAGE_TAG} || \
		echo "Error! Docker image ${IMAGE_NAME} is NOT found. Probably need to build it:\n\n  make build.app.${RELEASE_TAG}\n"

prune:
	@${CONTAINER_CLI} image prune -f
clean: prune
