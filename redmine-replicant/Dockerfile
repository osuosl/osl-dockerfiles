ARG VERSION="4.1.1"
FROM redmine:${VERSION}
LABEL MAINTAINER="OSU Open Source Lab <dockerhub@osuosl.org>"

# Replace homepage
RUN sed -i "s/root :to.*/root :controller => 'projects', :action => 'show', :id => 'replicant', :as => 'home'/" /usr/src/redmine/config/routes.rb

COPY favicon.ico /usr/src/redmine/public/
