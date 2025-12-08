FROM python:3.14.2-slim AS builder

RUN apt-get update \
    && apt-get install --no-install-recommends -y gcc build-essential flex bison \
    && pip install --prefix="/install" fava

FROM python:3.14.2-slim

COPY --from=builder /install /usr/local
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apt-get update \
    && apt-get install -y git git-lfs bash curl vim locales \
    && apt-get clean

RUN useradd -ms /bin/bash fava
RUN git lfs install --skip-repo
RUN echo $(dpkg --print-architecture) \
    && curl -f -L --output /usr/bin/lfs-folderstore  https://github.com/sinbad/lfs-folderstore/releases/download/v1.0.1/lfs-folderstore-linux-amd64-v1.0.1.zip\
    && chmod 755 /usr/bin/lfs-folderstore

RUN sed -i '/de_CH.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

USER fava
WORKDIR /home/fava

ENV LANG=de_CH.UTF-8
ENV LANGUAGE=de_CH:de
ENV LC_ALL=de_CH.UTF-8

ENV FAVA_HOST="0.0.0.0"
EXPOSE 5000
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "fava" ]
