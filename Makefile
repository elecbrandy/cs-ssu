IMAGE_NAME      = arm
IMAGE_TAG       = 0.0
CONTAINER_NAME  = arm_container

HOST_CODE_PATH = /Users/dongwookim/github/cs-ssu
CONTAINER_CODE_PATH = /root/cs-ssu

# Docker image build
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# Docker container run && mounting host's directory
run:
	@if docker ps -a --format '{{.Names}}' | grep -q "^$(CONTAINER_NAME)$$"; then \
		echo "Container exists. Starting it..."; \
		docker start $(CONTAINER_NAME) && docker exec -it $(CONTAINER_NAME) bash; \
	else \
		docker run -it --userns=host --name $(CONTAINER_NAME) -v $(HOST_CODE_PATH):$(CONTAINER_CODE_PATH) $(IMAGE_NAME):$(IMAGE_TAG) bash; \
	fi

# Exec container's bash
exec:
	docker exec -it $(CONTAINER_NAME) bash

# Stop container
stop:
	docker stop $(CONTAINER_NAME)

# Remove container
rm:
	docker rm $(CONTAINER_NAME)

# Remove image
rmi:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Clean all (stop + remove container/image)
clean:
	make stop || true && make rm || true && make rmi || true
