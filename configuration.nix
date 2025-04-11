{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.flatpak = ''
		export PATH=${pkgs.flatpak}/bin:${pkgs.coreutils}/bin:${pkgs.util-linux}/bin:$PATH
		flatpak install -y flathub com.slack.Slack
		flatpak install -y flathub com.obsproject.Studio
		flatpak install -y flathub org.gimp.GIMP
		flatpak install -y flathub com.vscodium.codium
	'';

	environment.systemPackages = with pkgs; [
		coreutils
		util-linux
		flatpak
		xdg-desktop-portal-gtk
	];

	systemd.services.flatpak-repo = {
    		wantedBy = [ "multi-user.target" ];
    		path = [ pkgs.flatpak ];
    		script = ''
      			flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    		'';
	};

	services.flatpak.enable = true;

	xdg.portal = {
		enable = true;
		config.common.default = "gtk";
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	};
}
