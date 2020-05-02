local CTF_JOIN = 15153
local CTF_LEAVE = 15154
local CTF_DROPFLAG = 15155

function onStepIn(creature, item, position, fromPosition)
    local actionid = item:getActionId()
    if not captureTheFlag.open then
        if position ~= fromPosition then
            creature:teleportTo(fromPosition)
        end
        creature:sendCancelMessage('This event is currently closed.')
        return true
    end
 
 if creature:getLevel() < 200 then
    local vaeas = {x = 1000, y = 1000, z = 7}  -- 32470, 32473, 6
    creature:teleportTo(vaeas)
    creature:sendTextMessage(MESSAGE_INFO_DESCR, "YOU NEED LEVEL 200+ TO ENTER.")
    return false
    end   
    
 -- CAPTURE START
if creature:isPlayer() then
if creature:getItemCount(2165) > 0 then
local vaeap = {x = 1000, y = 1000, z = 7}  -- 32470, 32473, 6
    creature:teleportTo(vaeap)
    creature:sendTextMessage(MESSAGE_INFO_DESCR, "You can't enter with stealth ring.")
        return false   
    end
    end
-- CAPTURE END
  -- AQUI
    if actionid == CTF_JOIN then
        captureTheFlag.onJoin(creature)
        broadcastMessage("Player "..creature:getName().." joined Capture The Flag event!", MESSAGE_STATUS_WARNING)
    elseif actionid == CTF_LEAVE then
        captureTheFlag.onLeave(creature)
        broadcastMessage("Player "..creature:getName().." left the event Capture The Flag!", MESSAGE_STATUS_WARNING)
    elseif actionid == CTF_DROPFLAG then
        local info = captureTheFlag.players[creature:getName()]
        local team = captureTheFlag.teams[info.team]
        if info.flag and position:getDistance(team.base) < position:getDistance(captureTheFlag.teams[info.team == 1 and 2 or 1].base) then         
            team.score = team.score + 1
            captureTheFlag.round(info.team)
            info.flag = nil
        end
    end
    return true
end