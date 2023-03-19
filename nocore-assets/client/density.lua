local density = {
    ['parked'] = 0.20,
    ['vehicle'] = 0.20,
    ['multiplier'] = 0.20,
    ['peds'] = 0.20,
    ['scenario'] = 0.20,
}

local suppresedVehicles = {
    "rubble",
    "dump",
    "biff",
    "blimp",
    "stockade",
    "polmav",
    "infernus",
    "fusilade"
}

CreateThread(function()
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(density['parked'])
		SetVehicleDensityMultiplierThisFrame(density['vehicle'])
		SetRandomVehicleDensityMultiplierThisFrame(density['multiplier'])
		SetPedDensityMultiplierThisFrame(density['peds'])
		SetScenarioPedDensityMultiplierThisFrame(density['scenario'], density['scenario']) -- Walking NPC Density
        for _, vehicle in pairs(suppresedVehicles) do
            SetVehicleModelIsSuppressed(GetHashKey(vehicle), true)
        end
		Wait(0)
	end
end)

function DecorSet(Type, Value)
    if Type == 'parked' then
        density['parked'] = Value
    elseif Type == 'vehicle' then
        density['vehicle'] = Value
    elseif Type == 'multiplier' then
        density['multiplier'] = Value
    elseif Type == 'peds' then
        density['peds'] = Value
    elseif Type == 'scenario' then
        density['scenario'] = Value
    end
end

exports('DecorSet', DecorSet)
