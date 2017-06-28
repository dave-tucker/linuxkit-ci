#!/bin/sh

TIMESTAMP=$(date "+%Y-%m-%d")
moby build -output gcp worker.yml
linuxkit push gcp -bucket linuxkit-images -family linuxkit-ci-builder -img-name "linuxkit-ci-builder-${TIMESTAMP}" worker.img.tar.gz
