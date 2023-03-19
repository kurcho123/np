local isInRagdoll = false

RegisterCommand('ragdoll', function()
  if not IsInAnimation and IsPedOnFoot(PlayerPedId()) then
    if isInRagdoll then
        isInRagdoll = false
    else
        isInRagdoll = true
        SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
        CreateThread(function()
          while isInRagdoll do
            Citizen.Wait(10)
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
          end
        end)
    end
  end
end, false)

RegisterKeyMapping('ragdoll', 'Toggle ragdoll', 'keyboard', 'U')

TriggerEvent('chat:removeSuggestion', '/ragdoll')