.PHONY: all clean

name := spxctre

build:
	mkdir -p ./modules
	gcc -shared -fPIC -Wall -Wextra -std=c99 -o ./modules/lib${name}.so ${name}.c

clean:
	rm ./modules/lib${name}.so
