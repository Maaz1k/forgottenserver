talkactionAutoFollowingPlayers = {} --xxx[CID] = targetCID
talkactionAutoFollowingPlayersPlayersFollowed = {} --Follower[cid] = { pname = followed(true/false), pname, pname, pname }

function autoFollowPlayer_follow(playerCid, lastPos)
	if talkactionAutoFollowingPlayers[playerCid] == nil then
		return false
	end

	local player = Player(playerCid)
	if not player then
		talkactionAutoFollowingPlayers[playerCid] = nil 
		return false 
	end

	local target = Player(talkactionAutoFollowingPlayers[playerCid])
	if not target then 
		player:changeSpeed(1540 - player:getSpeed())
		talkactionAutoFollowingPlayers[playerCid] = nil
		return false 
	end


	local targetPos = target:getPosition()
	local playerPos = player:getPosition()

	--Check if target moved
	if lastPos == nil or getDistanceBetween(lastPos,targetPos) > 0 then
		local speedDifference = player:getSpeed() - target:getSpeed()

		if speedDifference ~= 0 then
			player:changeSpeed(-speedDifference)
		end
		player:teleportTo(targetPos, true)
	end
	
	addEvent(autoFollowPlayer_follow, 10, playerCid, playerPos)
	return true
end

function autoFollowPlayer_stopFollow(player)
	talkactionAutoFollowingPlayers[player:getId()] = nil
	player:changeSpeed(1540 - player:getSpeed())
	
	return false
end

--Ways to use
--[[
/autofollow NAME --follows player
/autofollow --Stops autofollow
/autofollow next --Adds any online players not already in list, Goes to next player, Removes from list if player logged out and not visited
/autofollow clear --Clears all followed players, resets list

List resets after following everyone online OR /autofollow list OR Logout
]]
function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local playerName = player:getName()

	--Iterate through list if param N
	if param == "next" then
		if talkactionAutoFollowingPlayersPlayersFollowed[playerName] == nil then
			talkactionAutoFollowingPlayersPlayersFollowed[playerName] = {}
		end
		--Check next player in list
		local nextPlayer = nil
		for checkingPlayerName,checkingPlayerFollowed in pairs(talkactionAutoFollowingPlayersPlayersFollowed[playerName]) do
			if not checkingPlayerFollowed then
				--If still looking for nextPlayer, try to get their player
				local checkingPlayer = Player(checkingPlayerName)
				if checkingPlayer then
					nextPlayer = checkingPlayer
					break
				else--Remove offline player from list
					talkactionAutoFollowingPlayersPlayersFollowed[playerName][checkingPlayerName] = nil
				end
			end
		end

		--If didnt find new player, check for more players online
		if nextPlayer == nil then
			local checkingPlayerOnlineName = nil
			local playersOnline = Game.getPlayers()
			for _,checkingPlayerOnline in pairs(playersOnline) do
				--If not already in list and not staff 
				checkingPlayerOnlineName = checkingPlayerOnline:getName()
				if talkactionAutoFollowingPlayersPlayersFollowed[playerName][checkingPlayerOnlineName] == nil and not checkingPlayerOnline:getGroup():getAccess() then
					talkactionAutoFollowingPlayersPlayersFollowed[playerName][checkingPlayerOnlineName] = false
					nextPlayer = checkingPlayerOnline
				end
			end
		end

		--If still dont have player, we've checked everyone. Notify player and reset list
		if nextPlayer == nil then
			talkactionAutoFollowingPlayersPlayersFollowed[playerName] = nil
			player:sendCancelMessage("All players have been followed. Resetting List.")
			local playerTown = player:getTown()
			if playerTown then
				autoFollowPlayer_stopFollow(player)
				player:teleportTo(playerTown:getTemplePosition())
			end
			return false
		else
			talkactionAutoFollowingPlayersPlayersFollowed[playerName][nextPlayer:getName()] = true
			talkactionAutoFollowingPlayers[player:getId()] = nextPlayer:getId()
			autoFollowPlayer_follow(player:getId())
		end


	elseif param == "clear" then
		talkactionAutoFollowingPlayersPlayersFollowed[playerName] = {}
		autoFollowPlayer_stopFollow(player)
		player:sendCancelMessage("Players followed list cleared.")
		local playerTown = player:getTown()
		if playerTown then
			autoFollowPlayer_stopFollow(player)
			player:teleportTo(playerTown:getTemplePosition())
		end
		return false


	elseif param == "" then -- no param, stopping autofollow
		--If following player, stop it
		if talkactionAutoFollowingPlayers[player:getId()] ~= nil then
			player:sendCancelMessage("Stopping autofollow.")
			autoFollowPlayer_stopFollow(player)
		else--Tell player how to use command
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "/autofollow Help:\n/autofollow PLAYERNAME -- Toggle Following player\n" ..
			"/autofollow -- Stop autofollowing\n/autofollow next -- Go to next player\n/autofollow clear -- Clear list of followed players")
		end


	else -- Param is player
		local target = Player(param)
		if not target then
			player:sendCancelMessage("Player not found.")
			return false
		end
		local targetID = target:getId()
		local playerID = player:getId()
		
		if talkactionAutoFollowingPlayers[playerID] ~= targetID then
			--Follow player
			talkactionAutoFollowingPlayers[playerID] = targetID
			autoFollowPlayer_follow(playerID)
		else
			--Stop following player
			player:sendCancelMessage("Stopping autofollow.")
			autoFollowPlayer_stopFollow(player)
		end


	end
	return false
end