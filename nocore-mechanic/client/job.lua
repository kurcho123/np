Framework = nil
local PlayerJob = {}
PlayerData = {}

jobName = nil
jobGrade = nil

CreateThread(function()
    while (Framework == nil) do
		TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
		Wait(100)
    end
    
    while (Framework.Functions.GetPlayerData() == nil or Framework.Functions.GetPlayerData().job == nil or Framework.Functions.GetPlayerData().job.name == nil) do
		Wait(100)
	end

    PlayerJob = Framework.Functions.GetPlayerData().job
    
    jobName = getJobName()
    jobGrade = getjobGrade()
    updateUICurrentJob()
end)

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('Framework:Client:OnJobUpdate')
AddEventHandler('Framework:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    jobName = getJobName()
    jobGrade = getjobGrade()
    updateUICurrentJob()
end)

function getJobName()
    if (PlayerJob ~= nil and PlayerJob.name ~= nil) then
        return PlayerJob.name
	end
	return nil
end

function getjobGrade()
    if (PlayerJob ~= nil and PlayerJob.name ~= nil) then
        return PlayerJob.grade.level
	end
	return nil
end
