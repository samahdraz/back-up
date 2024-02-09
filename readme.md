# Backup Script README

This script provides a backup solution by checking changes in a source directory and making backups in a specified destination directory.

## Description

The script monitors changes in the provided source directory. If any change is detected, a new backup is created in the destination directory. The script also allows limiting the number of backups by deleting the oldest backup once the maximum number of backups is reached.

## Usage via Script Directly:

```bash
./file.sh [source_dir] [destination_dir] [time_between_check] [max_number]
```

## Usage via Makefile:

To execute the backup script using the provided Makefile:
```bash
make run ARGS="arguments_for_script"
```
Example:
make ARGS="/path/to/source /path/to/destination 60 5"

This will run the script with the specified arguments using 'make'. The default target directory is set to 'des'.

## Parameters

    1. source_dir: Directory to monitor and backup.
    2. destination_dir: Directory where backups will be saved.
    3. time_between_check: Time in seconds between checks for changes.
    4. max_number: Maximum backups to retain. When reached, oldest backup is deleted.

## How It Works:

    Continually checks for changes in source_dir.
    If changes are detected:
    a. Checks the number of existing backups in destination_dir.
    b. If backups reach max_number, deletes the oldest backup.
    c. Creates a new backup with a current timestamp as its name.
    Waits time_between_check duration before checking again.

## Requirements:

    Permissions to read from source_dir and write to destination_dir.
    Adequate space in destination_dir for backups.
