# flatdhcp.pp
class nova::network::flatdhcp (
  $flat_interface,
  $fixed_range,
  $public_interface    = undef,
  $flat_network_bridge = 'br100',
  $force_dhcp_release  = true,
  $flat_injected       = false,
  $dhcpbridge          = '/usr/bin/nova-dhcpbridge',
  $dhcpbridge_flagfile = '/etc/nova/nova.conf',
  $allow_same_net_traffic = true,
) {

  if $public_interface {
    nova_config { 'public_interface': value => $public_interface }
  }

  nova_config {
    'network_manager':     value => 'nova.network.manager.FlatDHCPManager';
    'fixed_range':         value => $fixed_range;
    'flat_interface':      value => $flat_interface;
    'flat_network_bridge': value => $flat_network_bridge;
    #'flat_dhcp_start':     value => $flat_dhcp_start;
    'force_dhcp_release':  value => $force_dhcp_release;
    'flat_injected':       value => $flat_injected;
    'dhcpbridge':          value => $dhcpbridge;
    'dhcpbridge_flagfile': value => $dhcpbridge_flagfile;
    'allow_same_net_traffic': value => $allow_same_net_traffic;
  }

}
