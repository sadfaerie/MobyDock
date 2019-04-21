FROM python:3.6-slim
MAINTAINER: Kara Nottingham <sadfaerie>

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev --fix-missing --no-install-recommends

ENV INSTALL_PATH /mobodock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt 

COPY . . 

VOLUME ["static"]

CDM gunicorn -b 0.0.0.0:8000 "mobydock.app:create_app()"