FROM ruby:2.3.1

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install -j4

COPY . $APP_ROOT

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0", "--pid", "/tmp/server.pid"]
