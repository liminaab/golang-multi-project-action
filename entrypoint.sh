#!/bin/sh

set -e

#echo "::set-output name=args::success"

REPOS="$2"

if [ -z "${IMPORT}" ]; then
  IMPORT="${GITHUB_REPOSITORY}"
fi
WORKDIR="${GOPATH}/src/github.com/${IMPORT}"

# PROJECT_PATH specifies the subdirectory in the working directory that the Go project is
if [ -z "${PROJECT_PATH}" ]; then
  PROJECT_PATH="."
fi

# Go can only find dependencies if they're under $GOPATH/src.
# GitHub Actions mounts your repository outside of $GOPATH.
# So symlink the repository into $GOPATH, and then cd to it.
mkdir -p "$(dirname "${WORKDIR}")"
ln -s "${PWD}" "${WORKDIR}"

for repo in ${REPOS}; do
    DIR="${WORKDIR}/${PROJECT_PATH}/${repo}"
    GO=$(find "$DIR" -name *.go|head -n1)
    if [ ! -z "$GO" ]
    then
        echo "Running command on $repo..."
        cd "${WORKDIR}/${PROJECT_PATH}/${repo}"
        sh -c "$1"
    else
        echo "$repo not a GO project. Skipping..."
    fi
done