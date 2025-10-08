package.cpath = package.cpath .. ";" .. vim.fn.stdpath('config') .. "/modules/?.so;"

spxctre = require("libspxctre")

spxctre.start()
