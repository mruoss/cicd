FROM python:3.12.0-alpine3.18 as builder

RUN apk add --update libxml2-dev libxslt-dev gcc musl-dev g++
RUN pip install --prefix="/install" fava

FROM python:3.12.0-alpine3.18

COPY --from=builder /install /usr/local
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --update git bash
RUN adduser -D -g '' fava

USER fava
WORKDIR /home/fava

ENV FAVA_HOST "0.0.0.0"
EXPOSE 5000
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ] 
CMD [ "fava" ]