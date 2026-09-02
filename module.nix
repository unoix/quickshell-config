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

		xdg.configFile."quickshell".source = ./config;
		xdg.configFile."quickshell/colors.qml".text = ''
			pragma Singleton
			import quickshell
			
			QtObject {
				property color bg = "#${config.lib.stylix.colors.base00}"
				property color bg-alt = "#${config.lib.stylix.colors.base01}"
				property color base02 = "#${config.lib.stylix.colors.base02}"
				property color base03 = "#${config.lib.stylix.colors.base03}"
				property color text-alt = "#${config.lib.stylix.colors.base04}"
				property color text = "#${config.lib.stylix.colors.base05}"
				property color base06 = "#${config.lib.stylix.colors.base06}"
				property color base07 = "#${config.lib.stylix.colors.base07}"
			}
		'';
	};
}
	
