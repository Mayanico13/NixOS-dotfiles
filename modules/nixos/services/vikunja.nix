{
  services.vikunja = {
    enable = true;
    frontendScheme = "http";
    frontendHostname = "10.234.65.33";
    port = 3456;
    settings = {
      service = {
        enableemailreminders = false;
        enableregistration = false;
        maxavatarsize = 4096;
      };
    };
  };
}
