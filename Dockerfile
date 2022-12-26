FROM ruby:2.7.4

WORKDIR /liff-app

# node.jsと必要なライブラリのインストトール
RUN apt-get update -qq && apt-get install -y nodejs npm \
  && npm install -g yarn

COPY Gemfile* /liff-app/

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]