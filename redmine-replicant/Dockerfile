ARG VERSION="4.2.3"
FROM redmine:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Replace homepage
RUN sed -i "s|root :to => 'welcome#index', :as => 'home'|root :controller => 'projects', :action => 'show', :id => 'replicant', :as => 'home'\n  match '/', :to => 'welcome#index', via: :all|" /usr/src/redmine/config/routes.rb

COPY favicon.ico /usr/src/redmine/public/
COPY configuration.yml /usr/src/redmine/config/
