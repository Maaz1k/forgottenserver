local config = {
    leftTopCorner = {x = 1830, y = 1363},
    rightDownCorner = {x = 1874, y = 1403},
    zPos = 9,
    tileItemId = 3216, --tile item id for scanner, where you want to teleport player, ez to change for tile with uid if someone need
}

local function findFirstEmpty()
    for x = config.leftTopCorner.x, config.rightDownCorner.x do
        for y = config.leftTopCorner.y, config.rightDownCorner.y do
            local tmpPos = {x=x, y=y, z = config.zPos};
            local t = Tile(tmpPos)
            if t ~= nil then
                if(t:getThing():getId() == config.tileItemId and not t:getTopCreature()) then
                    return tmpPos
                end
            end
        end
    end
    return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local availableTrainingSlot = findFirstEmpty()
    if(availableTrainingSlot) then
        cid:teleportTo(availableTrainingSlot)
        cid:sendTextMessage(MESSAGE_INFO_DESCR, "Welcome.")
    else
        cid:sendTextMessage(MESSAGE_INFO_DESCR, "No available slots.")
    end
    return true
end