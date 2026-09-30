#!/bin/sh
set -eu

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
version=$(sed -n 's/^Version: //p' "$project_dir/debian/control")
package_dir=$(mktemp -d)
trap 'rm -rf "$package_dir"' EXIT HUP INT TERM

install -Dm755 "$project_dir/lazydocker-gui" "$package_dir/usr/bin/lazydocker-gui"
install -Dm644 "$project_dir/lazydocker-gui.desktop" "$package_dir/usr/share/applications/lazydocker-gui.desktop"
install -Dm644 "$project_dir/icon_lazyDocker.png" "$package_dir/usr/share/pixmaps/lazydocker-gui.png"
install -Dm644 "$project_dir/debian/control" "$package_dir/DEBIAN/control"

chmod 755 "$package_dir"
mkdir -p "$project_dir/dist"
dpkg-deb --build --root-owner-group "$package_dir" "$project_dir/dist/lazydocker-gui_${version}_all.deb"
printf 'Built %s\n' "$project_dir/dist/lazydocker-gui_${version}_all.deb"