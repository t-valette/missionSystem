RegisterNetEvent('missionSystem:processGetWeed')
AddEventHandler('missionSystem:processGetWeed', function(qte)
	if(qte == nil) then
		qte = 0
	end

    if qte < 30 then
		TriggerEvent('player:receiveItem',1, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~You have just harvest some weed.")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~You can't harvest more weed.")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('missionSystem:processGetShit')
AddEventHandler('missionSystem:processGetShit', function(qteWeed, qteShit)
	if(qteWeed == nil) then
		qteWeed = 0
	end
	
	if(qteShit == nil) then
		qteShit = 0
	end

    if qteShit < 30 and qteWeed > 0 then
		TriggerEvent('player:receiveItem',2, 1)
		TriggerEvent('player:looseItem',1, 1)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Weed turn into shit.")
		DrawSubtitleTimed(4500, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~You can't process weed anymore.")
		DrawSubtitleTimed(2000, 1)
	end
end)

RegisterNetEvent('missionSystem:processSellShit')
AddEventHandler('missionSystem:processSellShit', function(qte)
	if(qte == nil) then
		qte = 0
	end

    if qte > 0 then
		TriggerEvent('player:looseItem',2, 1)
		TriggerServerEvent('mission:completed', 50)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~g~Here you're 50$ for your shit.")
		DrawSubtitleTimed(2000, 1)
	else
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString("~r~No shit, no money !")
		DrawSubtitleTimed(2000, 1)
	end
end)

Citizen.CreateThread(function()
listOn = false
	while true do
		Wait(0)
		
		-- RECOLTE DE CANABIS - START
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2208.777,5578.235,53.735, true) <= 10 then						
			TriggerServerEvent('missionSystem:getWeed')
			Citizen.Wait(5000)
		end		
		-- RECOLTE DE CANABIS - END
		
		
		-- RECOLTE DE SHIT - START
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1103.57861328125,4889.03271484375,216.067886352539, true) <= 5 then						
			TriggerServerEvent('missionSystem:getShit')
			Citizen.Wait(5000)
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1171.8962402344,-1572.1916503906,4.6636219024658, true) <= 5 then
			TriggerServerEvent('missionSystem:sellShit')
			Citizen.Wait(2500)
		end
		
		-- RECOLTE DE SHIT - END
		
	end
end)