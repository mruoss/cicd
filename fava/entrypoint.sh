#!/bin/sh

echo yes | git clone "${GIT_SRC}" "${GIT_DST}" || true
cd "${GIT_DST}"
git pull

exec $@