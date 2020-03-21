# cannot use slim here
FROM ruby:2.6.5

LABEL Name=geolocation_api Version=0.0.1
EXPOSE 3000

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
# avoid errors with rails app not found
RUN rake app:update:bin

# We need to add -b 0.0.0.0, otherwise it runs on localhost within the container and it's not visible
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
