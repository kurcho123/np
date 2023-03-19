local Framework = exports['no-core']:GetCoreObject()

Citizen.CreateThread(function()
	Wait(1000)
	TriggerServerEvent("okokReports:FetchFeedbackTable")
end)

-------------------------- VARS

local oneSync = true
local staff = false
local FeedbackTable = {}
local canFeedback = true
local timeLeft = Config.FeedbackCooldown

-------------------------- COMMANDS

RegisterCommand(Config.FeedbackClientCommand, function(source, args, rawCommand)
	if canFeedback then
		FeedbackMenu(false)
	else
		Framework.Functions.Notify("Не можеш толкова бързо да репортваш", 'error')
	end
end, false)

RegisterCommand(Config.FeedbackAdminCommand, function(source, args, rawCommand)
	if staff then
		FeedbackMenu(true)
	end
end, false)

-------------------------- MENU

RegisterNetEvent('nocore-reports:feedbackMenu')
AddEventHandler('nocore-reports:feedbackMenu', function(menu)
	if not staff then
		if canFeedback then
			FeedbackMenu(menu)
		else
			Framework.Functions.Notify("Не можеш толкова бързо да репортваш", 'error')
		end
	else
		FeedbackMenu(menu)
	end
end)

function FeedbackMenu(showAdminMenu)
	SetNuiFocus(true, true)
	if showAdminMenu then
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
		SendNUIMessage({
			action = "OpenAdminFeedback",
		})
	else
		SendNUIMessage({
			action = "ClientFeedback",
		})
	end
end

-------------------------- EVENTS

RegisterNetEvent('okokReports:NewFeedback')
AddEventHandler('okokReports:NewFeedback', function(newFeedback)
	if staff then
		FeedbackTable[#FeedbackTable+1] = newFeedback
		Framework.Functions.Notify("Нов репорт, ай бързо отивай", "success")
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
	end
end)

RegisterNetEvent('okokReports:FetchFeedbackTable')
AddEventHandler('okokReports:FetchFeedbackTable', function(feedback, admin, oneS)
	FeedbackTable = feedback
	staff = admin
	oneSync = oneS
end)

RegisterNetEvent('okokReports:FeedbackConclude')
AddEventHandler('okokReports:FeedbackConclude', function(feedbackID, info)
	local feedbackid = FeedbackTable[feedbackID]
	if not feedbackid then
		return
	end
	feedbackid.concluded = info

	SendNUIMessage({
		action = "updateFeedback",
		FeedbackTable = FeedbackTable
	})
end)

-------------------------- ACTIONS

RegisterNUICallback("action", function(data)
	if data.action ~= "concludeFeedback" then
		SetNuiFocus(false, false)
	end

	if data.action == "newFeedback" then
		Framework.Functions.Notify("Репортът беше успешно изпратен", "success")
		
		local feedbackInfo = {subject = data.subject, information = data.information, category = data.category}
		TriggerServerEvent("okokReports:NewFeedback", feedbackInfo)

		local time = Config.FeedbackCooldown * 60
		local pastTime = 0
		canFeedback = false

		while (time > pastTime) do
			Citizen.Wait(1000)
			pastTime = pastTime + 1
			timeLeft = time - pastTime
		end
		canFeedback = true
	elseif data.action == "assistFeedback" then
		if FeedbackTable[data.feedbackid] then
			if oneSync then
				TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
			else
				local playerFeedbackID = FeedbackTable[data.feedbackid].playerid
				local playerID = GetPlayerFromServerId(playerFeedbackID)
				local playerOnline = NetworkIsPlayerActive(playerID)
				if playerOnline then
					SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerFeedbackID))))
					TriggerServerEvent("okokReports:AssistFeedback", data.feedbackid, true)
				else
					Framework.Functions.Notify("Тоя маняк вече не е в сървъра", "error")
				end
			end
		end
	elseif data.action == "concludeFeedback" then
		local feedbackID = data.feedbackid
		local canConclude = data.canConclude
		local feedbackInfo = FeedbackTable[feedbackID]
		if feedbackInfo then
			if feedbackInfo.concluded ~= true or canConclude then
				TriggerServerEvent("okokReports:FeedbackConclude", feedbackID, canConclude)
				Framework.Functions.Notify("Репорт #"..feedbackID.." беше разрешен", "success")
			end
		end
	end
end)