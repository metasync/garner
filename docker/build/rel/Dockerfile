ARG base_image_repo=docker.io/ruby
ARG base_image_tag
FROM ${base_image_repo}:${base_image_tag} AS base

ARG app_home=/home/app
ENV APP_HOME=${app_home}
ENV HISTFILE=${APP_HOME}/.bash_history

RUN apk -U upgrade && \
    mkdir ${APP_HOME}

WORKDIR ${APP_HOME}

COPY ../../../ .

FROM base AS dependencies

RUN apk add --no-cache \
        freetds-dev mariadb-dev libpq-dev \
        build-base gcompat && \
        \
        bundle config set without "development test" && \
        bundle install --jobs=3 --retry=3

FROM base

COPY --from=dependencies ${APP_HOME} ${APP_HOME}
COPY --from=dependencies /usr/local/bundle/ /usr/local/bundle/

RUN apk add --no-cache \
        freetds-dev mariadb-dev libpq-dev \
        gcompat curl make

ARG project
ARG app
ARG version
ARG release_tag
ARG build_number
ARG app_source
ARG authors
ARG image_repo
ARG image_tag
ARG base_image_repo
ARG base_image_tag
ARG ruby_version
ARG alpine_version
ARG created_at

ENV PROJECT_NAME=${project}
ENV APP_NAME=${app}
ENV APP_VERSION=${version}-${release_tag}.${build_number}

LABEL org.opencontainers.image.title=${project}-${app} \
    org.opencontainers.image.version=${version}-${release_tag}.${build_number} \
    org.opencontainers.image.authors=${authors} \
    org.opencontainers.image.source=${app_source} \
    org.opencontainers.image.created=${created_at} \
    \
    org.metasync.project=${project} \
    org.metasync.app=${app} \
    org.metasync.app.release=${version}-${release_tag}.${build_number} \
    org.metasync.app.version=${version} \
    org.metasync.app.release_tag=${release_tag} \
    org.metasync.app.build_number=${build_number} \
    org.metasync.maintainer=${authors} \
    \
    org.metasync.image.repo=${image_repo} \
    org.metasync.image.tag=${image_tag} \
    org.metasync.image.name=${image_repo}:${image_tag} \
    \
    org.metasync.base_image.repo=${base_image_repo} \
    org.metasync.base_image.tag=${base_image_tag} \
    org.metasync.base_image.name=${base_image_repo}:${base_image_tag} \
    \
    org.metasync.ruby.version=${ruby_version} \
    org.metasync.alpine.version=${alpine_version}
