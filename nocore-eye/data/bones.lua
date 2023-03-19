local Bones = {Options = {}, Vehicle = {'chassis', 'windscreen', 'seat_pside_r', 'seat_dside_r', 'bodyshell', 'suspension_lm', 'suspension_lr', 'platelight', 'attach_female', 'attach_male', 'bonnet', 'boot', 'chassis_dummy', 'chassis_Control', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'Gun_GripR', 'windscreen_f', 'platelight', 'VFX_Emitter', 'window_lf', 'window_lr', 'window_rf', 'window_rr', 'engine', 'gun_ammo', 'ROPE_ATTATCH', 'wheel_lf', 'wheel_lr', 'wheel_rf', 'wheel_rr', 'exhaust', 'overheat', 'seat_dside_f', 'seat_pside_f', 'Gun_Nuzzle', 'seat_r'}}
local Framework = exports['no-core']:GetCoreObject()

if Config.EnableDefaultOptions then
    local BackEngineVehicles = {
        [`ninef`] = true,
        [`adder`] = true,
        [`vagner`] = true,
        [`t20`] = true,
        [`infernus`] = true,
        [`zentorno`] = true,
        [`reaper`] = true,
        [`comet2`] = true,
        [`comet3`] = true,
        [`jester`] = true,
        [`jester2`] = true,
        [`cheetah`] = true,
        [`cheetah2`] = true,
        [`prototipo`] = true,
        [`turismor`] = true,
        [`pfister811`] = true,
        [`ardent`] = true,
        [`nero`] = true,
        [`nero2`] = true,
        [`tempesta`] = true,
        [`vacca`] = true,
        [`bullet`] = true,
        [`osiris`] = true,
        [`entityxf`] = true,
        [`turismo2`] = true,
        [`fmj`] = true,
        [`re7b`] = true,
        [`tyrus`] = true,
        [`italigtb`] = true,
        [`penetrator`] = true,
        [`monroe`] = true,
        [`ninef2`] = true,
        [`stingergt`] = true,
        [`surfer`] = true,
        [`surfer2`] = true,
        [`gp1`] = true,
        [`autarch`] = true,
        [`tyrant`] = true
    }

    local function GetControlOfEntity(entity)
        NetworkRequestControlOfEntity(entity)
        return NetworkHasControlOfEntity(entity)
    end

    local function ToggleDoor(vehicle, door)
        if not GetControlOfEntity(vehicle) then return end
        if GetVehicleDoorLockStatus(vehicle) ~= 2 then
            if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
                SetVehicleDoorShut(vehicle, door, false)
            else
                SetVehicleDoorOpen(vehicle, door, false)
            end
        else
            Framework.Functions.Notify("Изглежда заключено", "error", 3000, "МПС")
        end
    end

    Bones.Options['seat_dside_f'] = {
        [1] = {
            --num = 1,
            icon = "fas fa-sign-in-alt",
            label = "Отвори/Затвори",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1 and GetControlOfEntity(entity)
            end,
            action = function(entity)
                ToggleDoor(entity, 0)
            end,
            distance = 2
        }
    }

    Bones.Options['seat_pside_f'] = {
        [1] = {
            icon = "fas fa-sign-in-alt",
            label = "Отвори/Затвори",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1 and GetControlOfEntity(entity)
            end,
            action = function(entity)
                ToggleDoor(entity, 1)
            end,
            distance = 2
        }
    }

    Bones.Options['seat_dside_r'] = {
        [1] = {
            icon = "fas fa-sign-in-alt",
            label = "Отвори/Затвори",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1 and GetControlOfEntity(entity)
            end,
            action = function(entity)
                ToggleDoor(entity, 2)
            end,
            distance = 2
        }
    }

    Bones.Options['seat_pside_r'] = {
        [1] = {
            icon = "fas fa-sign-in-alt",
            label = "Отвори/Затвори",
            canInteract = function(entity)
                return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1 and GetControlOfEntity(entity)
            end,
            action = function(entity)
                ToggleDoor(entity, 3)
            end,
            distance = 2
        }
    }

    Bones.Options['bonnet'] = {
        [1] = {
            icon = "fas fa-sign-in-alt",
            label = "Отвори/Затвори",
            canInteract = function(entity)
                return GetControlOfEntity(entity)
            end,
            action = function(entity)
                ToggleDoor(entity, BackEngineVehicles[GetEntityModel(entity)] and 5 or 4)
            end,
            distance = 1.5
        }
    }

    Bones.Options['boot'] = {
        [1] = {
            icon = "fas fa-sign-in-alt",
            label = "Отвори/Затвори",
            canInteract = function(entity)
                return GetControlOfEntity(entity)
            end,
            action = function(entity)
                ToggleDoor(entity, BackEngineVehicles[GetEntityModel(entity)] and 4 or 5)
            end,
            distance = 1.5
        }
    }
end

return Bones