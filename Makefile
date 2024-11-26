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
BUILD_DIR = bld
EXECUTABLE = Main
CMAKE_FLAGS = 

# Default entrypoint
.PHONY: all
all: run

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Build the executable
$(BUILD_DIR)/$(EXECUTABLE): $(BUILD_DIR)
	cd $(BUILD_DIR) && cmake .. $(CMAKE_FLAGS)
	cd $(BUILD_DIR) && cmake --build .

# Run the program
.PHONY: run
run: $(BUILD_DIR)/$(EXECUTABLE)
	$(BUILD_DIR)/$(EXECUTABLE)

# Clean up
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Rebuild from scratch
.PHONY: rebuild
rebuild: clean $(EXECUTABLE)
