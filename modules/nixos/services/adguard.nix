{
  services.adguardhome = {
    enable = true;
    host = "0.0.0.0";
    port = 3003;
    openFirewall = true;
    settings = {
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
	  enabled = false:
	};
      };
    };
    filters = map(url: {enabled = true; url = url; }) [
      "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
      "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"
      "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"
    ];
  };
}
