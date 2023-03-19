local requiredItemsShowed = false
Framework = nil
PlayerData = {}
isLoggedIn = 

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
	Citizen.SetTimeout(1000, function()
		TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
		Citizen.Wait(150)
		isLoggedIn = true
		PlayerData = Framework.Functions.GetPlayerData()
		Framework.Functions.TriggerCallback('nocore-crypto:server:FetchWorth', function(result)
		end)
		Framework.Functions.TriggerCallback('nocore-crypto:server:GetRebootState', function(result)
		end)
	end)
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
		Citizen.Wait(150)
		isLoggedIn = true
		PlayerData = Framework.Functions.GetPlayerData()
		Framework.Functions.TriggerCallback('nocore-crypto:server:FetchWorth', function(result)
		end)
		Framework.Functions.TriggerCallback('nocore-crypto:server:GetRebootState', function(result)
		end)
	end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
	while true do
		local inRange = false

		if Framework ~= nil then
			local requiredItems = {
				[1] = {name = Framework.Shared.Items["cryptostick"]["name"], image = Framework.Shared.Items["cryptostick"]["image"]}, --cryptostick
			}
			if isLoggedIn then
				local ped = PlayerPedId()
				local pos = GetEntityCoords(ped)
				local dist = GetDistanceBetweenCoords(pos, Crypto.Exchange.coords.x, Crypto.Exchange.coords.y, Crypto.Exchange.coords.z, true)

				if dist < 15 then
					inRange = true

					if dist < 1.5 then
						if not Crypto.Exchange.RebootInfo.state then
							DrawText3Ds(Crypto.Exchange.coords.x, Crypto.Exchange.coords.y, Crypto.Exchange.coords.z, '~g~E~w~ - Свържи USB')
							if not requiredItemsShowed then
								requiredItemsShowed = true
								TriggerEvent('nocore-inventory:client:requiredItems', requiredItems, true)
							end

							if IsControlJustPressed(0, Keys["E"]) then
								Framework.Functions.TriggerCallback('nocore-crypto:server:HasSticky', function(HasItem)
									if HasItem then
										Framework.Functions.Progressbar("deliver_reycle_package", "Връзване към системата..", 20000, false, true, {
											disableMovement = true,
											disableCarMovement = true,
											disableMouse = false,
											disableCombat = true,
											disableInventory = true,
										}, {
											animDict = "mp_fbi_heist",
				                            anim = "loop",
										}, {}, {}, function() -- Done
											ClearPedTasksImmediately(ped)
											--TriggerEvent("mhacking:seqstart", math.random(4, 6), 45, HackingSuccess)
											TriggerEvent("mhacking:show")
											TriggerEvent("mhacking:start", math.random(4, 6), 45, HackingSuccess)
										end, function() --Cancel
											ClearPedTasksImmediately(ped)
										end)
									else
										Framework.Functions.Notify('Вие нямате Cryptostick..', 'error')
									end
								end)
							end
						else
							DrawText3Ds(Crypto.Exchange.coords.x, Crypto.Exchange.coords.y, Crypto.Exchange.coords.z, 'Systeem is aan het rebooten - '..Crypto.Exchange.RebootInfo.percentage..'%')
						end
					else
						if requiredItemsShowed then
							requiredItemsShowed = false
							TriggerEvent('nocore-inventory:client:requiredItems', requiredItems, false)
						end
					end
				end
			end
		end

		if not inRange then
			Citizen.Wait(5000)
		end

		Citizen.Wait(3)
    end
end)

function ExchangeSuccess()
	Framework.Functions.TriggerCallback('nocore-crypto:server:ExchangeSuccess', function(result)

	end, math.random(1, 10))
	-- TriggerServerEvent('nocore-crypto:server:ExchangeSuccess', math.random(1, 10))
end

function ExchangeFail()
	local Odd = 5
	local RemoveChance = math.random(1, Odd)
	local LosingNumber = math.random(1, Odd)

	if RemoveChance == LosingNumber then
		-- TriggerServerEvent('nocore-crypto:server:ExchangeFail')
		-- TriggerServerEvent('nocore-crypto:server:SyncReboot')
		Framework.Functions.TriggerCallback('nocore-crypto:server:ExchangeFail', function(result)
		end)

		Framework.Functions.TriggerCallback('nocore-crypto:server:SyncReboot', function(result)
		end)
		-- Crypto.Exchange.RebootInfo.state = true
		-- SystemCrashCooldown()
	end
end

RegisterNetEvent('nocore-crypto:client:SyncReboot')
AddEventHandler('nocore-crypto:client:SyncReboot', function()
	Crypto.Exchange.RebootInfo.state = true
	SystemCrashCooldown()
end)

function SystemCrashCooldown()
	Citizen.CreateThread(function()
		while Crypto.Exchange.RebootInfo.state do

			if (Crypto.Exchange.RebootInfo.percentage + 1) <= 100 then
				Crypto.Exchange.RebootInfo.percentage = Crypto.Exchange.RebootInfo.percentage + 1
				Framework.Functions.TriggerCallback('nocore-crypto:server:Rebooting', function(result)
				end, true, Crypto.Exchange.RebootInfo.percentage)
				-- TriggerServerEvent('nocore-crypto:server:Rebooting', true, Crypto.Exchange.RebootInfo.percentage)
			else
				Crypto.Exchange.RebootInfo.percentage = 0
				Crypto.Exchange.RebootInfo.state = false
				Framework.Functions.TriggerCallback('nocore-crypto:server:Rebooting', function(result)
				end, false, 0)
				-- TriggerServerEvent('nocore-crypto:server:Rebooting', false, 0)
			end

			Citizen.Wait(1200)
		end
	end)
end

function HackingSuccess(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccess()
    else
		TriggerEvent('mhacking:hide')
		ExchangeFail()
	end
end

RegisterNetEvent('nocore-crypto:client:UpdateCryptoWorth')
AddEventHandler('nocore-crypto:client:UpdateCryptoWorth', function(crypto, amount, history)
	Crypto.Worth[crypto] = amount
	if history ~= nil then
		Crypto.History[crypto] = history
	end
end)

RegisterNetEvent('nocore-crypto:client:GetRebootState')
AddEventHandler('nocore-crypto:client:GetRebootState', function(RebootInfo)
	if RebootInfo.state then
		Crypto.Exchange.RebootInfo.state = RebootInfo.state
		Crypto.Exchange.RebootInfo.percentage = RebootInfo.percentage
		SystemCrashCooldown()
	end
end)