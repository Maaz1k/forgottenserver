function Position.sendMessage(self, message, talktype)
    local specs = Game.getSpectators(self, false, true, 7, 7, 5, 5)
    if #specs > 0 then
        for i = 1, #specs do
            local player = specs[i]
            player:say(message, talktype or TALKTYPE_MONSTER_SAY, false, player, self)
        end
    end
end



local effects = {
    {pos = Position(1398, 1008, 7), magicEffect = CONST_ME_TELEPORT, text = "Tiaptra"}
}

function onThink()
    for , v in pairs(effects) do
        v.pos:sendMagicEffect(magicEffect)
        if v.text ~= "" then
            v.pos:sendMessage(v.text)
        end
    end
    return true
end