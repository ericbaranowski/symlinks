# Makefile for symlinks
CC      = gcc
CFLAGS += $(/usr/bin/getconf LFS_CFLAGS 2>/dev/null)
OWNER   = $(USER)
GROUP   = staff
MANDIR  = /usr/local/share/man/man8/symlinks.8
BINDIR  = /usr/local/bin
INSTALL = /usr/bin/install

.PHONY: all
all: symlinks

symlinks: symlinks.c
	$(CC) -Wall -Wstrict-prototypes -O2 $(CFLAGS) -o symlinks symlinks.c

install: all symlinks.8
	$(INSTALL) -c -o $(OWNER) -g $(GROUP) -m 755 symlinks $(BINDIR)
	$(INSTALL) -c -o $(OWNER) -g $(GROUP) -m 644 symlinks.8 $(MANDIR)

.PHONY: clean
clean:
	rm -f symlinks *.o core
	rm -f $(BINDIR)/symlinks
	rm -f $(MANDIR)
