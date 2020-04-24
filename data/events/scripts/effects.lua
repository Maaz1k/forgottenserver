local config = {
positions = {
["Tiaptra"] = { x = 1048, y = 1010, z = 6 },
},

effects = {
CONST_ME_MAGIC_BLUE,
CONST_ME_MAGIC_GREEN,
CONST_ME_MORTAREA
},

colors = {
TEXTCOLOR_WHITE,
TEXTCOLOR_ORANGE,
TEXTCOLOR_GREEN,
TEXTCOLOR_BLUE
}
}
function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendMagicEffect(pos, config.effects[math.random(1, #config.effects)])
doSendAnimatedText(pos, text, config.colors[math.random(1, #config.colors)])
end
return TRUE
end 