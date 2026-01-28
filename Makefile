DESTDIR=
PREFIX ?= /usr/local

SERVICES_DIR=$(DESTDIR)$(PREFIX)/etc/shepherd.d

SERVICES = $(shell find . -name '*.scm' -exec basename {} \;)

.PHONY: all install uninstall

all: install

list:
	@echo "Services found:"
	@echo $(SERVICES)

install:
	install -d $(SERVICES_DIR)
	install -m 644 $(SERVICES) $(SERVICES_DIR)/

uninstall:
	cd $(SERVICES_DIR) && rm -f $(SERVICES)
	-rmdir $(SERVICES_DIR)
