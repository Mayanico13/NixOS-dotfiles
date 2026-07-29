{ lib, pkgs, config, ... }:


{
  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = true;
    settings = {
      server = {
        DOMAIN = "10.234.65.33";
        ROOT_URL = "http://10.234.65.33:3010";
        HTTP_PORT = 3010;
      };
      service.DISABLE_REGISTRATION = true;
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
    };
  };
}
