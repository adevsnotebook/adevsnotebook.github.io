FROM alpine:latest
ARG WITH_PLUGINS=true

# Environment variables
ENV PACKAGES=/usr/local/lib/python3.9/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /tmp

RUN apk upgrade --update-cache -a
RUN apk add --no-cache python3 git git-fast-import openssh
RUN apk add --no-cache --virtual .build gcc musl-dev 
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip install --no-cache-dir mkdocs>=1.2.2
RUN pip install --no-cache-dir Pygments>=2.4
RUN pip install --no-cache-dir markdown>=3.2
RUN pip install --no-cache-dir pymdown-extensions>=9.0
RUN pip install --no-cache-dir mkdocs-material-extensions>=1.0
RUN pip install --no-cache-dir pip install mkdocs-cluster

# Installing theme
RUN pip install --no-cache-dir mkdocs-bootstrap>=1.11
RUN pip install --no-cache-dir mkdocs-bootstrap4

# Cleaning up
RUN rm -rf /tmp/* 
RUN rm -rf /root/.cache


WORKDIR /docs
EXPOSE 8000
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]