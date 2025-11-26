# NetBox plugin configuration for OSL
# This file is loaded by NetBox's configuration system

PLUGINS = [
    'netbox_secrets',
    'netbox_floorplan',
    'netbox_acls',
    'netbox_topology_views',
    'netbox_reorder_rack',
    'netbox_inventory',
]

PLUGINS_CONFIG = {
    'netbox_secrets': {
        # Enable session key for secrets encryption
        # Users will need to set up their session key after login
    },
    'netbox_floorplan': {
        # Default configuration
    },
    'netbox_acls': {
        # Default configuration
    },
    'netbox_topology_views': {
        # Enable device role-based coloring
        'device_img': 'name',
        'preselected_device_roles': [],
        'allow_coordinates_saving': True,
    },
    'netbox_reorder_rack': {
        # Default configuration
    },
    'netbox_inventory': {
        # Default configuration
        'used_status_name': 'used',
        'stored_status_name': 'stored',
        'sync_hardware_serial_asset_tag': True,
    },
}
