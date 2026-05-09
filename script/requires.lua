local directories = {
    ["layer1"] = {
        ["ping"] = require("script.lib.layer1.ping"),
        ["utils"] = {
            ["string"] = require("script.lib.layer1.utils.string"),
            ["table"] = require("script.lib.layer1.utils.table"),
        },
        ["ui"] = {
            ["border"] = require("script.lib.layer1.ui.border"),
        },
        ["tick"] = require("script.lib.layer1.tick"),
    },
    ["layer2"] = {
        ["patpat"] = require("script.lib.layer2.external.patpat"),
    },

}

return directories
