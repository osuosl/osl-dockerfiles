FROM node:10-buster-slim
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Plugins to install while building the container. By default no plugins are
# installed.
# If given a value, it has to be a space-separated, quoted list of plugin names.
#
# EXAMPLE:
#   ETHERPAD_PLUGINS="ep_codepad ep_author_neat"
ARG ETHERPAD_PLUGINS=

# Etherpad version to use.
# For a list of versions, see https://github.com/ether/etherpad-lite/releases
#
# EXAMPLE
#   VERSION=1.8.6
ARG VERSION=1.8.6

# By default, Etherpad container is built and run in "production" mode. This is
# leaner (development dependencies are not installed) and runs faster (among
# other things, assets are minified & compressed).
ENV NODE_ENV=production

RUN apt update && apt install -y git

# Follow the principle of least privilege: run as unprivileged user.
#
# Running as non-root enables running this image in platforms like OpenShift
# that do not allow images running as root.
RUN useradd --uid 5001 --create-home etherpad

RUN mkdir /opt/etherpad-lite && chown etherpad:0 /opt/etherpad-lite

USER etherpad

WORKDIR /opt/etherpad-lite

# Clone Etherpad and checkout the version specified. Due to an Etherpad issue,
# it must be cloned to a branch, rather than just checking out the tag.
#
# See: https://github.com/ether/etherpad-lite/issues/4417 
RUN git clone https://github.com/ether/etherpad-lite . && git checkout tags/$VERSION -b osuosl 

# Install node dependencies for Etherpad
RUN bin/installDeps.sh && \
	rm -rf ~/.npm/_cacache

# Install the plugins, if ETHERPAD_PLUGINS is not empty.
#
# Bash trick: in the for loop ${ETHERPAD_PLUGINS} is NOT quoted, in order to be
# able to split at spaces.
RUN for PLUGIN_NAME in ${ETHERPAD_PLUGINS}; do npm install "${PLUGIN_NAME}" || exit 1; done

# Copy the configuration file.
COPY --chown=etherpad:0 ./settings.json.docker /opt/etherpad-lite/settings.json

EXPOSE 9001
CMD ["node", "--experimental-worker", "node_modules/ep_etherpad-lite/node/server.js"]
