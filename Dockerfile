FROM ruby:2.7.4

WORKDIR /liff-app

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get update -qq && apt-get install -y vim nodejs \
  && npm install -g yarn

COPY Gemfile* /liff-app/

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bundle", "exec", "foreman", "start"]