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
	};
}
	
