# Changelog

## Unreleased (maintained by rwmicro)

* Take over maintenance of the project; new extension UUID `search-light@rwmicro.github.io`
* Support GNOME 48, 49 and 50 (Fedora 42 to 44)
* Remove unused code (leftover Calculator provider stub) that used the deprecated `Gio.DesktopAppInfo`
* Blurred background: call ImageMagick (`magick`, falling back to `convert`)
  without a shell, asynchronously, and write the result to the user cache
  directory instead of `/tmp`
* Remove previous maintainers' donation links
* Add French translation and gettext support (`po/`)
* Remove dead code (GNOME < 45 helpers, legacy preference UI) and old build targets
* Add GitHub Actions CI

## ROADMAP

## release 38

* fork gnome 48 from 47
* add multi-user support
* add fade-in animation
* add blurred background
* add panel icon (with color settings)

## release 16

* add web search (scrapped)
* add unit conversion (scrapped)
* add currency conversion (scrapped)

## release 15

* fix monitor preference

## release 14

* port to gnome 45
* remove blur background (permanently?)
* remove panel icon (temporarily?)

## release 11

* fix close on enter/click

## release 9

* add panel search icon
* fix close on escape

## release 8

* fix follow cursor, preferred monitor

## release 7

* improve background blurring
* add custom text color
* fix scroll issue
* fix fullscreen issue

## release 5

* add window borders
* add background blur
* add font-size settings

## release 4

* takes gnome's search outside of overview
* custom search window size
* bind to super+custom keys
* bind to preferred monitor or to cursor
