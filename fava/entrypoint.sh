#!/bin/sh

if [  -n "${GIT_SRC}" ] && [ -d "${GIT_SRC}" ]; then
    git clone "${GIT_SRC}" "${GIT_DST}" || true
    cd "${GIT_DST}"
    git pull
fi

exec $@