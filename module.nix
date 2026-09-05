{ config, lib, pkgs, ... }:

let 
	cfg = config.unoix.quickshell;
in
{
	options.unoix.quickshell.enable =
		lib.mkEnableOption "unoix's quickshell config";
	
	config = lib.mkIf cfg.enable {
		home.packages = [
			pkgs.quickshell
		];

		xdg.configFile."quickshell" = {
			source = ./config;
			recursive = true;
		};

		xdg.configFile."quickshell/Colors.qml".text = ''
			pragma Singleton
			import QtQuick
			
			QtObject {
				property color bg: "#${config.lib.stylix.colors.base00}"
				property color base0A: "#${config.lib.stylix.colors.base0A}"
				property color base0B: "#${config.lib.stylix.colors.base0B}"
				property color base0C: "#${config.lib.stylix.colors.base0C}"
				property color borderActive: "#${config.lib.stylix.colors.base0D}"
				property color base0E: "#${config.lib.stylix.colors.base0E}"
				property color base0F: "#${config.lib.stylix.colors.base0F}"
				property color bgAlt: "#${config.lib.stylix.colors.base01}"
				property color base02: "#${config.lib.stylix.colors.base02}"
				property color borderInactive: "#${config.lib.stylix.colors.base03}"
				property color textAlt: "#${config.lib.stylix.colors.base04}"
				property color text: "#${config.lib.stylix.colors.base05}"
				property color base06: "#${config.lib.stylix.colors.base06}"
				property color base07: "#${config.lib.stylix.colors.base07}"
				property color base08: "#${config.lib.stylix.colors.base08}"
				property color base09: "#${config.lib.stylix.colors.base09}"
			}
		'';
	};
}
	
