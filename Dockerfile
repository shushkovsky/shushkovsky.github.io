FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

LABEL MAINTAINER="Amir Pourmand"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
      locales \
      imagemagick \
      ruby-full \
      build-essential \
      zlib1g-dev \
      jupyter-nbconvert \
      inotify-tools \
      procps \
      # add Node.js & npm for ExecJS
      curl \
      ca-certificates \
      gnupg && \
    # install Node 18.x from NodeSource
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends \
      nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# enable UTF-8
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JEKYLL_ENV=production

# install Jekyll+Bundler gems
RUN gem install jekyll bundler

# create our working dir
RUN mkdir -p /srv/jekyll
WORKDIR /srv/jekyll

# copy both Gemfile AND Gemfile.lock so bundle install picks up your locked versions
COPY Gemfile Gemfile.lock ./

# install gems
RUN bundle install --no-cache

# now copy the rest of your site
COPY . .

# expose & run
EXPOSE 8080
COPY bin/entry_point.sh /tmp/entry_point.sh
CMD ["/tmp/entry_point.sh"]
