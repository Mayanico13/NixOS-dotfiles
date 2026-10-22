{
  services.adguardhome = {
    enable = true;
    openFirewall = true;
    settings = {
      http.address = "10.234.65.33:3003";
      dns = {
        upstream_dns = [
          "1.1.1.1"
          "1.0.0.1"

          "2606:4700:4700::1111"
          "2606:4700:4700::1001"
        ];
        cache_enabled = true;
        cache_size = 4194304;
      };
      filtering = {
        protection_enabled = true;
        filtering_enabled = true;

        parental_enabled = false;
        safe_search = {
          enabled = false;
        };
      };
      filters =
        map (url: {
          enabled = true;
          url = url;
        }) [
          "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
          "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"
          "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"
        ];
    };
  };
}
