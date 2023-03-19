local TotalPain = 0
local TotalBroken = 0
local LastDamage, Bone = {}
local DamageDone = false

-- // Events \\ -- 

RegisterNetEvent('nocore-hospital:client:use:bandage')
AddEventHandler('nocore-hospital:client:use:bandage', function()
     exports['nocore-assets']:AddProp('HealthPack')
     Framework.Functions.Progressbar("use_bandage", "Превръзваш се", 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
     	disableMouse = false,
     	disableCombat = true,
         disableInventory = true,
     }, {
     	animDict = "anim@amb@business@weed@weed_inspecting_high_dry@",
     	anim = "weed_inspecting_high_base_inspector",
     	flags = 49,
     }, {}, {}, function() -- Done
         exports['nocore-assets']:RemoveProp()
         HealRandomBodyPart()
         TriggerServerEvent('Framework:Server:RemoveItem', 'bandage', 1)
         TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items['bandage'], "remove")
         StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
         SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 20)
     end, function() -- Cancel
         exports['nocore-assets']:RemoveProp()
         StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
         Framework.Functions.Notify("Отменено", "error")
     end, 'fa-solid fa-bandage')
end)

RegisterNetEvent('nocore-hospital:client:use:health-pack')
AddEventHandler('nocore-hospital:client:use:health-pack', function()
    local Player, Distance = Framework.Functions.GetClosestPlayer()
    local RandomTime = math.random(15000, 20000)
    if Player ~= -1 and Distance < 1.5 then
      if IsTargetDead(GetPlayerServerId(Player)) then
         Framework.Functions.Progressbar("hospital_revive", "Оказване на първа помощ..", RandomTime, false, true, {
             disableMovement = false,
             disableCarMovement = false,
             disableMouse = false,
             disableCombat = true,
             disableInventory = true,
         }, {
             animDict = 'mini@cpr@char_a@cpr_str',
             anim = 'cpr_pumpchest',
             flags = 8,
         }, {}, {}, function() -- Done
             TriggerServerEvent("Framework:Server:RemoveItem", "health-pack", 1)
             TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items["health-pack"], "remove")
             TriggerServerEvent('nocore-hospital:server:revive:player', GetPlayerServerId(Player))
             StopAnimTask(PlayerPedId(), 'mini@cpr@char_a@cpr_str', "cpr_pumpchest", 1.0)
             Framework.Functions.Notify("Помогна на гражданинът!")
         end, function() -- Cancel
             StopAnimTask(PlayerPedId(), 'mini@cpr@char_a@cpr_str', "cpr_pumpchest", 1.0)
             Framework.Functions.Notify("Прекратено!", "error")
         end, 'fa-solid fa-suitcase-medical')
        else
            Framework.Functions.Notify("Гражданинът не е в безсъзнание..", "error")
        end
    end
end)

RegisterNetEvent('nocore-hospital:client:use:painkillers')
AddEventHandler('nocore-hospital:client:use:painkillers', function()
        if not Config.OnOxy then
            Framework.Functions.Progressbar("use_bandage", "Пиеш успокояващо..", 3000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {
                animDict = "mp_suicide",
                anim = "pill",
                flags = 49,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
                TriggerServerEvent("Framework:Server:RemoveItem", "painkillers", 1)
                TriggerEvent("nocore-inventory:client:ItemBox", Framework.Shared.Items["painkillers"], "remove")
                TriggerServerEvent('hud:server:RelieveStress', math.random(15, 25))
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
                Framework.Functions.Notify("Прекратено", "error")
            end)
        else
            Framework.Functions.Notify("Все още имаш медикаменти в кръвта..", "error")
        end 
end)

-- // Functions \\ --

function HurtPlayer(Multiplier)
  local CurrentHealth = GetEntityHealth(PlayerPedId())
  local NewHealth = CurrentHealth - math.random(1,8) * Multiplier
  if not Config.OnOxy then
    SetEntityHealth(PlayerPedId(), NewHealth)
  end
end

function BlackOut()
 if not Config.OnOxy then
    SetFlash(0, 0, 100, 4000, 100)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(0)
    end
    if IsPedOnFoot(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) then
        ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        SetPedToRagdollWithFall(PlayerPedId(), 7500, 9000, 1, GetEntityForwardVector(PlayerPedId()), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    Citizen.Wait(1500)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    DoScreenFadeOut(750)
    while not IsScreenFadedOut() do
        Citizen.Wait(0)
    end
    Citizen.Wait(500)
    DoScreenFadeIn(700)
 end
end

function HealRandomBodyPart()
  for k,v in pairs(Config.BodyHealth) do
      if not v['IsDead'] then
        if v['Pain'] then
            if v['Health'] < 4 then
                v['Health'] = v['Health'] + 1.0 
            end

            if v['Health'] == 4 then
                v['Pain'] = false
                TotalPain = TotalPain - 1
            end

        end
      end
  end
end

function ResetBodyHp()
    for k,v in pairs(Config.BodyHealth) do
        v['Health'] = Config.MaxBodyPartHealth
        v['IsDead'] = false
        v['Pain'] = false
        TotalPain = 0
        TotalBroken = 0
    end
end

function Adrenaline()
    local ped = PlayerPedId()
	local timer = 0
	while timer < 12 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
        SetEntityHealth(ped, GetEntityHealth(ped) + 2)
	end
end