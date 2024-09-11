# The base image is Alpine Linux, which is lightweight and commonly used for containers where size matters. Alpine is around 5 MB, making it an efficient starting point.
FROM alpine

# The --no-cache flag prevents caching of the package index, reducing the image size by not storing unnecessary data.
RUN apk add --no-cache \ 
        # A more feature-rich shell than Alpine's default shell (/bin/sh).
        bash           \ 
        # A command-line HTTP client, often used for making API requests (an alternative to curl).
        httpie         \ 
        # A command-line JSON processor used for parsing and manipulating JSON data.
        jq &&          \ 
        # the which command is run to verify the installation by checking the paths of bash, http, and jq. If any of these are missing, the build would fail.
        which bash &&  \ 
        which http &&  \
        which jq

# This command copies the entrypoint.sh script from your local build context (where the Dockerfile is located) into the image at /usr/local/bin/entrypoint.sh. 
# This script will be used as the entry point for the container, meaning it will be executed when the container starts.
COPY entrypoint.sh /usr/local/bin/entrypoint.sh 

# This copies a JSON file (sample_push_event.json) into the root directory of the image. This file may be used by the container, perhaps for testing or configuration purposes.                                                
COPY sample_push_event.json /sample_push_event.json 

ENTRYPOINT ["entrypoint.sh"]
