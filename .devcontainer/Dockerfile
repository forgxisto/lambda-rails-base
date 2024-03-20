# http://docs.docker.jp/compose/rails.html
# https://hub.docker.com/r/library/ruby/

ARG RUBY_VERSION=3.2.3

FROM ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

# Configure bundler
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    BUNDLE_PATH=/rails/vendor/bundle

# Common dependencies
RUN apt -y update \
    && apt -y full-upgrade \
    && apt -y install \
    tzdata \
    locales \
    && apt -y autoremove \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* \
    && truncate -s 0 /var/log/*log \
    && update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8

# Upgrade RubyGems and install the latest Bundler version
RUN gem update --system && \
    gem install bundler

# Configure bundler
ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    BUNDLE_PATH=/rails/vendor/bundle

CMD ["/bin/bash"]

# ================================================= For development
FROM base AS development

WORKDIR /rails

# Set development environment
RUN apt -y update \
    && apt -y full-upgrade \
    && apt -y install \
    build-essential \
    curl \
    unzip \
    git \
    default-mysql-client \
    default-libmysqlclient-dev \
    locales \
    vim \
    tmux \
    && apt -y autoremove \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

# Install NodeJS and Yarn
ARG NODE_MAJOR=20
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash - \
    && apt -y install nodejs \
    && npm update -g npm

# Install sam-cli
RUN curl -O -L https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-arm64.zip
RUN unzip aws-sam-cli-linux-arm64.zip -d sam-installation
RUN ./sam-installation/install

# Install overmind
RUN curl -O -L https://github.com/DarthSim/overmind/releases/download/v2.4.0/overmind-v2.4.0-linux-arm.gz
RUN gunzip -d overmind-v2.4.0-linux-arm.gz
RUN chmod +x overmind-v2.4.0-linux-arm
RUN mv overmind-v2.4.0-linux-arm /usr/local/bin/overmind

# Copy source
COPY . .

EXPOSE 3000

# ================================================= For production-builder
FROM development AS production-builder

WORKDIR /rails

# Set production environment
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_WITHOUT=development \
    DEBIAN_FRONTEND=noninteractive

# Build source
RUN rm -fr ${BUNDLE_PATH} \
    && mkdir -p ${BUNDLE_PATH} \
    && bundle config --local deployment 'true' \
    && bundle install --jobs=${BUNDLE_JOBS} \
    && rm -rf "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git \
    && bundle exec bootsnap precompile --gemfile

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# ================================================= For production
FROM base AS production

WORKDIR /rails

ENV RAILS_ENV=production \
    BUNDLE_WITHOUT=development \
    RAILS_SERVE_STATIC_FILES=true

# Install packages needed for deployment
RUN gem install 'aws_lambda_ric'

# Copy source
COPY . .
# Copy artifacts
COPY --from=production-builder $BUNDLE_PATH $BUNDLE_PATH
COPY --from=production-builder /rails/public /rails/public
COPY --from=production-builder /rails/tmp /rails/tmp

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash \
    && chown -R rails:rails db log storage tmp
USER rails:rails

ENTRYPOINT [ "/usr/local/bundle/bin/aws_lambda_ric" ]

CMD ["config/environment.Lamby.cmd"]
