function onUse(cid, item, frompos, item2, topos)
ppos = getPlayerPosition(cid)
temple = getPlayerMasterPos(cid)
if (getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE) then
doTeleportThing(cid, temple, TRUE)
doSendMagicEffect(ppos,66)
doSendAnimatedText(frompos,'Wiee!',16)
else
doPlayerSendCancel(cid,"You can't teleport immediately after fight.")
doSendMagicEffect(ppos,2)
end
return 1
end