FROM golang:1.14

LABEL name="Golang Action for multiple projects"
LABEL maintainer="Andreas Fürst"
LABEL version="1.0.0"

LABEL com.github.actions.name="Golang Action for multiple projects"
LABEL com.github.actions.description="Run Golang commands"
LABEL com.github.actions.icon="box"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]