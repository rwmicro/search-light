UUID = search-light@icedman.github.com
EXT_DIR = ~/.local/share/gnome-shell/extensions/$(UUID)
PO_FILES = $(wildcard po/*.po)

all: build install lint

.PHONY: all build install publish install-zip pot mo test-prefs test-shell lint xml-lint pretty

build:
	glib-compile-schemas --strict --targetdir=schemas/ schemas

# extract translatable strings into po/search-light.pot
pot:
	xgettext --from-code=UTF-8 --package-name=search-light -o po/search-light.pot \
		--add-comments=TRANSLATORS \
		-L JavaScript extension.js prefs.js shortcuts.js monitors.js
	xgettext --from-code=UTF-8 -j -o po/search-light.pot -L Glade ui/*.ui
	for po in $(PO_FILES); do msgmerge --update --backup=none $$po po/search-light.pot; done

# compile translations into locale/<lang>/LC_MESSAGES/search-light.mo
mo:
	for po in $(PO_FILES); do \
		lang=$$(basename $$po .po); \
		mkdir -p locale/$$lang/LC_MESSAGES; \
		msgfmt $$po -o locale/$$lang/LC_MESSAGES/search-light.mo; \
	done

install: build mo
	mkdir -p $(EXT_DIR)
	cp -R ./* $(EXT_DIR)/

publish: build mo
	rm -rf build
	mkdir build
	cp LICENSE README.md CHANGELOG.md metadata.json stylesheet.css ./build
	cp *.js ./build
	cp -r ui preferences effects schemas locale ./build
	rm -f ./build/schemas/gschemas.compiled
	rm -f ./*.zip
	cd build ; \
	zip -qr ../$(UUID).zip .

install-zip: publish
	echo "installing zip..."
	rm -rf $(EXT_DIR)
	mkdir -p $(EXT_DIR)
	unzip -q $(UUID).zip -d $(EXT_DIR)

test-prefs:
	gnome-extensions prefs $(UUID)

test-shell: install
	env GNOME_SHELL_SLOWDOWN_FACTOR=1 \
		MUTTER_DEBUG_DUMMY_MODE_SPECS=1280x800 \
		MUTTER_DEBUG_DUMMY_MONITOR_SCALES=1.5 \
		dbus-run-session -- gnome-shell --devkit --wayland
	rm -f /run/user/$$(id -u)/gnome-shell-disable-extensions

lint:
	eslint ./

xml-lint:
	cd ui ; \
	find . -name "*.ui" -type f -exec xmllint --output '{}' --format '{}' \;

pretty: xml-lint
	rm -rf ./build/*
	prettier --single-quote --write "**/*.js"
