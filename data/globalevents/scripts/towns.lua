local effects = {
    {pos = Position(1393, 1012, 7), animation = CONST_ME_POISONAREA, text = ""},
}

function onThink()
    for _, effect in pairs(effects) do
        if effect.animation and effect.animation ~= CONST_ME_NONE then
            effect.pos:sendMagicEffect(effect.animation)
        end

        if effect.text and effect.text ~= "" then
            for _, spec in pairs(Game.getSpectators(effect.pos, false, true, 7, 7, 5, 5)) do
                spec:say(effect.text, TALKTYPE_MONSTER_SAY, false, nil, effect.pos)
                break
            end
        end
    end
    return true
end