FROM ruby

RUN useradd -m -s /bin/bash -d /home/compass compass
WORKDIR /home/compass
RUN chown -R compass /usr/local/bundle
USER compass
ENV HOME /home/compass
RUN gem install bundler

Add ./Gemfile /home/compass/Gemfile
RUN bundle install
VOLUME /home/compass/project
WORKDIR /home/compass/project

CMD compass watch --poll
