# nixos: már edition 🐱
welcome to my [nixos](https://nixos.org/) dots! here you'll find both configuration files for my personal computer and my laptop, alongside their
configuration using [home-manager](https://nix-community.github.io/home-manager/).

i made this config aiming to have a simple, minimalist environment that helps me focus while having a pleasant visual that makes everything feels connected.

currently, the only way to run this flake is with either the `#laptop` or the `#desktop` variant. i'm planning on adding a way to run only the
shared modules (and not the system configuration) soon™.

speaking of which, the configuration for each app can be found in the [`modules`](./modules) folder. the modules are split in 2 pieces:
- [`hm/`](./modules/hm): configuration for each app that is installed and/or configured by the user. if you want to change some setting, it's probably there.
modules should be imported in the `home.nix` file.
- [`nixos/`](./modules/nixos): configuration for system-level apps, such as daemons, services, universal packages, etc. modules should be imported in the `configuration.nix` file.

you can also find shared files that i use to sync my laptop with my desktop. here's the setup:
- [`shared/home.nix`](./shared/home.nix): base and shared configuration for home-manager.
- [`shared/configuration.nix`](./shared/configuration.nix): base and shared configuration for nixos.

of course, those won't include `hardware-configuration.nix` because my laptop and my desktop run on different hardware. you can find their specific overrides in their respective files.

while i don't make this flake configurable (as you being able to use specific modules, e.g. the `waybar` config), keep in mind that it is made specifically *for my needs*.

> [!CAUTION]
> **DO NOT** run this flake or you might need to rollback your OS (due to `hardware-configuration.nix`).

however, feel free to copy or use any of my modules for your own configs.

## screenshots
screenshot from my laptop:
![a screenshot of the desktop environment from my laptop](./screenshots/laptop.png)
screenshot from my PC:
![a screenshot of the desktop environment from my desktop](./screenshots/desktop.png)
