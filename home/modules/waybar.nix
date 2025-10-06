{ ... }: {
  programs.waybar = {
    enable = true;
    systemd = { enable = true; };
    style =
      # css
      ''
        @define-color foreground #eeeeee;
        @define-color foreground-inactive #aaaaaa;
        @define-color background #000000;

        * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 12px;
            padding: 0;
            margin: 0;
        }

        #waybar {
            color: @foreground;
            background-color: @background;
        }

        #tags button {
            padding: 0 0.5em;
            color: @foreground;
        }

        #tags button.empty {
            color: @foreground-inactive;
        }

        #cpu {
            padding-left: 0em
        }
        #memory,
        network {
            padding-left: 1em
        }

        #wireplumber,
        #battery,
        #language,
        #network,
        #bluetooth,
        #tray {
            padding-right: 1em
        }
      '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 5;
        output = [ "eDP-1" ];
        modules-left = [ "river/tags" "cpu" "temperature" "memory" ];
        modules-center = [ "clock" ];
        modules-right =
          [ "wireplumber" "battery" "backlight" "network" "bluetooth" "tray" ];

        "river/tags" = { hide-vacant = true; };
        backlight = {
          format = "{icon}   {percent}%";
          format-icons = [ "󰹐" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩕" "󱩖" "󰛨" ];
        };
        cpu = { format = "  {usage}%  "; };
        clock = { format = "{:%d.%m.%Y | %H:%M}"; };
        wireplumber = {
          format = "    {volume}% ";
          max-volume = 100;
        };
        battery = {
          interval = 65;
          format = "{icon}  {capacity}% ";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
        memory = {
          interval = 40;
          format = "   {used:0.1f}G";
        };
        temperature = { format = "󰏈   {temperatureC} ºC"; };
        tray = {
          icon-size = 16;
          icon-spacing = 16;
        };
        bluetooth = {
          format = " 󰂯 ";
          format-disabled = " 󰂲 ";
          format-connected = " 󰂱 ";
          tooltip-format = "{controller_alias}	{controller_address}";
          tooltip-format-connected = ''
            {controller_alias}	{controller_address}

            {device_enumerate}'';
          tooltip-format-enumerate-connected =
            "{device_alias}	{device_address}";
        };
        network = {
          format = " ";
          format-ethernet = "  󰈀  ";
          format-wifi = " {icon}";
          format-disconnected = "  󰤭 ";
          format-icons = [ "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
        };
      };
    };
  };
}
