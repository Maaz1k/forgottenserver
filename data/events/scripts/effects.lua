local config = {
positions = {

["Tiaptra"] = { x = 1048, y = 1010, z = 6 },
["Txt2"] = { x = 1000, y = 995, z = 6 },
["Txt3"] = { x = 1005, y = 1003, z = 5 }
}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, math.random(1, 255))
end

return TRUE
end 