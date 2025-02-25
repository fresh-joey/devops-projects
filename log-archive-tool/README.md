# Log Archive Tool

## Description

- The Log Archive Tool is a shell script designed to archive log files from a specified directory. This tool helps in managing log files by compressing and moving them to an archive directory, thus saving disk space and keeping the log directory organized.

## Requirements

The tool should run from the command line, accept the log directory as an argument, compress the logs, and store them in a new directory. The user should be able to:

- Provide the log directory as an argument when running the tool.
```bash
log-archive <log-directory>
```
- The tool should compress the logs in a tar.gz file and store them in a new directory.
- The tool should log the date and time of the archive to a file.
```console
logs_archive_20240816_100648.tar.gz
```

## Usage