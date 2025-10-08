.PHONY: all clean

name := spxctre

build:
	gcc -shared -fPIC -Wall -Wextra -std=c99 -o ./lua_modules/lib${name}.so ${name}.c

clean:
	rm ./lua_modules/lib${name}.so
