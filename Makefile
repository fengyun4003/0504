# This sets a Makefile variable called KEYWORD, which holds the value FIXED.
KEYWORD=FIXED

# Builds the Docker image and runs it with the FIXED keyword as an argument.
# runs the Docker image named keyword-release-action.
# --rm: Automatically removes the container after it exits to free up resources.
run: build
	docker run --rm keyword-release-action $(KEYWORD)

# Runs docker build to build a Docker image.
# Tags the built image as keyword-release-action, so it can be referenced later in other commands (e.g., docker run).
# .: The current directory is used as the build context, where Docker looks for the Dockerfile and any other necessary files.
build:
	docker build --tag keyword-release-action .

# Runs the local entrypoint.sh script with the FIXED keyword.
test:
	./entrypoint.sh $(KEYWORD)
