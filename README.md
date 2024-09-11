# 1. Add a Dockfile and Build a Docker image from a Dockerfile in the current directory (.) and tag it with the name keyword-release
$ docker build --tag keyword-release .

# 2. Add an entry-point script and Give a shell script file executable permissions and make scripts runnable directly from the terminal without having to explicitly invoke the interpreter (e.g., bash script.sh).
$ chmod +x entrypoint_test.sh

# 2.1. Run script file and test it by passing the string "FIXED"
$ ./entrypoint_test.sh FIXED


