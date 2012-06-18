NAME=$(shell awk '/Name/ { print $$2 }' *.spec)
VERSION := $(shell awk '/Version:/ { print $$2 }' $(NAME).spec)
RELEASE := $(shell awk '/Release:/ { print $$2 }' $(NAME).spec | sed 's|%{?dist}||g')

archive:
	@git archive --format=tar --prefix=$(NAME)-$(VERSION)/ HEAD > $(NAME)-$(VERSION).tar
	@bzip2 -f $(NAME)-$(VERSION).tar
	@echo "$(NAME)-$(VERSION).tar.bz2 created"

clean:
	rm -f *~ *bz2
