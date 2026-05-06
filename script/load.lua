local directorys = {
    "script.libs.external.patpat",
    "script.libs.utils.string",
    "script.libs.ping",
    "script.script.skull.main",

}
for k, v in pairs(directorys) do
    local tryto, msg = pcall(require, v)
    if not tryto then
        print(msg)
    end
end
