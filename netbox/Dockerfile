# NetBox Docker with OSL plugins
# Based on: https://github.com/netbox-community/netbox-docker/wiki/Using-Netbox-Plugins
#
# Plugins included:
#   - netbox-secrets: Secret/password management
#   - netbox-floorplan-plugin: Datacenter floor plan visualization
#   - netbox-acls: Access Control List management
#   - netbox-topology-views: Network topology visualization
#   - netbox-reorder-rack: Drag-and-drop rack reordering
#   - netbox-inventory: Hardware inventory tracking
#
FROM docker.io/netboxcommunity/netbox:v4.4

LABEL maintainer="OSU Open Source Lab <dockerhub@osuosl.org>"
LABEL org.opencontainers.image.source="https://github.com/osuosl/osl-dockerfiles"
LABEL org.opencontainers.image.description="NetBox with OSL custom plugins"

# Copy plugin requirements and install plugins
COPY plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install --no-cache-dir -r /opt/netbox/plugin_requirements.txt

# Copy default plugin configuration (enables all installed plugins)
# This can be overridden at runtime by mounting a custom plugins.py
# e.g., -v /path/to/plugins.py:/etc/netbox/config/plugins.py:ro
COPY plugins.py /etc/netbox/config/plugins.py

# Collect static files for plugins that have them
# The SECRET_KEY is only used during build for static collection
RUN SECRET_KEY="dummy-key-for-static-collection-only-not-used-at-runtime" \
    /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
