{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./thinkpad-t480s.nix
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  networking.hostName = "ilumix";

  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = ["172.16.1.3/32"];
      dns = ["8.8.8.8"];
      mtu = 1420;

      privateKeyFile = "/home/ilumix/vpn-keys/privatekey";

      peers = [
        {
          publicKey = "wKVJMyLku/uG3AfQrkqREmkxLkg3a6262jI+z4nPql0=";
          allowedIPs = ["10.10.10.0/24" "172.16.1.0/24"];
          endpoint = "94.158.52.17:51430";
          persistentKeepalive = 15;
        }
      ];
    };
  };

  environment.shellAliases = {
    vpn-up = "sudo systemctl start wg-quick-wg0.service";
    vpn-down = "sudo systemctl stop wg-quick-wg0.service";
    wg-stat = "sudo wg show";
  };
}
