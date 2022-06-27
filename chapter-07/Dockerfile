FROM ruby
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    postgresql-client \
    nodejs

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
RUN mkdir /myapp
ADD . /myapp
WORKDIR /myapp
RUN RAILS_ENV=development bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0"]