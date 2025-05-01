# 🪟 NixOS Flatpak

> Declarative NixOS module to install and configure Flatpak, enable Flathub and auto-install OBS studio.

## 📦 Features

- 🔧 **Flatpak setup :** Installs ```flatpak```, adds Flathub remote if missing and enables ```services.flatpak```.

- 🚀 **Auto-install OBS :** On activation, installs ```com.obsproject.Studio``` from Flathub.

- 🔄 **Idempotent activation :** Safe to run on each ```nixos-rebuild```, will not reinstall if already present.

- 🛠️ **Portal integration :** Enables ```xdg-desktop-portal-gtk``` for Flatpak GUI support.

- ⚙️ **Environment path :** Prepends Flatpak and necessary tools to ```$PATH``` during activation.

- 💾 **Backup**: No backup needed for this module.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-flatpak = fetchGit {
    url = "https://github.com/typovrak/nixos-flatpak.git";
    ref = "main";
    rev = "05cb398922050615b223a96419bbba31b9ab386a"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-flatpak}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Start OBS studio with the i3 dmenu or with this command
```bash
flatpak run com.obsproject.Studio
```

List all flatpaks apps installed in your system
```bash
flatpak list
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
