# Lazydocker GUI

A small Ubuntu desktop application that checks Docker CE and Lazydocker, checks the latest Lazydocker release, and launches Lazydocker in a terminal. Lazydocker itself is a terminal UI, so it opens in a terminal window rather than an embedded graphical panel.

## Build and install

From this directory, run:

```sh
./build-deb.sh
sudo apt install ./dist/lazydocker-gui_1.0.3-1_all.deb
```

The package installs a desktop-menu entry and app icon, and depends on Python Tk and a terminal emulator. Install Docker CE from [Docker's Ubuntu instructions](https://docs.docker.com/engine/install/ubuntu/) if it is not already configured. Docker CE updates use apt after confirmation; Lazydocker can be installed or updated per-user from the app. To update this manager from a downloaded package, choose **Update app from local .deb** and select a newer `lazydocker-gui` package. **Uninstall app** removes this manager while leaving Docker CE and Lazydocker installed.

For a terminal-only status check, run `lazydocker-gui --check`.