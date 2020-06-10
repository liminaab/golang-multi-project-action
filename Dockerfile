FROM golang:1.14

LABEL name="Golang multi-project action"
LABEL maintainer="Andreas Fürst"
LABEL version="1.0.0"

LABEL com.github.actions.name="Golang multi-project action"
LABEL com.github.actions.description="Run command on multiple Golang projects"
LABEL com.github.actions.icon="box"
LABEL com.github.actions.color="purple"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]