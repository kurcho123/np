clConfig = {
    -- The distance (in meters) from which the boosting vehicle should be created. The default value of 100 means that when the player gets into a 100
    -- meter radius of the vehicle spawn spot, the vehicle will be created. This value should not be set extremely high, because the player has to be in
    -- OneSync range for the vehicle to appear. Also, the value shouldn't be too low, as the player then has to be very close to vehicle and may not find it.
    vehicleCreationDistance = 100.0,

    -- If the vehicle were in the center of the indicated area, it would be found instantly. To prevent this, an offset is used. This value determines
    -- the min/max offset of the x and y axis (randomly generated between 0 and this value) from the vehicle spawn point (in meters).
    vehicleAreaMaximumOffset = 145.0,

    -- The radius of the circle which will be created at the offset point. Players have to find the vehicle from this area. Please note that you have
    -- to take into account the offset when setting this radius value. If you set the radius too low, the vehicle may be outside of the area!
    --
    -- EXAMPLE - calculating the radius: If the offset is 145.0, then the minimum radius according to the Pythagoras theorem has to be the square root of
    -- 145² + 145² = square root of 42050 = 206 meters. Setting a value higher than this is okay, but if it's lower, then the vehicle may be outside of the area.
    vehicleAreaRadius = 215.0,

    -- The performance mods that will be applied if the boosting vehicle is tuned.
    tunedVehiclePerformanceModIndices = { 11, 12, 13, 16 },

    -- If the turbo be toggled on a tuned boosting vehicle.
    tunedVehicleToggleTurbo = true,

    -- The visual mods that will be applied if the boosting vehicle is tuned.
    tunedVehicleVisualModIndices = { 0, 1, 2, 4 },

    -- If an NPC should be created at the drop off point (AKA the 'dealer', who will take delivery of the vehicle).
    createDropOffNpc = true,

    -- The distance (in meters) from which the drop off NPC will be created and UI shown. The default value of 20 means that when the player
    -- gets into a 20 meter radius of the drop off spot, the drop off will be available. This value also shouldn't be too high / low.
    dropOffCreationDistance = 20,

    -- The icon which will be created at the drop-off place (where the player has to deliver the vehicle. Values found at https://docs.fivem.net/docs/game-references/blips/.
    dropOffAreaBlipSprite = 596,

    -- The color of the icon which is created at the drop-off place. Values found at https://docs.fivem.net/docs/game-references/blips/.
    dropOffAreaBlipColor = 1,

    -- The animation which will be playing on the drop-off dealer.
    dropOffPedAnim = 'WORLD_HUMAN_SMOKING',

    -- A comma separated list of pedestrian models which will be used to spawn the NPCs at drop-off points.
    dropOffNpcModels = {"s_m_y_dealer_01", "ig_djgeneric_01"},

    -- The location where the UI should display when near the drop-off place. Check ox_lib documentation for other positions.
    dropOffUiPosition = 'left-center',

    -- The icon displayed in the UI when near the drop-off place. Check Fontawesome for other icons.
    dropOffUiIcon = 'basket-shopping',

    -- The button which must be pressed to deliver the vehicle at drop-off. By default E. If you change this, then also change the key in translation.
    dropOffKeybind = 38,

    -- If a floating marker should be created at the drop off point.
    createDropOffMarker = false,

    -- If a floating marker should be created at the store.
    createStoreMarker = false,

    -- The color of the area from which the player has to find the boosting vehicle. Values found at https://docs.fivem.net/docs/game-references/blips/.
    pickUpAreaColor = 1,

    -- A comma separated list of pedestrian models which will be used to spawn the armed NPCs at pick-up points at important boosts (A / S class).
    pickUpAreaNpcModels = {"a_m_y_hasjew_01"},

    -- The weapon which will be given to the armed NPCs at pick-up points at important boosts (A / S class).
    pickUpAreaNpcWeapon = 'WEAPON_PISTOL',

    -- The amount of time (in seconds) which the players has to wait between two hacking attempts.
    gpsHackingCooldown = 30,

    -- HACKTYPES: NUMERIC, ALPHABET, ALPHANUMERIC, GREEK, BRAILLE, RUNES, RANDOM
    -- GAMETYPE: NORMAL, RANDOM, MIRRORED
    gpsHackingHackType = 'RANDOM',
    gpsHackingGameType = 'RANDOM',

    -- The sound which will be played to police & the criminal when a GPS location is updated.
    gpsNotificationSoundName = 'Out_Of_Bounds_Timer',
    gpsNotificationSoundRef = 'DLC_HEISTS_GENERAL_FRONTEND_SOUNDS',

    -- The location where the UI should display when near the store. Check ox_lib documentation for other positions.
    storeUiPosition = 'left-center',

    -- The icon displayed in the UI when near the store. Check Fontawesome for other icons.
    storeUiIcon = 'basket-shopping',

    -- The location where you can pick up your store orders from.
    orderLocation = vector3(1130.26, -775.5, 57.61)
}