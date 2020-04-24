focus = 0
talk_start = 0
target = 0
following = false
attacking = false
function onThingMove(creature, thing, oldpos, oldstackpos)
end
function onCreatureAppear(creature)
end
function onCreatureDisappear(cid, pos)
end
function onCreatureTurn(creature)
end
function onCreatureSay(cid, type, msg)
end
function onCreatureChangeOutfit(creature)
end
local effects_with_ares = {
                co = {

					  
					  {"Tiaptra", {x=1048, y=1010, z=6}},
					  {"Welcome", {x=1058, y=1155, z=0}},
					  {"Welcome", {x=1059, y=1154, z=0}},
					  {"Welcome", {x=1060, y=1155, z=0}},
					  {"Welcome", {x=1059, y=1155, z=0}},
                     },
                effects = {1,10},  --random effects from 1 to 10
                coile = 1 
              }
function loop(effects_with_ares) 
    for i=1, #effects_with_ares.co do
        doSendAnimatedText(effects_with_ares.co[i][2], effects_with_ares.co[i][1], math.random(1, 210))
        doSendMagicEffect(effects_with_ares.co[i][2], effects_with_ares.effects[math.random(1, #effects_with_ares.effects)])
    end
    addEvent(loop,(effects_with_ares.coile*1000),effects_with_ares)
    efektstart = 1
end
function onThink()
    if efektstart ~= 1 then
        addEvent(loop,1,effects_with_ares)
    end
end