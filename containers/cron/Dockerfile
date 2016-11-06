FROM ruby:2.3.1

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

RUN apt-get update && apt-get install -y cron
RUN echo '*/5 * * * * /bin/bash -l -c '\''source /root/env.sh && cd /usr/src/app && bundle exec rails release:announces'\'' >>/dev/null 2>&1' | crontab -

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install -j4

COPY . $APP_ROOT
COPY ./containers/cron/run.sh $APP_ROOT

CMD ["sh", "run.sh"]
