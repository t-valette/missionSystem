require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "user" ,"pass")

RegisterServerEvent('missionSystem:getWeed')
AddEventHandler('missionSystem:getWeed', function()
	TriggerEvent ('es:getPlayerFromId',source,function(user)
		local player = user.identifier
	    local query = MySQL:executeQuery("SELECT quantity FROM user_inventory WHERE item_id=1 AND user_id='@identifier'", {['@identifier'] = player})
		local result = MySQL:getResults(query, { 'quantity' })
		local qte
		 for _, v in ipairs(result) do
			print(v.quantity)
			qte = v.quantity
		end
		TriggerClientEvent('missionSystem:processGetWeed',source,qte)
	end)
end)

RegisterServerEvent('missionSystem:getShit')
AddEventHandler('missionSystem:getShit', function()
	TriggerEvent ('es:getPlayerFromId',source,function(user)
		local player = user.identifier
	    local queryWeed = MySQL:executeQuery("SELECT quantity FROM user_inventory WHERE item_id=1 AND user_id='@identifier'", {['@identifier'] = player})
		local resultWeed = MySQL:getResults(queryWeed, { 'quantity' })
		local qteWeed
		 for _, v in ipairs(resultWeed) do
			print(v.quantity)
			qteWeed = v.quantity
		end
		
		local queryShit = MySQL:executeQuery("SELECT quantity FROM user_inventory WHERE item_id=2 AND user_id='@identifier'", {['@identifier'] = player})
		local resultShit = MySQL:getResults(queryShit, { 'quantity' })
		local qteShit
		 for _, v in ipairs(resultShit) do
			print(v.quantity)
			qteShit = v.quantity
		end
		TriggerClientEvent('missionSystem:processGetShit',source,qteWeed, qteShit)
	end)
end)

RegisterServerEvent('missionSystem:sellShit')
AddEventHandler('missionSystem:sellShit', function()
	TriggerEvent ('es:getPlayerFromId',source,function(user)
		local player = user.identifier
	    local query = MySQL:executeQuery("SELECT quantity FROM user_inventory WHERE item_id=2 AND user_id='@identifier'", {['@identifier'] = player})
		local result = MySQL:getResults(query, { 'quantity' })
		local qte
		 for _, v in ipairs(result) do
			print(v.quantity)
			qte = v.quantity
		end
		TriggerClientEvent('missionSystem:processSellShit',source,qte)
	end)
end)