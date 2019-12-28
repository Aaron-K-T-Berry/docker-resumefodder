# Docker Resume Fodder

This container wraps the ResumeFodder CLI tool to allow you to export resumes into doc formats using a JSONResume formated file.

- [JSONResume](https://jsonresume.org/)
- [ResumeFodder](https://resumefodder.com/)
- [Docker hub repo](https://hub.docker.com/repository/docker/aaronktberry/resumefodder)

## How to use the container

### Docker CLI

```BASH
# Create a new resume json file
docker run aaronktberry/resumefodder:latest init

# Export a resume as a doc
docker run aaronktberry/resumefodder:latest export resume.json resume.doc templates/standard.xml

# Convert to resume json file
docker run aaronktberry/resumefodder:latest convert
```

### Docker compose

```YAML
version: '3'

services:
  resumefodder:
    image: aaronktberry/resumefodder:latest
    command: init ./exports/resume.json
    # command: export exports/resume.json exports/resume.doc templates/standard.xml
    # command: convert
    volumes:
      - ./exports:/go/src/gitlab.com/steve-perkins/ResumeFodder-cli/exports
```

### Contributing

Feel free to open any PR's for updates. This repo is using a [task file](https://taskfile.dev/#/) to easily setup and run the container.

```BASH
# Setup env, build and run container via the docker-compose.dev.yml file
task run
```

Containers are published automatically from changes to the master branch to docker hub at [aaronktberry/resumefodder](https://hub.docker.com/repository/docker/aaronktberry/resumefodder).
