.PHONY: all clean

SHELL := /bin/bash

name := spxctre

build:
	mkdir -p ./modules
	gcc -shared -fPIC -Wall -Wextra -std=c99 -O3 -o ./modules/lib${name}.so ${name}.c vimlib.h

clean:
	rm ./modules/lib${name}.so

test:
	rm /tmp/nvim-startup.log
	time vi --startuptime /tmp/nvim-startup.log
	cat /tmp/nvim-startup.log

testp:
	rm /tmp/nvim-startup.log
	time vi -u /dev/null --startuptime /tmp/nvim-startup.log
	cat /tmp/nvim-startup.log

