# hubbel-sdimg
Software defined, reproducible sd card image for hubbel

This repository contains configuration files and the command line for modifying a Raspberry Pi OS image for use in the hubbel [postcardscanner](https://github.com/nzottmann/postcardscanner). To modify the image, the *Raspberry Pi SD Card Image Manager* [sdm](https://github.com/gitbls/sdm) is used.

The image modification happens automatically using a [GitHub Action](https://github.com/features/actions) and the images can be downloaded from *Releases*.

## How to use

Download the image from the release section, flash to a microSD card using a tool like [etcher](https://etcher.balena.io/) or the [Raspberry Pi Imager](https://www.raspberrypi.com/software/) and insert in the hubbel Raspberry Pi.

## Development

To release a new version, add a changelog entry and tag the commit with the new semantic version. After pushing including tags, the action workflow builds the image and appends it to a newly created release.

## hubbel image features

In summary, the hub shows a web interface in the browser in kiosk mode, in the background a python service is running that controls the scanner and provides new postcard scans.

Modifications in detail:

- sdm command line
  - Set locale to de_DE.UTF-8
  - Set keymap to de
  - Disable first start wizard
  - Create user pi with password raspberry
  - Enable console autologin
- Install packages from `hubbel_apps`
- Autostart X using `.bash_profile`
- Autostart chromium-browser on X start with `.xinitrc`
- Copy `postcardscanner.service` systemd-service definition
- hubbel_plugin
  - Install postcardscanner python app
  - Enable camera auto detect

No window manager is installed, the is only the browser on top of the X server. This enforces kiosk mode as there is no mouse/touch controllable interface if the browser would exit.

To prevent the browser from closing, it is called inside an endless while loop in `.xinitrc`. The browser is called with multiple flags for kiosk mode. To prevent the cache eating up all free storage, the flag `--disk-cache-dir=/dev/null` is used.