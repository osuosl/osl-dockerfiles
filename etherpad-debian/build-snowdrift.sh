#!/bin/bash
set -ex
ETHERPAD_PLUGINS="ep_adminpads3 ep_chatdate ep_desktop_notifications ep_hide_referrer ep_small_list ep_comments_page ep_author_hover ep_webrtc"
docker build . --build-arg ETHERPAD_PLUGINS="$ETHERPAD_PLUGINS" --tag osuosl/etherpad-snowdrift
