function onCastSpell(cid, var)
local chance = math.random(2, 596)

   local creature = Creature(cid)
   local position = creature:getPosition()
   local lookType = tonumber(chance)
   if lookType >= 0 and lookType ~= 1 and lookType ~= 75 and (lookType <= 125 or lookType >= 192) and (lookType <= 250 or lookType >= 253) and (lookType <= 265 or lookType >= 271) and lookType ~= 273 and (lookType <= 277 or lookType >= 280) and (lookType <= 287 or lookType >= 290) and lookType ~= 302 and (lookType <= 323 or lookType >= 326) and (lookType <= 326 or lookType >= 330) and (lookType <= 330 or lookType >= 333) and (lookType <= 334 or lookType >= 337) and (lookType <= 365 or lookType >= 380) and (lookType <= 385 or lookType >= 391) and lookType ~= 392 and (lookType <= 400 or lookType >= 403) and (lookType <= 404 or lookType >= 407) and lookType ~= 411 and lookType ~= 415 and (lookType <= 420 or lookType >= 423) and lookType ~= 424 and (lookType <= 425 or lookType >= 428) and (lookType <= 429 or lookType >= 434) and (lookType <= 436 or lookType >= 441) and lookType ~= 447 and lookType ~= 450 and lookType ~= 459 and (lookType <= 462 or lookType >= 467) and lookType ~= 468 and lookType ~= 469 and (lookType <= 470 or lookType >= 473) and (lookType < 474 or lookType > 485) and lookType ~= 493 and (lookType <= 500 or lookType >= 504) and  lookType ~= 506 and lookType ~= 507 and (lookType <= 511 or lookType >= 517) and (lookType <= 517 or lookType >= 523) and (lookType <= 523 or lookType >= 527) and lookType ~= 536 and (lookType <= 539 or lookType >= 544) and (lookType <= 546 or lookType >= 550) and lookType ~= 559 and lookType ~= 571 and lookType ~= 572 and (lookType <= 573 or lookType >= 579) and lookType ~= 576 and lookType ~= 580 and lookType ~= 581 and lookType ~= 582 and lookType <= 596 then
     local creatureOutfit = creature:getOutfit()
     creatureOutfit.lookType = lookType
     creature:setOutfit(creatureOutfit)
     position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
   else
   return false
end
end