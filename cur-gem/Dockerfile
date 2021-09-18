FROM ruby:3.0.1

RUN mkdir /gem
WORKDIR /gem

ADD Gemfile /gem/Gemfile
ADD Gemfile.lock /gem/Gemfile.lock
ADD cur.gemspec /gem/cur.gemspec
ADD lib/cur/version.rb /gem/lib/cur/version.rb

RUN bundle install

CMD ["/bin/bash"]
