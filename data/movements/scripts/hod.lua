function onStepIn(cid, item, position, fromPosition)
    for i = 17000, 17122 do
        local pos = getThingPos(i)
        if not isPlayer(getTopCreature(pos).uid) then
            doTeleportThing(cid, pos)
             doCreatureSay(cid, 'Using a tool to cast spells or to keep your character online is ok.', TALKTYPE_ORANGE_1, false, cid)
            doSendMagicEffect(position, CONST_ME_TELEPORT)
            doSendMagicEffect(pos, CONST_ME_TELEPORT)
            break
        end
    end
    doTeleportThing(cid, fromPosition, true)
    doCreatureSay(cid, 'All training slots are taken', TALKTYPE_ORANGE_1, false, cid)
    doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
end