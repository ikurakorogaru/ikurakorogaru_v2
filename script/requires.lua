local directories = {
	["external"] = {
		["patpat"] = require("script.lib.external.patpat"),
	},
	["layer1"] = {
		["utils"] = {
			["string"] = require("script.lib.layer1.utils.string"),
			["table"] = require("script.lib.layer1.utils.table"),
			["number"] = require("script.lib.layer1.utils.number"),
		},
	},
	["layer2"] = {
		["ping"] = require("script.lib.layer2.ping"),
		["draw"] = {
			["rect"] = require("script.lib.layer2.draw.rect"),
		},
		["actionwheel"] = require("script.lib.layer2.actionwheel"),
	},
	["layer3"] = {
	},

}
return directories
