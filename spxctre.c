#define LUA_LIB

#include <luajit-2.1/lauxlib.h>
#include <luajit-2.1/lua.h>
#include <luajit-2.1/lualib.h>
#include <stdio.h>

static int Ex(lua_State* L) {
    lua_getglobal(L, "vim");
    lua_getfield(L, -1, "cmd");
    lua_pushstring(L, "Ex");

	if (lua_pcall(L, 1, 0, 0) != LUA_OK) {
		fprintf(stderr, "Error calling lua function %s\n", lua_tostring(L, -1));
		return 1;
	}

    lua_settop(L, 0);

    return 0;
}

static void remap(lua_State* L) {
    lua_getglobal(L, "vim");
    lua_getfield(L, -1, "g");

    lua_pushstring(L, " ");
    lua_setfield(L, -2, "mapleader");

    lua_pop(L, 1);

    lua_getfield(L, -1, "keymap");
    lua_getfield(L, -1, "set");

    lua_pushstring(L, "n");
    lua_pushstring(L, "<leader>pv");
    lua_pushcfunction(L, Ex);

	if (lua_pcall(L, 3, 0, 0) != LUA_OK) {
		fprintf(stderr, "Error calling lua function %s\n", lua_tostring(L, -1));
	}

    lua_settop(L, 0);
}

static int start(lua_State* L) {
    lua_getglobal(L, "vim");
    lua_getfield(L, -1, "opt");

    lua_pushboolean(L, 1);
    lua_setfield(L, -2, "number");

    lua_pushboolean(L, 1);
    lua_setfield(L, -2, "relativenumber");

    lua_pushstring(L, "");
    lua_setfield(L, -2, "guicursor");

    lua_pushboolean(L, 1);
    lua_setfield(L, -2, "expandtab");

    lua_pushinteger(L, 4);
    lua_setfield(L, -2, "tabstop");

    lua_pushinteger(L, 4);
    lua_setfield(L, -2, "softtabstop");

    lua_pushinteger(L, 4);
    lua_setfield(L, -2, "shiftwidth");

    lua_settop(L, 0);

    remap(L);

    return 0;
}

static const luaL_Reg spxctre[] = {
    {"start", start},
    {0, 0}};

LUALIB_API int luaopen_libspxctre(lua_State* L) {
    luaL_register(L, "libspxctre", spxctre);
    return 1;
}
