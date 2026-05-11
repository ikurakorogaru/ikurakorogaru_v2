local directorys = {
    "script.script.setups",
    "script.script.ui.on",
    "script.script.test",
}
for k, v in pairs(directorys) do
    local tryto, msg = pcall(require, v)
    if not tryto then
        print(msg)
    end
end
