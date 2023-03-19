config = {

    -- How often do we want to send updates to the clients show the blips have updated
    client_update_interval = 2000,

    -- How long should we wait before iterating on the next group
    -- This value should be nowhere close to the value above, and should be less then
    wait_between_group_in_thread = 100,

    -- Toggle showing your own blip on the map
    hide_own_blip = true,

    -- Should we debug?
    debug = false,

    -- This is where you can create custom blip types
    -- Colors - https://runtime.fivem.net/doc/natives/?_0x03D7FB09E75D6B7E
    blip_types = {
        ['police'] = {
            -- _can_see means the members of this group will be able to see
            -- both "doc" and "ems"
            --_can_see = { 'ambulance' },
            -- These settings will take default options, unless specified per group
            _color = 26,
            _type = 480,
            _scale = 0.85,
            _alpha = 255,
            _show_off_screen = false,
            _show_local_direction = true,
        },
        ['ambulance'] = {
            _color = 1,
            _type = 480,
            _scale = 0.85,
            _alpha = 255,
            _show_off_screen = false,
            _show_local_direction = true,
        },
    },

    -- Default settings for a group when one can not be found in the predefined list
    -- These options will be used when creating a "custom blip channel"
    default_type = {
        _color = 0,
        _type = 1,
        _scale = 0.85,
        _alpha = 255,
        _show_off_screen = false,
        _show_local_direction = false,
    },

    vehblips = {
        [-1109563416] = { -- npolvette
            sprite = 523,
            color = 1,
        },
        [1949729657] = { -- npolchal
            sprite = 523,
            color = 1,
        },
        [-901056903] = { -- npolvic
            sprite = 56,
        },
        [1745872177] = { -- 16taurus
            sprite = 56,
        },
        [-1457394361] = { -- npolchar
            sprite = 56,
        },
        [-1843415099] = { -- legexp
            sprite = 637,
        },
        [-826092757] = { -- npolmm
            sprite = 661,
            color = 46
        },
        [1346171487] = { -- as350
            sprite = 43,
            color = 0
        },
        [-488123221] = { -- policeboat
            sprite = 427
        },
        [1500677296] = { -- emsnspeedo
            sprite = 637,
            color = 1
        }
    },

    onfootsprite = 480
}