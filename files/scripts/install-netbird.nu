#!/usr/bin/env nu

print "Fetching latest Netbird version..."
let latest_version = (http get https://api.github.com/repos/netbirdio/netbird/releases/latest | get tag_name | str trim -c 'v')

let filename = $"netbird_($latest_version)_linux_amd64.tar.gz"
let download_url = $"https://github.com/netbirdio/netbird/releases/download/v($latest_version)/($filename)"

print $"Downloading Netbird v($latest_version)..."
http get $download_url | save -f $filename

print "Extracting archive..."
tar xzf $filename

print "Installing to /usr/bin/netbird..."
mv netbird /usr/bin/netbird
chmod +x /usr/bin/netbird

rm $filename

print "Netbird successfully installed!"
