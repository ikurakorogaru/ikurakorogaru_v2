local ping = require("script.libs.ping")
ping.setnum("a/b", "test")
print(ping.getnum("a/b"))
