### MAKEFILE FOR CUDA_MNIST.
#
#   This makefile supports a number of recipes:
#
#   $ make all:     builds and runs. (default)
#
#   $ make build:   just builds.
#
#   $ make run:     just runs, doesn't recompile.
#
#   $ make clean:   cleans up any build artifacts.
#
#   $ make rebuild: does a clean rebuild of everything.
#
#

# Some environment variables
BUILD_DIR = build
EXECUTABLE = Main
CMAKE_FLAGS = 

# Default entrypoint
.PHONY: all
all: build run

# Build the stuff
.PHONY: build
build:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake .. $(CMAKE_FLAGS)
	cd $(BUILD_DIR) && cmake --build .

# Run
.PHONY: run
run: build
	$(BUILD_DIR)/$(EXECUTABLE)

# Clean up
.PHONY: clean
clean:
	rm $(BUILD_DIR) -fr

# Rebuild from scratch
.PHONY: rebuild
rebuild: clean build
