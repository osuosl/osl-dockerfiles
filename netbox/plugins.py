# NetBox plugin configuration for OSL
# This file enables plugins for static file collection during image build.
# Runtime configuration is provided by mounting a custom plugins.py via Chef.

PLUGINS = [
    'netbox_secrets',
    'netbox_floorplan',
    'netbox_acls',
    'netbox_topology_views',
    'netbox_reorder_rack',
    'netbox_inventory',
]

# Empty config - runtime settings provided by Chef
PLUGINS_CONFIG = {}
