FROM otsuge

RUN apt-get update && apt-get install -y cron
RUN echo '*/5 * * * * /bin/bash -l -c '\''source /root/env.sh && cd /usr/src/app && bundle exec rails release:announces'\'' >>/dev/null 2>&1' | crontab -

COPY ./containers/cron/run.sh $APP_ROOT

CMD ["sh", "run.sh"]
