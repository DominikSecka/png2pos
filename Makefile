CC = gcc
CFLAGS += -std=c99 -W -Wall -pedantic -ftree-vectorize \
	-fPIE -pie -fstack-protector -O3 -D_FORTIFY_SOURCE=2 \
	-Ideps/lodepng \
	-D_POSIX_C_SOURCE=200809L \
	-D_FILE_OFFSET_BITS=64 \
	-DLODEPNG_NO_COMPILE_ANCILLARY_CHUNKS \
	-DLODEPNG_NO_COMPILE_CPP \
	-DLODEPNG_NO_COMPILE_ALLOCATORS
LDFLAGS += -Wl,-z,now -Wl,-z,relro
PREFIX := /usr/local

all : png2pos

man : png2pos.1.gz

.PHONY : clean install uninstall

clean :
	-rm -f *.o png2pos
	-rm *.pos *.gz debug.* *.backup

install : all man
	mkdir -p $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PREFIX)/share/man/man1
	install -m755 png2pos $(DESTDIR)$(PREFIX)/bin
	install -m644 png2pos.1.gz $(DESTDIR)$(PREFIX)/share/man/man1
	install -m644 -T png2pos.complete /etc/bash_completion.d/png2pos

uninstall :
	rm -f $(DESTDIR)$(PREFIX)/bin/png2pos
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/png2pos.1.gz
	rm -f /etc/bash_completion.d/png2pos

png2pos : png2pos.o deps/lodepng/lodepng.o
	@printf "%-16s%s\n" LD $@
	@$(CC) $^ $(LDFLAGS) -o $@
	@-strip --strip-unneeded $@

%.o : %.c
	@printf "%-16s%s\n" CC $@
	@$(CC) -c $(CFLAGS) -o $@ $<

deps/lodepng/%.o : deps/lodepng/%.cpp
	@printf "%-16s%s\n" CC $@
	@$(CC) -x c -c $(CFLAGS) -o $@ $<

%.1.gz : %.1
	@printf "%-16s%s\n" GZIP $@
	@gzip -c -9 $< > $@

static : CFLAGS += -static
static : LDFLAGS += -static
static : all

debug : CFLAGS += -DDEBUG
debug : all
	@ls -l png2pos
	@./png2pos -V

update :
	git submodule update --recursive --merge
