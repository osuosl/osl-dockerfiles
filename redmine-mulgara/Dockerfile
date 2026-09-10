# Version pinned directly in FROM (no ARG) so Dependabot can parse and bump it
FROM redmine:6.1.4
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

COPY database.yml puma.rb /usr/src/redmine/config/
