Framework = exports['no-core']:GetCoreObject()
PlayerData = Framework.Functions.GetPlayerData()

Citizen.CreateThread(function()
	while Framework.Functions.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	PlayerData = Framework.Functions.GetPlayerData()
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
	Citizen.SetTimeout(1000, function()
		PlayerData = Framework.Functions.GetPlayerData()
	end)
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

function MyInvoices()
	Framework.Functions.TriggerCallback("nocore-billing:GetInvoices", function(invoices)
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'myinvoices',
			invoices = invoices,
			VAT = Config.VATPercentage
		})			
	end)
end

function SocietyInvoices(society)
	Framework.Functions.TriggerCallback("nocore-billing:GetSocietyInvoices", function(cb, totalInvoices, totalIncome, totalUnpaid, awaitedIncome)
		if json.encode(cb) ~= '[]' then
			SetNuiFocus(true, true)
			SendNUIMessage({
				action = 'societyinvoices',
				invoices = cb,
				totalInvoices = totalInvoices,
				totalIncome = totalIncome,
				totalUnpaid = totalUnpaid,
				awaitedIncome = awaitedIncome,
				VAT = Config.VATPercentage
			})		
		else
			Framework.Functions.Notify("Няма налични фактури!", "info", 10000, "Фактуриране")
			SetNuiFocus(false, false)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end
	end, society)
end

RegisterNetEvent('nocore-billing:openCreateInvoiceMenu', function(data)
	local anim = data.animation or 'tablet2'
	TriggerEvent('animations:client:EmoteCommandStart', {anim})
	for k, _ in pairs(Config.AllowedSocieties) do
		if k == PlayerData.job.name then
			CreateInvoice(PlayerData.job.label)
		end
	end
end)

function CreateInvoice(society)
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'createinvoice',
		society = society
	})
end

RegisterNetEvent('nocore-bills:open')
AddEventHandler('nocore-bills:open', function()
    OpenBillMenu()
end)

RegisterCommand(Config.InvoicesCommand, function()
	OpenBillMenu()
end, false)

function OpenBillMenu()
	local isAllowed = false
	local jobName = ""
	TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
	for k, v in pairs(Config.AllowedSocieties) do
		if k == PlayerData.job.name then
			jobName = k
			isAllowed = true
		end
	end

	if Config.OnlyBossCanAccessSocietyInvoices and Config.AllowedSocieties[PlayerData.job.name] ~= nil and PlayerData.job.grade.level >= Config.AllowedSocieties[PlayerData.job.name] and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	elseif Config.OnlyBossCanAccessSocietyInvoices and not PlayerData.job.isboss and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = false,
			create = true
		})
	elseif not Config.OnlyBossCanAccessSocietyInvoices and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	elseif not isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = false,
			create = false
		})
	end
end

RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		SetNuiFocus(false, false)
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	elseif data.action == "payInvoice" then
		TriggerServerEvent("nocore-billing:PayInvoice", data.invoice_id)
		SetNuiFocus(false, false)
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	elseif data.action == "cancelInvoice" then
		TriggerServerEvent("nocore-billing:CancelInvoice", data.invoice_id)
		SetNuiFocus(false, false)
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	elseif data.action == "createInvoice" then
		local Players = GetNeareastPlayers()
		if #Players == 1 then
			target = Players[1].playerId
			data.target = target
			data.society = "society_"..PlayerData.job.name
			data.society_name = PlayerData.job.label
			TriggerServerEvent("nocore-billing:CreateInvoice", data)
			Framework.Functions.Notify("Фактурата бе успешно написана!", "success", 10000, "Фактуриране")
			SetNuiFocus(false, false)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		elseif #Players > 1 then
			local sendMenu = {}
			data.society = "society_"..PlayerData.job.name
			data.society_name = PlayerData.job.label
			table.insert(sendMenu,{
				id = 1,
				header = "Близки играчи",
				txt = "",
				isMenuHeader = true
			})
			for i=1, #Players, 1 do
				table.insert(sendMenu,{
					id = #sendMenu+1,
					header = Players[i].playerName .. "[" .. tostring(Players[i].playerId) .. "]",
					txt = "",
					params = { 
						event = "nocore-billing:client:CreateInvoice",
						args = {
							[1] = data,
							[2] = Players[i].playerId,
						}
					}
				})
			end
			table.insert(sendMenu,{
				id = #sendMenu+1,
				header = "Затвори",
				txt = "",
				params = { 
					event = "nocore-vehiclekeys:client:fakeevent",
					args = {}
				}
			})
			SetNuiFocus(false, false)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			exports['nocore-context']:openMenu(sendMenu)
		else
			SetNuiFocus(false, false)
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			Framework.Functions.Notify("Няма никой наоколо!", "error", 10000, "Фактуриране")
		end
		
	elseif data.action == "missingInfo" then
		Framework.Functions.Notify("Попълни всички полета!", "error", 10000, "Фактуриране")
	elseif data.action == "negativeAmount" then
		Framework.Functions.Notify("Трябва сумата да е положителна!", "error", 10000, "Фактуриране")
	elseif data.action == "mainMenuOpenMyInvoices" then
		MyInvoices()
	elseif data.action == "mainMenuOpenSocietyInvoices" then
		for k, v in pairs(Config.AllowedSocieties) do
			if k == PlayerData.job.name then
				if Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.grade.level >= v then
					SocietyInvoices('society_'..PlayerData.job.name)
				elseif not Config.OnlyBossCanAccessSocietyInvoices then
					SocietyInvoices('society_'..PlayerData.job.name)
				elseif Config.OnlyBossCanAccessSocietyInvoices then
					Framework.Functions.Notify("Нямаш достъп.", "error", 10000, "Фактуриране")
				end
			end
		end
	elseif data.action == "mainMenuOpenCreateInvoice" then
		for k, v in pairs(Config.AllowedSocieties) do
			if k == PlayerData.job.name then
				CreateInvoice(PlayerData.job.label)
			end
		end
	end
end)

RegisterNetEvent('nocore-billing:client:CreateInvoice')
AddEventHandler('nocore-billing:client:CreateInvoice', function(_data)
	local data = _data[1]
	data.target = _data[2]
	if data ~= nil then
		TriggerServerEvent("nocore-billing:CreateInvoice", data)
		Framework.Functions.Notify("Фактурата бе успешно написана!", "success", 10000, "Фактуриране")
	end
end)


function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players = Framework.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 3.0)

    local players_clean = {}
    local found_players = false

    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            table.insert(players_clean, {playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i])} )
        end
    end
    return players_clean
end
