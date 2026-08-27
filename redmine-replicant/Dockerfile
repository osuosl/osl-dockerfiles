# Version pinned directly in FROM (no ARG) so Dependabot can parse and bump it
FROM redmine:6.1.2
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Homepage becomes the replicant project: drop every stock welcome root (6.1 has two) and insert ours first; final grep fails the build if the patch ever stops applying
RUN grep -q "root :to => 'welcome#index'" /usr/src/redmine/config/routes.rb && \
    sed -i "/root :to => 'welcome#index'/d" /usr/src/redmine/config/routes.rb && \
    sed -i "s|^Rails.application.routes.draw do$|Rails.application.routes.draw do\n  root :controller => 'projects', :action => 'show', :id => 'replicant', :as => 'home'\n  match '/', :to => 'welcome#index', via: :all|" /usr/src/redmine/config/routes.rb && \
    grep -q "root :controller => 'projects', :action => 'show', :id => 'replicant'" /usr/src/redmine/config/routes.rb

COPY favicon.ico /usr/src/redmine/app/assets/images/
COPY configuration.yml database.yml puma.rb /usr/src/redmine/config/
