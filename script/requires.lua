local directories = {
    ["layer1"] = {
        ["ping"] = require("script.lib.layer1.ping"),
        ["tick"] = require("script.lib.layer1.tick"),

        ["utils"] = {
            ["string"] = require("script.lib.layer1.utils.string"),
            ["table"] = require("script.lib.layer1.utils.table"),
        },
        ["external"] = {
            ["patpat"] = require("script.lib.layer1.external.patpat"),
        },
    },
    ["layer2"] = {
        ["ui"] = {
            ["border"] = require("script.lib.layer2.ui.border"),
        },
    },

}

return directories
