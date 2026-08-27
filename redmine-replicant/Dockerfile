ARG VERSION="6.0.11"
FROM redmine:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Replace homepage with the replicant project page; grep guards against the sed silently not matching on future upgrades
RUN grep -q "root :to => 'welcome#index', :as => 'home'" /usr/src/redmine/config/routes.rb && \
    sed -i "s|root :to => 'welcome#index', :as => 'home'|root :controller => 'projects', :action => 'show', :id => 'replicant', :as => 'home'\n  match '/', :to => 'welcome#index', via: :all|" /usr/src/redmine/config/routes.rb

COPY favicon.ico /usr/src/redmine/app/assets/images/
COPY configuration.yml database.yml puma.rb /usr/src/redmine/config/
