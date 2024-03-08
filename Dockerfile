FROM ruby:3.2.2

RUN apt-get update && apt-get install -y \
    build-essential \
    nano \
    nodejs \
    default-mysql-client

RUN mkdir /data-service-api
WORKDIR /data-service-api

COPY Gemfile ./

# Install gems
#RUN bundle install