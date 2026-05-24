local directories = {
	["external"] = {
		["patpat"] = require("script.lib.external.patpat"),
	},
	["layer1"] = {
		["ping"] = require("script.lib.layer1.ping"),
		["tick"] = require("script.lib.layer1.tick"),

		["utils"] = {
			["string"] = require("script.lib.layer1.utils.string"),
			["table"] = require("script.lib.layer1.utils.table"),
		},
	},
	["layer2"] = {
		["draw"] = {
			["rect"] = require("script.lib.layer2.draw.rect"),
		},
	},
	["layer3"] = {
		["ui"] = {
			["border"] = require("script.lib.layer3.ui.border"),
			["button"] = require("script.lib.layer3.ui.button"),
		},
	},

}

return directories
