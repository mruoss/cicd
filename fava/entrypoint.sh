#!/bin/sh

if [  -n "${GIT_SRC}" ] && [ -n "${GIT_DST}" ] && [ -d "${GIT_SRC}" ]; then
    cd "${GIT_DST}" 
    git clone "${GIT_SRC}"
fi

exec $@