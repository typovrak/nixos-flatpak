# nixos-flatpak

nixos-flatpak = fetchGit {
	url = "https://github.com/typovrak/nixos-flatpak.git";
	ref = "main";
};

(import "${nixos-flatpak}/configuration.nix")
