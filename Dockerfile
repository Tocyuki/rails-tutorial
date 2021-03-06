FROM ruby:2.6

ENV APP_DIR /sample_app
ENV LANG C.UTF-8

RUN apt-get update -qq \
 && apt-get install -y nodejs postgresql-client \
 && mkdir ${APP_DIR}

WORKDIR ${APP_DIR}
ADD ./src/Gemfile ${APP_DIR}/Gemfile
ADD ./src/Gemfile.lock ${APP_DIR}/Gemfile.lock
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
