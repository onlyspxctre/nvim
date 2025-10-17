#ifndef VIM_LIB_H
#define VIM_LIB_H

#include <luajit-2.1/lauxlib.h>
#include <luajit-2.1/lua.h>
#include <luajit-2.1/lualib.h>

#include <stdarg.h>
#include <stdlib.h>

typedef struct {
    int type;
    void* data;
} Lua_Arg;

static lua_State* state;

void vim_bootstrap(lua_State* L) {
    state = L;
}

int vim_cmd(const char* cmd) {

    lua_getglobal(state, "vim");
    lua_getfield(state, -1, "cmd");
    lua_pushstring(state, cmd);

    if (lua_pcall(state, 1, 0, 0) != LUA_OK) {
        lua_getglobal(state, "print");
        
        char buffer[1024] = {0};
        snprintf(buffer, 1024, "Error calling lua function %s\n", lua_tostring(state, -1));
        lua_pushstring(state, buffer);

        lua_pcall(state, 1, 0, 0);
        lua_settop(state, 0);
		return 1;
    }

    lua_settop(state, 0);
    return 0;
}

#endif
