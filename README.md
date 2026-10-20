<br/>
<p align="center">
  <h3 align="center">Search Light</h3>

  <p align="center">
    A GNOME Shell Extension
    <br/>
    <br/>
  </p>
</p>

> **Note:** the original maintainers are no longer working on this project. I ([rwmicro](https://github.com/rwmicro)) am taking it over and will keep it up to date with recent GNOME and Fedora releases. The original repository is still available at [icedman/search-light](https://github.com/icedman/search-light).

![Contributors](https://img.shields.io/github/contributors/rwmicro/search-light?color=dark-green) ![Forks](https://img.shields.io/github/forks/rwmicro/search-light?style=social) ![Stargazers](https://img.shields.io/github/stars/rwmicro/search-light?style=social) ![Issues](https://img.shields.io/github/issues/rwmicro/search-light) ![License](https://img.shields.io/github/license/rwmicro/search-light) 

![First Release](https://raw.githubusercontent.com/icedman/search-light/main/screenshots/Screenshot%20from%202022-11-03%2011-53-28.png)


This is a Gnome Shell extension that takes the apps search widget out of Overview. Like the macOS spotlight, or Alfred.

### Notice

* Supports GNOME 48, 49 and 50 (Fedora 42 to 44)
* Gnome 47 and prior will now be numer gnome-47 branch
* Gnome 46 port is ready for testing
* Gnome 45 port is ready for testing
* Gnome 44 and prior will be under g44 branch

### Features

* Popup search box
* Colors, background, borders customization
* Blurred background
* Multi-monitor support

## Blurred background

Blurred background feature requires **imagemagick** to be installed in the system which will generate the blurred image.

### Installation

Manual Installation: 
- Clone this repo
```bash
$ git clone https://github.com/rwmicro/search-light
```
- Use the `Makefile` to build and install
```bash 
$ cd search-light
$ make
```

From Gnome Extensions Repository

Visit [repository](https://extensions.gnome.org/extension/5489/search-light/)

### Keybinding

Ctrl+Cmd+Space (change at the preference page)
Cmd - your Windows logo, or the command logo on mac. Linux also calls this the 'Super' key.

### Credits

Originally created by [icedman](https://github.com/icedman/search-light). Blur-My-Shell for background blurring code.
