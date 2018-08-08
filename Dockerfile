FROM ruby:2.5.1

RUN apt-get update -qq && \ 
    apt-get install -y build-essential \
                       libpq-dev curl

# SSH
RUN mkdir /var/run/sshd

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g yarn

# Workspace
RUN mkdir /app

WORKDIR /app

# Ruby
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --path=./vendor/bundle

# Node.js
ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock
RUN yarn

ADD . /app
# VOLUME /app/public
# VOLUME /app/tmp

CMD bundle exec rails s
