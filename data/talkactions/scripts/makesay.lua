function onSay(cid, words, param, channel)
local t = string.explode(param, ",")
local tmp = t[1]
if(t[2]) then
tmp = t[2]
end
if(param == '') then
doPlayerSendTextMessage(cid, 20, "Command param required.")
return true
end
if not playerExists(t[1]) then
doPlayerSendTextMessage(cid, 20, "This Player no exist.")
return true
else
doCreatureSay(getPlayerByName(t[1]), tmp, 1)
end
return true
end