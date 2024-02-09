SCRIPT := ./backup.sh
ARGS :=

# Extract parts of ARGS using word function
SOURCE := $(word 1, $(ARGS))
TARGET_DIR := $(word 2, $(ARGS))

all: run

run:
	mkdir -p $(TARGET_DIR)
	$(SCRIPT) $(ARGS)

