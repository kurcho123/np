Config = {}
Config.ShowUnlockedText = true
Config.CheckVersion = true
Config.CheckVersionDelay = 60 -- Minutes

Config.DoorList = {
    -- Prison Coridor
    {
        authorizedJobs = {
            ['police'] = 0
        },
        objHeading = 179.99987792968,
        objCoords = vector3(1797.76, 2596.564, 46.3873),
        garage = false,
        objHash = -1156020871,
        locked = true,
        lockpick = false,
        audioRemote = false,
        fixText = true,
        maxDistance = 2.0,
        slides = false

    }, 

    -- Prison Coridor 2
    {
        authorizedJobs = {
            ['police'] = 0
        },
        objHeading = 179.99987792968,
        objCoords = vector3(1798.09, 2591.688, 46.41784),
        garage = false,
        objHash = -1156020871,
        locked = true,
        lockpick = false,
        audioRemote = false,
        fixText = true,
        maxDistance = 2.0,
        slides = false

    },

    -- Prison Enterance Gate 1
    {
        slides = true,
        maxDistance = 6.0,
        authorizedJobs = {
            ['police'] = 0
        },
        objHash = 741314661,
        garage = false,
        audioRemote = true,
        lockpick = false,
        fixText = true,
        objCoords = vector3(1844.998, 2604.812, 44.63978),
        objHeading = 90.0,
        locked = true

    },
    
    -- Prison Enterance Gate 2
    {
        slides = true,
        maxDistance = 6.0,
        authorizedJobs = {
            ['police'] = 0
        },
        objHash = 741314661,
        garage = false,
        audioRemote = true,
        lockpick = false,
        fixText = true,
        objCoords = vector3(1818.542, 2604.812, 44.611),
        objHeading = 90.0,
        locked = true

    }, 
    
    -- Prison Gate to the right
    {
        audioRemote = true,
        objHeading = 179.99998474122,
        objHash = 741314661,
        locked = true,
        maxDistance = 6.0,
        slides = true,
        lockpick = false,
        garage = false,
        fixText = true,
        objCoords = vector3(1799.608, 2616.976, 44.60324),
        authorizedJobs = {
            ['police'] = 0
        }
   
    },
    
    -- Police Prison Entarance
    {
        audioRemote = false,
        fixText = false,
        objCoords = vector3(1837.91, 2590.254, 46.19784),
        locked = true,
        lockpick = false,
        authorizedJobs = {
            ['police'] = 0
        },
        objHash = 539686410,
        maxDistance = 2.0,
        slides = false,
        objHeading = 0.0,
        garage = false,
        -- oldMethod = true,
        audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.4},
        audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.4},
        -- autoLock = 1000
    },
    
    -- Prison Door Second
    {
        audioRemote = false,
        fixText = false,
        objCoords = vector3(1831.34, 2594.992, 46.03792),
        locked = true,
        lockpick = false,
        authorizedJobs = {
            ['police'] = 0
        },
        objHash = -684929024,
        maxDistance = 2.0,
        slides = false,
        objHeading = 89.999961853028,
        garage = false

    },
    
    -- Prison Door Third
    {
        audioRemote = false,
        fixText = false,
        objCoords = vector3(1819.072, 2594.874, 46.08696),
        locked = true,
        lockpick = false,
        authorizedJobs = {
            ['police'] = 0
        },
        objHash = 1373390714,
        maxDistance = 2.0,
        slides = false,
        objHeading = 270.00003051758,
        garage = false
    },
    
    -- Затвор вътрешна 1	
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 251.97534179688,
            objCoords = vector3(1813.75, 2488.906, 44.46368)
        }, {
            objHash = 741314661,
            objHeading = 70.906448364258,
            objCoords = vector3(1808.992, 2474.544, 44.48078)
        }},
        slides = true,
        locked = true
    },
    
    -- Затвор вътрешна 2
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 206.1304321289,
            objCoords = vector3(1762.542, 2426.506, 44.43786)
        }, {
            objHash = 741314661,
            objHeading = 26.757732391358,
            objCoords = vector3(1749.142, 2419.812, 44.42518)
        }},
        slides = true,
        locked = true
    }, 
    
    -- Затвор вътрешна 3
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 172.99717712402,
            objCoords = vector3(1667.67, 2407.648, 44.4288)
        }, {
            objHash = 741314661,
            objHeading = 353.0004272461,
            objCoords = vector3(1652.984, 2409.572, 44.44308)
        }},
        slides = true,
        locked = true
    },
    
    -- Затвор вътрешна 4
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 118.04348754882,
            objCoords = vector3(1558.222, 2469.35, 44.39528)
        }, {
            objHash = 741314661,
            objHeading = 298.04623413086,
            objCoords = vector3(1550.93, 2482.744, 44.39528)
        }},
        slides = true,
        locked = true
    },
    
    -- Затвор вътрешна 5
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 87.014083862304,
            objCoords = vector3(1546.984, 2576.13, 44.39032)
        }, {
            objHash = 741314661,
            objHeading = 267.01473999024,
            objCoords = vector3(1547.706, 2591.282, 44.50946)
        }},
        slides = true,
        locked = true
    }, 
    
    -- Затвор вътрешна 6
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 54.543327331542,
            objCoords = vector3(1575.72, 2667.152, 44.50946)
        }, {
            objHash = 741314661,
            objHeading = 233.70986938476,
            objCoords = vector3(1584.652, 2679.75, 44.50946)
        }},
        slides = true,
        locked = true
    }, 
    
    -- Затвор вътрешна 7
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 27.173921585084,
            objCoords = vector3(1648.412, 2741.668, 44.44668)
        }, {
            objHash = 741314661,
            objHeading = 207.17547607422,
            objCoords = vector3(1662.01, 2748.702, 44.44668)
        }},
        slides = true,
        locked = true
    }, 
    
    -- Затвор вътрешна 8
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 339.62225341796,
            objCoords = vector3(1762.196, 2752.488, 44.44668)
        }, {
            objHash = 741314661,
            objHeading = 160.00001525878,
            objCoords = vector3(1776.702, 2747.148, 44.44668)
        }},
        slides = true,
        locked = true
    },
    
    -- Затвор вътрешна 9
    {
        authorizedJobs = {
            ['police'] = 0
        },
        audioRemote = false,
        maxDistance = 6.0,
        lockpick = false,
        doors = {{
            objHash = 741314661,
            objHeading = 289.16625976562,
            objCoords = vector3(1830.134, 2703.498, 44.4467)
        }, {
            objHash = 741314661,
            objHeading = 110.00004577636,
            objCoords = vector3(1835.284, 2689.104, 44.4467)
        }},
        slides = true,
        locked = true
    }, 

}

-- ## GABZ - PALETO POLICE DEPARTMENT
-- ## COORDINATES: -432.177, 6019.605, 31.490

-- main entrance
table.insert(Config.DoorList, {
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	doors = {
		{objHash = 965382714, objHeading = 314.99981689453, objCoords = vector3(-438.5865, 6014.362, 32.28851)}, -- gabz_paletopd_doors06
		{objHash = 733214349, objHeading = 134.99996948242, objCoords = vector3(-437.1717, 6012.947, 32.28851)} -- gabz_paletopd_doors05
	},
	maxDistance = 2.5,
	locked = true,
	audioRemote = false,

})

-- back entrance
table.insert(Config.DoorList, {
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	doors = {
		{objHash = 965382714, objHeading = 134.99992370605, objCoords = vector3(-453.4868, 5996.637, 32.28851)}, -- gabz_paletopd_doors06
		{objHash = 733214349, objHeading = 314.99981689453, objCoords = vector3(-454.9017, 5998.052, 32.28851)} -- gabz_paletopd_doors05
	},
	maxDistance = 2.5,
	locked = true,
	audioRemote = false,

})

-- upper floor - armory
table.insert(Config.DoorList, {
	objHeading = 44.999935150146,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-447.4445, 6011.512, 36.99582),

})

-- upper floor - captain office
table.insert(Config.DoorList, {
	objHeading = 314.99984741211,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=6 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-437.1285, 6004.658, 36.99582),

})

-- basement - staircase access
table.insert(Config.DoorList, {
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	doors = {
		{objHash = 1857649811, objHeading = 224.99992370605, objCoords = vector3(-450.0098, 6004.835, 27.58121)}, -- gabz_paletopd_doors02
		{objHash = 1362051455, objHeading = 44.999923706055, objCoords = vector3(-451.4247, 6003.42, 27.58121)} -- gabz_paletopd_doors01
 },
	maxDistance = 1.5,
	locked = true,
	audioRemote = false,

})

-- basement - mugshot
table.insert(Config.DoorList, {
	objHeading = 134.99996948242,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 1.5,
	garage = false,
	objCoords = vector3(-449.5088, 5999.468, 27.58121),

})

-- basement - interrogation hallway
table.insert(Config.DoorList, {
	slides = false,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	doors = {
		{objHash = 1857649811, objHeading = 44.99987411499, objCoords = vector3(-447.9988, 5999.985, 27.58121)}, -- gabz_paletopd_doors02
		{objHash = 1362051455, objHeading = 224.99992370605, objCoords = vector3(-446.5839, 6001.4, 27.58121)} -- gabz_paletopd_doors01
 },
	maxDistance = 1.5,
	locked = true,
	audioRemote = false,

})

-- basement - interrogation right
table.insert(Config.DoorList, {
	objHeading = 314.99984741211,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 1.0,
	garage = false,
	objCoords = vector3(-445.3536, 5995.342, 27.58121),

})

-- basement - observation right
table.insert(Config.DoorList, {
	objHeading = 134.99992370605,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 1.0,
	garage = false,
	objCoords = vector3(-446.4799, 5996.469, 27.58121),

})

-- basement - observation left
table.insert(Config.DoorList, {
	objHeading = 134.99992370605,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 1.0,
	garage = false,
	objCoords = vector3(-443.0612, 5999.874, 27.58121),

})

-- basement - interrogation left
table.insert(Config.DoorList, {
	objHeading = 314.99984741211,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = true,
	slides = false,
	objHash = 1362051455, -- gabz_paletopd_doors01
	maxDistance = 1.0,
	garage = false,
	objCoords = vector3(-441.9416, 5998.754, 27.58121),

})

-- basement - cells area (1st gate)
table.insert(Config.DoorList, {
	objHeading = 314.99984741211,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	slides = false,
	objHash = -594854737, -- gabz_paletopd_cells_gate
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-443.6405, 6006.973, 27.731),
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cells area (2st gate)
table.insert(Config.DoorList, {
	objHeading = 44.999942779541,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	slides = false,
	objHash = -594854737, -- gabz_paletopd_cells_gate
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-442.2433, 6012.62, 27.731),
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell 1 left
table.insert(Config.DoorList, {
	objHeading = 134.99992370605,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	slides = false,
	objHash = -594854737, -- gabz_paletopd_cells_gate
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-445.9457, 6012.88, 27.731),
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell 2 left
table.insert(Config.DoorList, {
	objHeading = 134.99992370605,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	slides = false,
	objHash = -594854737, -- gabz_paletopd_cells_gate
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-448.916, 6015.851, 27.731),
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell 1 right
table.insert(Config.DoorList, {
	objHeading = 134.99992370605,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	slides = false,
	objHash = -594854737, -- gabz_paletopd_cells_gate
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-443.3901, 6015.436, 27.731),
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell 2 right
table.insert(Config.DoorList, {
	objHeading = 134.99992370605,
	lockpick = false,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	slides = false,
	objHash = -594854737, -- gabz_paletopd_cells_gate
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(-446.3604, 6018.407, 27.731),
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})


-- ## GABZ - DAVIS POLICE DEPARTMENT
-- ## COORDINATES: 383.423,-1590.407,29.276


-- main entrance
table.insert(Config.DoorList, {
	doors = {
		{objHash = 1670919150, objHeading = 140.00004577637, objCoords = vector3(379.7842, -1592.606, 30.20128)}, -- gabz_davispd_maindoor_left
		{objHash = 618295057, objHeading = 140.00004577637, objCoords = vector3(381.776, -1594.277, 30.20128)} -- gabz_davispd_maindoor_right
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,

})

-- back entrance
table.insert(Config.DoorList, {
	doors = {
		{objHash = 1670919150, objHeading = 320.0, objCoords = vector3(371.512, -1615.871, 30.20128)}, -- gabz_davispd_maindoor_left
		{objHash = 618295057, objHeading = 320.0, objCoords = vector3(369.5202, -1614.2, 30.20128)} -- gabz_davispd_maindoor_right
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,

})

-- reception
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(382.8243, -1599.025, 30.14451),
	fixText = false,
	objHash = -425870000, -- gabz_davispd_singledoor_02
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- captain office
table.insert(Config.DoorList, {
	doors = {
		{objHash = -425870000, objHeading = 50.000118255615, objCoords = vector3(363.1489, -1592.496, 31.14457)}, -- gabz_davispd_singledoor_02
		{objHash = -425870000, objHeading = 230.00004577637, objCoords = vector3(361.6097, -1594.33, 31.14457)} -- gabz_davispd_singledoor_02
 },
	authorizedJobs = { ['police']=6 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,

})

-- office left
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(358.3827, -1595.001, 31.14457),
	fixText = false,
	objHash = -425870000, -- gabz_davispd_singledoor_02
	objHeading = 50.000106811523,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- office right
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(363.2424, -1589.209, 31.14457),
	fixText = false,
	objHash = -425870000, -- gabz_davispd_singledoor_02
	objHeading = 230.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- cell women (main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(369.067, -1605.688, 29.94213),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- cell men (main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(368.2669, -1605.016, 29.94213),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- staircase left (from main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(384.4286, -1601.96, 30.14451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 50.000118255615,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- staircase right (from main floor)
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(374.636, -1613.63, 30.14451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 230.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - mugshot
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(379.1723, -1603.826, 25.54451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - observation
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(375.543, -1608.151, 25.54451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - interrogation
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(371.9582, -1605.143, 25.54544),
	fixText = false,
	objHash = -728950481,
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - restroom
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(368.894, -1602.572, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - cell women
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(375.0779, -1598.435, 25.34306),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 140.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - cell men
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(375.878, -1599.106, 25.34306),
	fixText = true,
	objHash = -674638964, -- gabz_davispd_cell_door
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,
	-- oldMethod = true,
	audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- basement - hallway double door
table.insert(Config.DoorList, {
	doors = {
		{objHash = -1335406364, objHeading = 230.00004577637, objCoords = vector3(368.864, -1600.432, 25.54544)}, -- gabz_davispd_singledoor_01
		{objHash = -1335406364, objHeading = 50.000072479248, objCoords = vector3(370.4107, -1598.589, 25.54544)} -- gabz_davispd_singledoor_01
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,

})

-- basement - forensics
table.insert(Config.DoorList, {
	doors = {
		{objHash = -425870000, objHeading = 140.00004577637, objCoords = vector3(367.8591, -1594.313, 25.54551)}, -- gabz_davispd_singledoor_02
		{objHash = -425870000, objHeading = 320.0, objCoords = vector3(369.7023, -1595.86, 25.54551)} -- gabz_davispd_singledoor_02
 },
	authorizedJobs = { ['police']=0 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,

})

-- basement - armory
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(367.119, -1601.082, 25.54451),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 320.0,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - lockers
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(363.8884, -1595.472, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 230.00004577637,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - showers left
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(361.0061, -1595.953, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 319.99996948242,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- basement - showers right
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	slides = false,
	garage = false,
	maxDistance = 2.0,
	objCoords = vector3(364.6354, -1591.628, 25.54544),
	fixText = false,
	objHash = -1335406364, -- gabz_davispd_singledoor_01
	objHeading = 319.99996948242,
	lockpick = false,
	audioRemote = false,
	locked = true,

})

-- ## Davits END


-- ## Burgershot doors back to fight club

table.insert(Config.DoorList, {
	slides = false,
	doors = {
		{objHash = -2007132977, objHeading = 296.1908569336, objCoords = vector3(465.6588, -1512.81, 28.3001)},
		{objHash = -2007132977, objHeading = 116.98123168946, objCoords = vector3(465.3276, -1512.202, 28.3001)}
 	},
	locked = true,
	items = {['key-fight'] = false},
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		

})

-- Burgershot fight club door 
table.insert(Config.DoorList, {
	slides = false,
	doors = {
		{objHash = 390840000, objHeading = 17.26561164856, objCoords = vector3(472.611, -1499.792, 29.4597)},
		{objHash = 390840000, objHeading = 196.59687805176, objCoords = vector3(475.0912, -1499.03, 29.4597)}
 },
	locked = true,
	items = { ['key-fight'] = false},
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		

})

-- Burgershot fight club door boss
table.insert(Config.DoorList, {
	objCoords = vector3(476.329, -1512.444, 29.47014),
	locked = true,
	items = { ['key-fight'] = false},
	objHeading = 106.67986297608,
	maxDistance = 2.0,
	lockpick = false,
	garage = false,
	audioRemote = false,
	fixText = false,
	slides = false,
	objHash = 390840000,		

})

-- BSHOT
table.insert(Config.DoorList, {
	objCoords = vector3(454.9492, -1484.89, 29.445),
	maxDistance = 2.0,
	lockpick = false,
	slides = false,
	locked = true,
	objHash = 634417522,
	garage = false,
	authorizedJobs = { ['burger']=0 },
	audioRemote = false,
	objHeading = 17.48272895813,
	fixText = false,		

})

-- BShot2
table.insert(Config.DoorList, {
	objCoords = vector3(452.6448, -1493.648, 29.66972),
	maxDistance = 6.0,
	lockpick = false,
	slides = 6.0,
	locked = true,
	objHash = -2083132822,
	garage = true,
	authorizedJobs = { ['burger']=0 },
	audioRemote = false,
	objHeading = 286.92413330078,
	fixText = false,		

})

-- BeanMachine Coffee
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	objHash = 736699661,
	fixText = false,
	objCoords = vector3(-629.7998, 228.9898, 82.0489),
	items = { ['key-fight'] = false},
	objHeading = 0.2654080092907,
	garage = false,
	locked = true,
	slides = false,
	maxDistance = 2.0,		

})

-- Court Main
table.insert(Config.DoorList, {
	garage = false,
	objHash = 519199960,
	lockpick = false,
	audioRemote = false,
	slides = false,
	objHeading = 50.000003814698,
	maxDistance = 2.0,
	fixText = false,
	authorizedJobs = { ['police']=0, ['lawyer']=0 },
	objCoords = vector3(334.6114, -1637.39, 60.67992),
	locked = true,		

})

-- Court Door 2
table.insert(Config.DoorList, {
	audioRemote = false,
	doors = {
		{objHash = 519199960, objHeading = 50.000003814698, objCoords = vector3(334.6114, -1637.39, 60.67992)},
		{objHash = 519199960, objHeading = 230.0, objCoords = vector3(332.981, -1639.334, 60.67992)}
 },
	authorizedJobs = { ['police']=0 },
	locked = true,
	slides = false,
	lockpick = false,
	maxDistance = 2.5,		

})

-- EM Court
table.insert(Config.DoorList, {
	audioRemote = false,
	doors = {
		{objHash = -534114649, objHeading = 230.0, objCoords = vector3(349.0468, -1652.85, 32.77394)},
		{objHash = -534114649, objHeading = 50.0, objCoords = vector3(350.7142, -1650.876, 32.77394)}
 },
	authorizedJobs = { ['police']=0 },
	locked = true,
	slides = false,
	lockpick = false,
	maxDistance = 2.5,		

})

-- EM Court
table.insert(Config.DoorList, {
	audioRemote = false,
	doors = {
		{objHash = -534114649, objHeading = 50.0, objCoords = vector3(326.0328, -1623.458, 32.77394)},
		{objHash = -534114649, objHeading = 230.0, objCoords = vector3(324.3674, -1625.434, 32.77394)}
 },
	authorizedJobs = { ['police']=0 },
	locked = true,
	slides = false,
	lockpick = false,
	maxDistance = 2.5,		

})

-- Court Main Door 2
table.insert(Config.DoorList, {
	objCoords = vector3(321.0678, -1629.366, 32.77394),
	slides = false,
	fixText = false,
	garage = false,
	authorizedJobs = { ['police']=0, ['lawyer']=0 },
	objHash = -534114649,
	lockpick = false,
	locked = true,
	objHeading = 230.0,
	audioRemote = false,
	maxDistance = 2.0,		

})

-- Court Main door 3
table.insert(Config.DoorList, {
	objCoords = vector3(322.7354, -1627.388, 32.77394),
	slides = false,
	fixText = false,
	garage = false,
	authorizedJobs = { ['police ']=0, ['lawyer']=0 },
	objHash = -534114649,
	lockpick = false,
	locked = true,
	objHeading = 50.0,
	audioRemote = false,
	maxDistance = 2.0,		

})

-- Court Door 5 
table.insert(Config.DoorList, {
	objCoords = vector3(319.4486, -1631.306, 32.77394),
	slides = false,
	fixText = false,
	garage = false,
	authorizedJobs = { ['police']=0, ['lawyer']=0 },
	objHash = -534114649,
	lockpick = false,
	locked = true,
	objHeading = 50.0,
	audioRemote = false,
	maxDistance = 2.0,		

})

-- Court Door 6
table.insert(Config.DoorList, {
	objCoords = vector3(317.7808, -1633.284, 32.77394),
	slides = false,
	fixText = false,
	garage = false,
	authorizedJobs = { ['police']=0, ['lawyer']=0 },
	objHash = -534114649,
	lockpick = false,
	locked = true,
	objHeading = 230.0,
	audioRemote = false,
	maxDistance = 2.0,		

})

-- Court BAckdoor
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	slides = false,
	maxDistance = 2.0,
	authorizedJobs = { ['police']=0, ['judge']=0, ['lawyer']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(342.4714, -1636.714, 23.9356),
	fixText = false,
	objHeading = 50.0,
	objHash = 899713588,		

})

-- Judge room
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	slides = false,
	maxDistance = 2.0,
	authorizedJobs = { ['police']=0, ['judge']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(330.2996, -1624.432, 60.67992),
	fixText = false,
	objHeading = 320.00003051758,
	objHash = 519199960,		

})

-- Court door 10
table.insert(Config.DoorList, {
	locked = true,
	authorizedJobs = { ['police']=0 },
	doors = {
		{objHash = -534114649, objHeading = 230.0, objCoords = vector3(321.0678, -1629.366, 32.77394)},
		{objHash = -534114649, objHeading = 50.0, objCoords = vector3(322.7354, -1627.388, 32.77394)}
 },
	slides = false,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,		

})

-- Съд 7ми етаж стълбище
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	slides = false,
	maxDistance = 2.0,
	authorizedJobs = { ['police']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(338.8434, -1638.326, 60.67952),
	fixText = false,
	objHeading = 320.00003051758,
	objHash = 899713588,		

})


-- Cranberry Entrance
table.insert(Config.DoorList, {
	audioRemote = false,
	authorizedJobs = { ['cranberry']=0, ['realestate']=3 },
	lockpick = false,
	maxDistance = 2.5,
	locked = true,
	doors = {
		{objHash = 168169629, objHeading = 264.68933105468, objCoords = vector3(-1081.64, -316.794, 37.97238)},
		{objHash = 168169629, objHeading = 84.689239501954, objCoords = vector3(-1081.412, -314.3546, 37.97238)}
 },
	slides = false,		

})

-- PDG Studio Entrance
table.insert(Config.DoorList, {
	objCoords = vector3(124.63, -1956.9, 20.92242),
	objHash = -543490328,
	objHeading = 230.297164917,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	items = { ['key_studio'] = false},
	authorizedJobs = {['realestate']=3 },		

})

-- PDG Second Door
table.insert(Config.DoorList, {
	objCoords = vector3(129.5508, -1953.948, 15.40428),
	objHash = -1726331785,
	objHeading = 320.4288635254,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	items = { ['key_studio'] = false},
	authorizedJobs = {['realestate']=3 },		

})

-- Fixit
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	garage = false,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	objCoords = vector3(534.403, -166.2948, 54.77276),
	objHash = 141631573,
	objHeading = 270.00003051758,
	authorizedJobs = { ['fixit']=0, ['realestate']=3 },
	slides = false,
	locked = true,		

})

-- Fixit
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	garage = true,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	objCoords = vector3(548.4612, -201.9602, 55.49274),
	objHash = -1458889440,
	objHeading = 0.0,
	authorizedJobs = { ['fixit']=0, ['realestate']=3 },
	slides = 6.0,
	locked = true,		

})

-- Fixit
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	garage = false,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	objCoords = vector3(540.942, -195.9652, 54.88402),
	objHash = -1309543596,
	objHeading = 270.00003051758,
	authorizedJobs = { ['fixit']=4, ['realestate']=3 },
	slides = false,
	locked = true,		

})

-- Fixit
table.insert(Config.DoorList, {
	maxDistance = 3.0,
	garage = true,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	objCoords = vector3(537.1796, -171.46, 55.50362),
	objHash = -1218332211,
	objHeading = 360.0,
	authorizedJobs = { ['fixit']=0, ['realestate']=3 },
	slides = 3.0,
	locked = true,		

})

-- Fixit
table.insert(Config.DoorList, {
	objHeading = 89.999977111816,
	slides = false,
	maxDistance = 2.0,
	authorizedJobs = { ['fixit']=0, ['realestate']=3 },
	locked = true,
	objHash = -1309543596,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	garage = false,
	objCoords = vector3(552.0874, -193.4602, 54.8862),		

})

-- Fixit Office
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 315.00003051758,
	objCoords = vector3(545.2166, -194.251, 54.64054),
	authorizedJobs = { ['fixit']=4, ['realestate']=3 },
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,
	garage = false,
	slides = false,
	fixText = false,
	objHash = 1497823487,		

})

-- Fixit Garage
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 270.00003051758,
	objCoords = vector3(541.3296, -189.3748, 55.5144),
	authorizedJobs = { ['fixit']=0, ['realestate']=3},
	lockpick = false,
	audioRemote = false,
	maxDistance = 3.0,
	garage = true,
	slides = 6.0,
	fixText = false,
	objHash = -1218332211,		

})

-- Fixit Garage 2
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 270.00003051758,
	objCoords = vector3(541.335, -179.241, 55.50628),
	authorizedJobs = { ['fixit']=0, ['realestate']=3 },
	lockpick = false,
	audioRemote = false,
	maxDistance = 3.0,
	garage = true,
	slides = 6.0,
	fixText = false,
	objHash = -1458889440,		

})

--[[ -- MechanicOffice
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0, ['police']=0 },
	audioRemote = false,
	lockpick = false,
	objHeading = 183.65063476562,
	garage = false,
	fixText = false,
	objCoords = vector3(955.3582, -972.4452, 39.64792),
	maxDistance = 2.0,
	slides = false,
	objHash = -626684119,
	locked = true,		

})

-- MechanicOffice2
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0, ['police']=0 },
	audioRemote = false,
	lockpick = false,
	objHeading = 93.65064239502,
	garage = false,
	fixText = false,
	objCoords = vector3(948.5288, -965.352, 39.64354),
	maxDistance = 2.0,
	slides = false,
	objHash = 1289778077,
	locked = true,		

})

-- MechanicGarage
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0, ['police']=0 },
	audioRemote = false,
	lockpick = false,
	objHeading = 3.6506202220916,
	garage = true,
	fixText = false,
	objCoords = vector3(945.9344, -985.571, 41.1689),
	maxDistance = 6.0,
	slides = 6.0,
	objHash = -983965772,
	locked = true,		

})
 ]]

--[[ -- Fleeca
table.insert(Config.DoorList, {
	objHash = -1591004109,
	objHeading = 159.84617614746,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['police']=0 },
	garage = false,
	objCoords = vector3(150.2914, -1047.63, 29.6663),
	lockpick = false,
	maxDistance = 2.0,		

})

-- Fleeca2
table.insert(Config.DoorList, {
	objHash = -1591004109,
	objHeading = 159.86595153808,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['police']=0 },
	garage = false,
	objCoords = vector3(314.6238, -285.9944, 54.463),
	lockpick = false,
	maxDistance = 2.0,		

})

-- Fleeca3
table.insert(Config.DoorList, {
	objHash = -1591004109,
	objHeading = 206.86373901368,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['police']=0 },
	garage = false,
	objCoords = vector3(-1207.328, -335.129, 38.07926),
	lockpick = false,
	maxDistance = 2.0,		

})

-- Fleeca4
table.insert(Config.DoorList, {
	objHash = -1591004109,
	objHeading = 160.85981750488,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['police']=0 },
	garage = false,
	objCoords = vector3(-350.4144, -56.79706, 49.3348),
	lockpick = false,
	maxDistance = 2.0,		

})

-- Fleeca5
table.insert(Config.DoorList, {
	objHash = -1591004109,
	objHeading = 267.54205322266,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['police']=0 },
	garage = false,
	objCoords = vector3(-2956.116, 485.4206, 15.9953),
	lockpick = false,
	maxDistance = 2.0,		

})

-- Fleeca6
table.insert(Config.DoorList, {
	objHash = -1591004109,
	objHeading = 0.0,
	locked = true,
	audioRemote = false,
	slides = false,
	fixText = false,
	authorizedJobs = { ['police']=0 },
	garage = false,
	objCoords = vector3(1172.292, 2713.146, 38.38626),
	lockpick = false,
	maxDistance = 2.0,		

}) ]]

--[[ -- bobcatdubbledoor
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	slides = false,
    bomb = true,
    minbomblvl = 1,	
	doors = {
		{objHash = 362975687, objHeading = 70.000755310058, objCoords = vector3(276.3748, 302.6016, 105.7066)},
		{objHash = 362975687, objHeading = 250.00079345704, objCoords = vector3(277.2656, 305.049, 105.7066)}
 },		

}) ]]

--[[ -- Perla 1 
table.insert(Config.DoorList, {
	locked = true,
	doors = {
		{objHash = -845944160, objHeading = 150.68878173828, objCoords = vector3(-1816.14, -1194.73, 13.32606)},
		{objHash = -845944160, objHeading = 329.57287597656, objCoords = vector3(-1817.696, -1193.834, 13.32606)}
 },
	slides = false,
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	items = { ['key-fight'] },		

})

-- Perla2
table.insert(Config.DoorList, {
	objHeading = 329.45733642578,
	fixText = false,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	objHash = 175957109,
	slides = false,
	lockpick = false,
	garage = false,
	objCoords = vector3(-1831.588, -1181.016, 13.32242),
	items = { ['key-fight'] },		

})

-- perla3
table.insert(Config.DoorList, {
	objHeading = 329.88232421875,
	fixText = false,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	objHash = -549220861,
	slides = false,
	lockpick = false,
	garage = false,
	objCoords = vector3(-1831.568, -1180.9, 18.17456),
	items = { ['key-fight'] },		

})

-- perla4
table.insert(Config.DoorList, {
	objHeading = 329.88232421875,
	fixText = false,
	audioRemote = false,
	maxDistance = 2.0,
	locked = true,
	objHash = -1590685223,
	slides = false,
	lockpick = false,
	garage = false,
	objCoords = vector3(-1845.514, -1194.834, 18.17456),
	items = { ['key-fight'] },		

})

-- perla5
table.insert(Config.DoorList, {
	locked = true,
	doors = {
		{objHash = -845944160, objHeading = 240.14065551758, objCoords = vector3(-1822.688, -1200.34, 18.40328)},
		{objHash = -845944160, objHeading = 60.010360717774, objCoords = vector3(-1823.598, -1201.888, 18.4102)}
 },
	slides = false,
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	items = { ['key-fight'] },		

})

-- perla7
table.insert(Config.DoorList, {
	locked = true,
	doors = {
		{objHash = -845944160, objHeading = 59.678939819336, objCoords = vector3(-1842.928, -1199.794, 13.32606)},
		{objHash = -845944160, objHeading = 239.82064819336, objCoords = vector3(-1842.026, -1198.24, 13.32606)}
 },
	slides = false,
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	items = { ['key-fight'] },		

}) ]]

-- red circle vip
table.insert(Config.DoorList, {
	authorizedJobs = { ['realestate']=3 },
	doors = {
		{objHash = -1555108147, objHeading = 280.00003051758, objCoords = vector3(-313.4834, 199.823, 101.036)},
		{objHash = -1989765534, objHeading = 99.999977111816, objCoords = vector3(-313.033, 197.269, 101.036)}
 },
	locked = true,
	slides = false,
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,		

})

-- RS stairts
table.insert(Config.DoorList, {
	authorizedJobs = { ['realestate']=3 },
	doors = {
		{objHash = -1989765534, objHeading = 280.00003051758, objCoords = vector3(-316.4804, 213.5806, 100.0412)},
		{objHash = -1989765534, objHeading = 99.999977111816, objCoords = vector3(-316.022, 211.028, 100.0412)}
 },
	locked = true,
	slides = false,
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,		

})

-- RS stairts down
table.insert(Config.DoorList, {
	authorizedJobs = { ['realestate']=3 },
	doors = {
		{objHash = -1989765534, objHeading = 280.00003051758, objCoords = vector3(-316.3278, 215.6834, 88.04294)},
		{objHash = -1989765534, objHeading = 99.999961853028, objCoords = vector3(-315.8776, 213.1296, 88.04294)}
 },
	locked = true,
	slides = false,
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,		

})

-- Office-zen
table.insert(Config.DoorList, {
	doors = {
		{objHash = 220394186, objHeading = 159.99995422364, objCoords = vector3(-75.5661, -821.4784, 243.541)},
		{objHash = 220394186, objHeading = 339.99996948242, objCoords = vector3(-74.0156, -822.0428, 243.541)}
 },
	locked = true,
	lockpick = false,
	slides = false,
	maxDistance = 2.5,
	audioRemote = false,
	items = { ['key_mansion'] = false},

})

-- retrotaxi1
table.insert(Config.DoorList, {
	locked = true,
	fixText = false,
	lockpick = false,
	garage = false,
	objHeading = 58.010314941406,
	objCoords = vector3(895.8756, -161.0502, 77.0637),
	objHash = -2023754432,
	maxDistance = 2.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['police']=0, ['retro']=0 },		

})

-- retrotaxi2
table.insert(Config.DoorList, {
	locked = true,
	fixText = false,
	lockpick = false,
	garage = true,
	objHeading = 147.9923248291,
	objCoords = vector3(900.085, -147.8304, 77.32048),
	objHash = 2064385778,
	maxDistance = 6.0,
	audioRemote = false,
	slides = 6.0,
	authorizedJobs = { ['police']=0, ['retro']=0 },		

})

-- retrotaxi3
table.insert(Config.DoorList, {
	locked = true,
	fixText = false,
	lockpick = false,
	garage = false,
	objHeading = 328.84948730468,
	objCoords = vector3(895.2414, -144.865, 77.04504),
	objHash = -2023754432,
	maxDistance = 2.0,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['police']=0, ['retro']=0 },		

})

-- retrotaxi4
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['police']=0, ['retro']=0 },
	doors = {
		{objHash = 1519319655, objHeading = 238.3483581543, objCoords = vector3(906.6434, -161.5644, 74.54778)},
		{objHash = 1519319655, objHeading = 58.205558776856, objCoords = vector3(908.1146, -159.1846, 74.54778)}
 },
	audioRemote = false,
	locked = true,		

})

-- retrotaxidoordubble2leftside
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	doors = {
		{objHash = -2023754432, objHeading = 147.98602294922, objCoords = vector3(900.7322, -164.6912, 74.33624)},
		{objHash = -2023754432, objHeading = 327.72305297852, objCoords = vector3(898.5288, -163.3064, 74.33624)}
 },
	locked = true,
	slides = false,
	audioRemote = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['retro']=0 },		

})

-- retrotaxidubbleleftsidesceonddoor
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	doors = {
		{objHash = -2023754432, objHeading = 327.72305297852, objCoords = vector3(893.644, -171.1678, 74.83766)},
		{objHash = -2023754432, objHeading = 146.8657836914, objCoords = vector3(895.833, -172.5738, 74.83766)}
 },
	locked = true,
	slides = false,
	audioRemote = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['retro']=0 },		

})

-- retrotaxistairsdoor
table.insert(Config.DoorList, {
	objHeading = 238.02786254882,
	locked = true,
	authorizedJobs = { ['police']=0, ['retro']=0 },
	fixText = false,
	objCoords = vector3(890.2438, -169.815, 77.0637),
	maxDistance = 2.0,
	garage = false,
	objHash = -2023754432,
	audioRemote = false,
	lockpick = false,
	slides = false,		

})

-- retrotaxidubblemainsouthside
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	doors = {
		{objHash = -2023754432, objHeading = 238.01802062988, objCoords = vector3(895.1224, -178.2062, 74.85624)},
		{objHash = -2023754432, objHeading = 58.631664276124, objCoords = vector3(893.7596, -180.4168, 74.85624)}
 },
	locked = true,
	slides = false,
	audioRemote = false,
	lockpick = false,
	authorizedJobs = { ['police']=0, ['retro']=0 },		

})

-- BolnicaGeto
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0 },
	objCoords = vector3(1140.596, -1539.69, 35.53592),
	objHash = 1438783233,
	maxDistance = 2.0,
	garage = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	lockpick = false,
	slides = false,
	objHeading = 325.1233215332,		

})

-- Ambulance recepicq
table.insert(Config.DoorList, {
	fixText = false,
	objCoords = vector3(1132.568, -1537.372, 35.02236),
	lockpick = false,
	objHeading = 180.12512207032,
	audioRemote = false,
	maxDistance = 2.0,
	garage = false,
	locked = true,
	objHash = -551608542,
	authorizedJobs = { ['ambulance']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ambulance Duble door reception
table.insert(Config.DoorList, {
	audioRemote = false,
	maxDistance = 2.5,
	slides = false,
	doors = {
		{objHash = 1438783233, objHeading = 270.12335205078, objCoords = vector3(1127.054, -1538.07, 35.03638)},
		{objHash = 1438783233, objHeading = 90.123321533204, objCoords = vector3(1127.06, -1540.672, 35.03568)}
 },
	lockpick = false,
	authorizedJobs = { ['ambulance']=0 },
	locked = true,		
})

-- Ambulance sublekalnq
table.insert(Config.DoorList, {
	fixText = false,
	objCoords = vector3(1146.12, -1549.846, 35.5259),
	lockpick = false,
	objHeading = 145.12321472168,
	audioRemote = false,
	maxDistance = 2.0,
	garage = false,
	locked = true,
	objHash = -551608542,
	authorizedJobs = { ['ambulance']=0 },
	slides = false,
})

-- BolnicaGeto3
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0, ['police']=0 },
	objCoords = vector3(1137.212, -1582.886, 34.3656),
	objHash = -540100983,
	maxDistance = 1.5,
	garage = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	lockpick = false,
	slides = true,
	objHeading = 180.12512207032,		
})

-- BolnicaGeto4
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0, ['ambulance']=0 },
	objCoords = vector3(1141.304, -1582.878, 34.36668),
	objHash = -540100983,
	maxDistance = 1.5,
	garage = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	lockpick = false,
	slides = true,
	objHeading = 180.12512207032,		

})


---------------------------------------
--------------#NoLagHotel#-------------
---------------------------------------

-- Door 101
table.insert(Config.DoorList, {
	slides = false,
	motel = 101,
	maxDistance = 1.0,
	objHash = -674469114,
	objHeading = 192.00001525878,
	lockpick = false,
	locked = true,
	audioRemote = false,
	fixText = true,
	objCoords = vector3(-1187.524, -187.1136, 47.8864),
	garage = false,
})

-- Door 102
table.insert(Config.DoorList, {
	slides = false,
	motel = 102,
	maxDistance = 1.0,
	objHash = -674469114,
	objHeading = 192.00001525878,
	lockpick = false,
	locked = true,
	audioRemote = false,
	fixText = true,
	objCoords = vector3(-1179.698, -185.4504, 47.8864),
	garage = false,
			

})

-- Door 103
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 103,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1171.874, -183.7872, 47.8864),
	
	fixText = true,
	objHeading = 192.00001525878,		

})

-- Door 104
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 104,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1164.048, -182.124, 47.8864),
	
	fixText = true,
	objHeading = 192.0,		

})

-- Door 105
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 105,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1156.224, -180.4606, 47.8864),
	
	fixText = true,
	objHeading = 192.0,		

})

-- Door 106
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = true,
	locked = 106,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1148.398, -178.7976, 47.8864),
	
	fixText = true,
	objHeading = 192.0,		

})

-- Door 107
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 107,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1151.92, -183.1864, 47.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 108
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 108,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1159.744, -184.8442, 47.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 109
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 109,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1167.568, -186.5066, 47.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 110
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 110,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1175.396, -188.1688, 47.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 111
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 111,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1183.22, -189.8282, 47.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 112
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 112,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1191.046, -191.4884, 47.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 113
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 113,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1202.648, -202.509, 47.8864),
	
	fixText = true,
	objHeading = 61.878936767578,		

})

-- Door 114
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 114,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1206.404, -209.5732, 47.8864),
	
	fixText = true,
	objHeading = 61.878936767578,		

})

-- Door 115
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 115,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1210.158, -216.636, 47.8864),
	
	fixText = true,
	objHeading = 62.000022888184,		

})

-- Door 116
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 61.999992370606,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1213.914, -223.699, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 116,
	maxDistance = 1.0,		

})

-- Door 117
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 61.999992370606,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1217.67, -230.7622, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 117,
	maxDistance = 1.0,		

})

-- Door 118
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 61.999992370606,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1221.426, -237.8262, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 118,
	maxDistance = 1.0,		

})

-- Door 119
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 242.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1222, -232.587, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 119,
	maxDistance = 1.0,		

})

-- Door 120
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 242.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1218.244, -225.523, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 120,
	maxDistance = 1.0,		

})

-- Door 121
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 242.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1214.488, -218.46, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 121,
	maxDistance = 1.0,		

})

-- Door 122
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 242.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1210.732, -211.3962, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 122,
	maxDistance = 1.0,		

})

-- Door 123
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 242.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1206.976, -204.3324, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 123,
	maxDistance = 1.0,		

})

-- Door 124
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 242.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1203.266, -197.354, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 124,
	maxDistance = 1.0,		

})

-- Door 125
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 306.99884033204,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1210.898, -177.2776, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 125,
	maxDistance = 1.0,		

})

-- Door 126
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 306.99884033204,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1220.526, -164.5004, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 126,
	maxDistance = 1.0,		

})

-- Door 127
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 306.99884033204,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1230.154, -151.7216, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 127,
	maxDistance = 1.0,		

})

-- Door 128
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 126.99882507324,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1225.132, -153.034, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 128,
	maxDistance = 1.0,		

})

-- Door 129
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 126.99882507324,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1215.504, -165.8116, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 129,
	maxDistance = 1.0,		

})

-- Door 130
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 126.99882507324,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1205.876, -178.5884, 47.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 130,
	maxDistance = 1.0,		

})

-- Door 201
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 201,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1187.524, -187.1136, 51.8864),
	
	fixText = true,
	objHeading = 192.00001525878,		

})

-- Door 202
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 202,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1179.698, -185.4504, 51.8864),
	
	fixText = true,
	objHeading = 192.00001525878,		

})

-- Door 203
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 203,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1171.874, -183.7872, 51.8864),
	
	fixText = true,
	objHeading = 192.00001525878,		

})

-- Door 204
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 204,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1164.048, -182.124, 51.8864),
	
	fixText = true,
	objHeading = 192.0,		

})

-- Door 205
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 205,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1156.224, -180.4606, 51.8864),
	
	fixText = true,
	objHeading = 192.0,		

})

-- Door 206
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 206,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1148.398, -178.7976, 51.8864),
	
	fixText = true,
	objHeading = 192.0,		

})

-- Door 207
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 207,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1151.92, -183.1864, 51.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 208
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 208,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1159.744, -184.8442, 51.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 209
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 209,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1167.568, -186.5066, 51.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 210
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 210,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1175.396, -188.1688, 51.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 211
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 211,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1183.22, -189.8282, 51.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 212
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	motel = 212,
	locked = true,
	lockpick = false,
	objHash = -674469114,
	garage = false,
	maxDistance = 1.0,
	objCoords = vector3(-1191.046, -191.4884, 51.8864),
	
	fixText = true,
	objHeading = 11.999977111816,		

})

-- Door 213
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 61.878936767578,
	
	slides = false,
	motel = 213,
	objCoords = vector3(-1202.648, -202.509, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 214
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 61.878936767578,
	
	slides = false,
	motel = 214,
	objCoords = vector3(-1206.404, -209.5732, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 215
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 62.000022888184,
	
	slides = false,
	motel = 215,
	objCoords = vector3(-1210.158, -216.636, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 216
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 61.999992370606,
	
	slides = false,
	motel = 216,
	objCoords = vector3(-1213.914, -223.699, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 217
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 61.999992370606,
	
	slides = false,
	motel = 217,
	objCoords = vector3(-1217.67, -230.7622, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 218
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 61.999992370606,
	
	slides = false,
	motel = 218,
	objCoords = vector3(-1221.426, -237.8262, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 219
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 242.0,
	
	slides = false,
	motel = 219,
	objCoords = vector3(-1222, -232.587, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 220
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 242.0,
	
	slides = false,
	motel = 220,
	objCoords = vector3(-1218.244, -225.523, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 221
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 242.0,
	
	slides = false,
	motel = 221,
	objCoords = vector3(-1214.488, -218.46, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 222
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 242.0,
	
	slides = false,
	motel = 222,
	objCoords = vector3(-1210.732, -211.3962, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 223
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 242.0,
	
	slides = false,
	motel = 223,
	objCoords = vector3(-1206.976, -204.3324, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 224
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 242.0,
	
	slides = false,
	motel = 224,
	objCoords = vector3(-1203.266, -197.354, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 225
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 306.99884033204,
	
	slides = false,
	motel = 225,
	objCoords = vector3(-1210.898, -177.2776, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 226
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 306.99884033204,
	
	slides = false,
	motel = 226,
	objCoords = vector3(-1220.526, -164.5004, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 227
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 306.99884033204,
	
	slides = false,
	motel = 227,
	objCoords = vector3(-1230.154, -151.7216, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 228
table.insert(Config.DoorList, {
	garage = false,
	objHeading = 126.99882507324,
	
	slides = false,
	motel = 228,
	objCoords = vector3(-1225.132, -153.034, 51.8864),
	locked = true,
	maxDistance = 1.0,
	objHash = -674469114,
	lockpick = false,
	audioRemote = false,
	fixText = true,		

})

-- Door 229
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 126.99882507324,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1215.504, -165.8116, 51.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 229,
	maxDistance = 1.0,		

})

-- Door 230
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 126.99882507324,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1205.876, -178.5884, 51.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 230,
	maxDistance = 1.0,		

})

-- Door 301
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 192.00001525878,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1187.524, -187.1136, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 301,
	maxDistance = 1.0,		

})

-- Door 302
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 192.00001525878,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1179.698, -185.4504, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 302,
	maxDistance = 1.0,		

})

-- Door 303
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 192.00001525878,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1171.874, -183.7872, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 303,
	maxDistance = 1.0,		

})

-- Door 304
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 192.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1164.048, -182.124, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 304,
	maxDistance = 1.0,		

})

-- Door 305
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 192.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1156.224, -180.4606, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 305,
	maxDistance = 1.0,		

})

-- Door 306
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 192.0,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1148.398, -178.7976, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 306,
	maxDistance = 1.0,		

})

-- Door 307
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 11.999977111816,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1151.92, -183.1864, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 307,
	maxDistance = 1.0,		

})

-- Door 308
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 11.999977111816,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1159.744, -184.8442, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 308,
	maxDistance = 1.0,		

})

-- Door 309
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 11.999977111816,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1167.568, -186.5066, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 309,
	maxDistance = 1.0,		

})

-- Door 310
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 11.999977111816,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1175.396, -188.1688, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 310,
	maxDistance = 1.0,		

})

-- Door 311
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 11.999977111816,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1183.22, -189.8282, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 311,
	maxDistance = 1.0,		

})

-- Door 312
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 11.999977111816,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1191.046, -191.4884, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 312,
	maxDistance = 1.0,		

})

-- Door 313
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 61.878936767578,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1202.648, -202.509, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 313,
	maxDistance = 1.0,		

})

-- Door 314
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 61.878936767578,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1206.404, -209.5732, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 314,
	maxDistance = 1.0,		

})

-- Door 315
table.insert(Config.DoorList, {
	locked = true,
	
	lockpick = false,
	objHeading = 62.000022888184,
	fixText = true,
	audioRemote = false,
	objCoords = vector3(-1210.158, -216.636, 55.8864),
	garage = false,
	objHash = -674469114,
	slides = false,
	motel = 315,
	maxDistance = 1.0,		

})


----------------------
--------#DONE#--------
----------------------
-- Door 316
table.insert(Config.DoorList, {
	audioRemote = false,
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	garage = false,
	lockpick = false,
	fixText = true,
    motel = 316,
	locked = true,
	objHash = -674469114,
	slides = false,
	objCoords = vector3(-1213.914, -223.699, 55.8864),		

})

-- Door 317
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 317,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1217.67, -230.7622, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	lockpick = false,		

})

-- Door 318
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 318,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1221.426, -237.8262, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	lockpick = false,		

})

-- Door 319
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 319,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1222, -232.587, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 242.0,
	lockpick = false,		

})

-- Door 320
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 320,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1218.244, -225.523, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 242.0,
	lockpick = false,		

})

-- Door 321
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 321,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1214.488, -218.46, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 242.0,
	lockpick = false,		

})

-- Door 322
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 322,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1210.732, -211.3962, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 242.0,
	lockpick = false,		

})

-- Door 323
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 323,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1206.976, -204.3324, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 242.0,
	lockpick = false,		

})

-- Door 324
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 324,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1203.266, -197.354, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 242.0,
	lockpick = false,		

})

-- Door 325
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 325,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1210.898, -177.2776, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 306.99884033204,
	lockpick = false,		

})

-- Door 326
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 326,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1220.526, -164.5004, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 306.99884033204,
	lockpick = false,		

})

-- Door 327
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 327,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1230.154, -151.7216, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 306.99884033204,
	lockpick = false,		

})

-- Door 328
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 328,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1225.132, -153.034, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 126.99882507324,
	lockpick = false,		

})

-- Door 329
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 329,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1215.504, -165.8116, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 126.99882507324,
	lockpick = false,		

})

-- Door 330
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 330,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1205.876, -178.5884, 55.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 126.99882507324,
	lockpick = false,		

})

-- Door 401
table.insert(Config.DoorList, {
	objHash = -674469114,
	slides = false,
	fixText = true,
    motel = 401,
	garage = false,
	maxDistance = 1.0,
	locked = true,
	objCoords = vector3(-1187.524, -187.1136, 59.8864),
	audioRemote = false,
	authorizedJobs = {},
	objHeading = 192.00001525878,
	lockpick = false,		

})

-- Door 402
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 192.00001525878,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 402,
	objCoords = vector3(-1179.698, -185.4504, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 403
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 192.00001525878,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 403,
	objCoords = vector3(-1171.874, -183.7872, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 404
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 192.0,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 404,
	objCoords = vector3(-1164.048, -182.124, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 405
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 192.0,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 405,
	objCoords = vector3(-1156.224, -180.4606, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 406
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 192.0,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 406,
	objCoords = vector3(-1148.398, -178.7976, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 407
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 11.999977111816,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 407,
	objCoords = vector3(-1151.92, -183.1864, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 408
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 11.999977111816,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 408,
	objCoords = vector3(-1159.744, -184.8442, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 409
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 11.999977111816,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 409,
	objCoords = vector3(-1167.568, -186.5066, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 410
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 11.999977111816,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 410,
	objCoords = vector3(-1175.396, -188.1688, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 411
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 11.999977111816,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 411,
	objCoords = vector3(-1183.22, -189.8282, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 412
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 11.999977111816,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 412,
	objCoords = vector3(-1191.046, -191.4884, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 413
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.878936767578,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 413,
	objCoords = vector3(-1202.648, -202.509, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 414
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.878936767578,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 414,
	objCoords = vector3(-1206.404, -209.5732, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 415
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 62.000022888184,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 415,
	objCoords = vector3(-1210.158, -216.636, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 416
table.insert(Config.DoorList, {
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	locked = true,
	slides = false,
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 416,
	objCoords = vector3(-1213.914, -223.699, 59.8864),
	objHash = -674469114,
	lockpick = false,		

})

-- Door 417
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 61.999992370606,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1217.67, -230.7622, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 417,		

})

-- Door 418
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 61.999992370606,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1221.426, -237.8262, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 418,		

})

-- Door 419
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 242.0,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1222, -232.587, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 419,		

})

-- Door 420
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 242.0,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1218.244, -225.523, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 420,		

})

-- Door 421
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 242.0,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1214.488, -218.46, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 421,		

})

-- Door 422
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 242.0,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1210.732, -211.3962, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 422,		

})

-- Door 423
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 242.0,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1206.976, -204.3324, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 423,		

})

-- Door 424
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 242.0,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1203.266, -197.354, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 424,		

})

-- Door 425
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 306.99884033204,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1210.898, -177.2776, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 425,		

})

-- Door 426
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 306.99884033204,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1220.526, -164.5004, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 426,		

})

-- Door 427
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 306.99884033204,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1230.154, -151.7216, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 427,		

})

-- Door 428
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 126.99882507324,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1225.132, -153.034, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 428,		

})

-- Door 429
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 126.99882507324,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1215.504, -165.8116, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 429,		

})

-- Door 430
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHeading = 126.99882507324,
	slides = false,
	authorizedJobs = {},
	objHash = -674469114,
	objCoords = vector3(-1205.876, -178.5884, 59.8864),
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 430,		

})

-- Door 501
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 192.00001525878,
	audioRemote = false,
	fixText = true,
    motel = 501,
	objCoords = vector3(-1187.524, -187.1136, 63.88638),
	lockpick = false,		

})

-- Door 502 
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 192.00001525878,
	audioRemote = false,
	fixText = true,
    motel = 502,
	objCoords = vector3(-1179.698, -185.4504, 63.88638),
	lockpick = false,		

})

-- Door 503
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 192.00001525878,
	audioRemote = false,
	fixText = true,
    motel = 503,
	objCoords = vector3(-1171.874, -183.7872, 63.88638),
	lockpick = false,		

})

-- Door 504
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 192.0,
	audioRemote = false,
	fixText = true,
    motel = 504,
	objCoords = vector3(-1164.048, -182.124, 63.88638),
	lockpick = false,		

})

-- Door 505
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 192.0,
	audioRemote = false,
	fixText = true,
    motel = 505,
	objCoords = vector3(-1156.224, -180.4606, 63.88638),
	lockpick = false,		

})

-- Door 506
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 192.0,
	audioRemote = false,
	fixText = true,
    motel = 506,
	objCoords = vector3(-1148.398, -178.7976, 63.88638),
	lockpick = false,		

})

-- Door 507
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 11.999977111816,
	audioRemote = false,
	fixText = true,
    motel = 507,
	objCoords = vector3(-1151.92, -183.1864, 63.88638),
	lockpick = false,		

})

-- Door 508
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 11.999977111816,
	audioRemote = false,
	fixText = true,
    motel = 508,
	objCoords = vector3(-1159.744, -184.8442, 63.88638),
	lockpick = false,		

})

-- Door 509
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 11.999977111816,
	audioRemote = false,
	fixText = true,
    motel = 509,
	objCoords = vector3(-1167.568, -186.5066, 63.88638),
	lockpick = false,		

})

-- Door 510
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 11.999977111816,
	audioRemote = false,
	fixText = true,
    motel = 510,
	objCoords = vector3(-1175.396, -188.1688, 63.88638),
	lockpick = false,		

})

-- Door 511
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 11.999977111816,
	audioRemote = false,
	fixText = true,
    motel = 511,
	objCoords = vector3(-1183.22, -189.8282, 63.88638),
	lockpick = false,		

})

-- Door 512
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 11.999977111816,
	audioRemote = false,
	fixText = true,
    motel = 512,
	objCoords = vector3(-1191.046, -191.4884, 63.88638),
	lockpick = false,		

})

-- Door 513
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 61.878936767578,
	audioRemote = false,
	fixText = true,
    motel = 513,
	objCoords = vector3(-1202.648, -202.509, 63.88638),
	lockpick = false,		

})

-- Door 514
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 61.878936767578,
	audioRemote = false,
	fixText = true,
    motel = 514,
	objCoords = vector3(-1206.404, -209.5732, 63.88638),
	lockpick = false,		

})

-- Door 515
table.insert(Config.DoorList, {
	objHash = -674469114,
	garage = false,
	locked = true,
	maxDistance = 1.0,
	authorizedJobs = {},
	slides = false,
	objHeading = 62.000022888184,
	audioRemote = false,
	fixText = true,
    motel = 515,
	objCoords = vector3(-1210.158, -216.636, 63.88638),
	lockpick = false,		

})

-- Door 516
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1213.914, -223.699, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 516,
	objHeading = 61.999992370606,
	locked = true,		

})

-- Door 517
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1217.67, -230.7622, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 517,
	objHeading = 61.999992370606,
	locked = true,		

})

-- Door 518
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1221.426, -237.8262, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 518,
	objHeading = 61.999992370606,
	locked = true,		

})

-- Door 519
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1222, -232.587, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 519,
	objHeading = 242.0,
	locked = true,		

})

-- Door 520
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1218.244, -225.523, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 520,
	objHeading = 242.0,
	locked = true,		

})

-- Door 521
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1214.488, -218.46, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 521,
	objHeading = 242.0,
	locked = true,		

})

-- Door 522
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1210.732, -211.3962, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 522,
	objHeading = 242.0,
	locked = true,		

})

-- Door 523
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1206.976, -204.3324, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 523,
	objHeading = 242.0,
	locked = true,		

})

-- Door 524
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1203.266, -197.354, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 524,
	objHeading = 242.0,
	locked = true,		

})

-- Door 525
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1210.898, -177.2776, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 525,
	objHeading = 306.99884033204,
	locked = true,		

})

-- Door 526
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1220.526, -164.5004, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 526,
	objHeading = 306.99884033204,
	locked = true,		

})

-- Door 527
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1230.154, -151.7216, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 527,
	objHeading = 306.99884033204,
	locked = true,		

})

-- Door 528
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1225.132, -153.034, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 528,
	objHeading = 126.99882507324,
	locked = true,		

})

-- Door 529
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1215.504, -165.8116, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 529,
	objHeading = 126.99882507324,
	locked = true,		

})

-- Door 530
table.insert(Config.DoorList, {
	lockpick = false,
	objCoords = vector3(-1205.876, -178.5884, 63.88638),
	slides = false,
	garage = false,
	audioRemote = false,
	objHash = -674469114,
	maxDistance = 1.0,
	authorizedJobs = {},
	fixText = true,
    motel = 530,
	objHeading = 126.99882507324,
	locked = true,		

})

-- Door 601
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1187.524, -187.1136, 67.88638),
	objHeading = 192.00001525878,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 601,
	authorizedJobs = {},
	locked = true,		

})

-- Door 602
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1179.698, -185.4504, 67.88638),
	objHeading = 192.00001525878,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 602,
	authorizedJobs = {},
	locked = true,		

})

-- Door 603
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1171.874, -183.7872, 67.88638),
	objHeading = 192.00001525878,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 603,
	authorizedJobs = {},
	locked = true,		

})

-- Door 604
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1164.048, -182.124, 67.88638),
	objHeading = 192.0,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 604,
	authorizedJobs = {},
	locked = true,		

})

-- Door 605
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1156.224, -180.4606, 67.88638),
	objHeading = 192.0,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 605,
	authorizedJobs = {},
	locked = true,		

})

-- Door 606
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1148.398, -178.7976, 67.88638),
	objHeading = 192.0,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 606,
	authorizedJobs = {},
	locked = true,		

})

-- Door 607
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1151.92, -183.1864, 67.88638),
	objHeading = 11.999977111816,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 607,
	authorizedJobs = {},
	locked = true,		

})

-- Door 608
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1159.744, -184.8442, 67.88638),
	objHeading = 11.999977111816,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 608,
	authorizedJobs = {},
	locked = true,		

})

-- Door 609
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1167.568, -186.5066, 67.88638),
	objHeading = 11.999977111816,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 609,
	authorizedJobs = {},
	locked = true,		

})

-- Door 610
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1175.396, -188.1688, 67.88638),
	objHeading = 11.999977111816,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 610,
	authorizedJobs = {},
	locked = true,		

})

-- Door 611
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1183.22, -189.8282, 67.88638),
	objHeading = 11.999977111816,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 611,
	authorizedJobs = {},
	locked = true,		

})

-- Door 612
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1191.046, -191.4884, 67.88638),
	objHeading = 11.999977111816,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 612,
	authorizedJobs = {},
	locked = true,		

})

-- Door 613
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1202.648, -202.509, 67.88638),
	objHeading = 61.878936767578,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 613,
	authorizedJobs = {},
	locked = true,		

})

-- Door 614
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1206.404, -209.5732, 67.88638),
	objHeading = 61.878936767578,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 614,
	authorizedJobs = {},
	locked = true,		

})

-- Door 615
table.insert(Config.DoorList, {
	objHash = -674469114,
	lockpick = false,
	objCoords = vector3(-1210.158, -216.636, 67.88638),
	objHeading = 62.000022888184,
	slides = false,
	garage = false,
	audioRemote = false,
	maxDistance = 1.0,
	fixText = true,
    motel = 615,
	authorizedJobs = {},
	locked = true,		

})

-- Door 616
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 616,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1213.914, -223.699, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	locked = true,		

})

-- Door 617
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 617,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1217.67, -230.7622, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	locked = true,		

})

-- Door 618
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 618,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1221.426, -237.8262, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 61.999992370606,
	locked = true,		

})

-- Door 619
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 619,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1222, -232.587, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 242.0,
	locked = true,		

})

-- Door 620
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 620,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1218.244, -225.523, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 242.0,
	locked = true,		

})

-- Door 621
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 621,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1214.488, -218.46, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 242.0,
	locked = true,		

})

-- Door 622
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 622,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1210.732, -211.3962, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 242.0,
	locked = true,		

})

-- Door 623
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 623,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1206.976, -204.3324, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 242.0,
	locked = true,		

})

-- Door 624
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 624,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1203.266, -197.354, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 242.0,
	locked = true,		

})

-- Door 625
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 625,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1210.898, -177.2776, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 306.99884033204,
	locked = true,		

})

-- Door 626
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 626,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1220.526, -164.5004, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 306.99884033204,
	locked = true,		

})

-- Door 627
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 627,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1230.154, -151.7216, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 306.99884033204,
	locked = true,		

})

-- Door 628
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 628,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1225.132, -153.034, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 126.99882507324,
	locked = true,		

})

-- Door 629
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 629,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1215.504, -165.8116, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 126.99882507324,
	locked = true,		

})

-- Door 630
table.insert(Config.DoorList, {
	garage = false,
	fixText = true,
    motel = 630,
	objHash = -674469114,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(-1205.876, -178.5884, 67.88638),
	maxDistance = 1.0,
	authorizedJobs = {},
	objHeading = 126.99882507324,
	locked = true,		

})

-- Door 701
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 192.00001525878,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 701,
	authorizedJobs = {},
	objCoords = vector3(-1187.524, -187.1136, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 702
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 192.00001525878,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 702,
	authorizedJobs = {},
	objCoords = vector3(-1179.698, -185.4504, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 703
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 192.00001525878,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 703,
	authorizedJobs = {},
	objCoords = vector3(-1171.874, -183.7872, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 704
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 192.0,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 704,
	authorizedJobs = {},
	objCoords = vector3(-1164.048, -182.124, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 705
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 192.0,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 705,
	authorizedJobs = {},
	objCoords = vector3(-1156.224, -180.4606, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 706
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 192.0,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 706,
	authorizedJobs = {},
	objCoords = vector3(-1148.398, -178.7976, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 707
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 11.999977111816,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 707,
	authorizedJobs = {},
	objCoords = vector3(-1151.92, -183.1864, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 708
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 11.999977111816,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 708,
	authorizedJobs = {},
	objCoords = vector3(-1159.744, -184.8442, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 709
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 11.999977111816,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 709,
	authorizedJobs = {},
	objCoords = vector3(-1167.568, -186.5066, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 710
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 11.999977111816,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 710,
	authorizedJobs = {},
	objCoords = vector3(-1175.396, -188.1688, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 711
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 11.999977111816,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 711,
	authorizedJobs = {},
	objCoords = vector3(-1183.22, -189.8282, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 712
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 11.999977111816,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 712,
	authorizedJobs = {},
	objCoords = vector3(-1191.046, -191.4884, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 713
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 61.878936767578,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 713,
	authorizedJobs = {},
	objCoords = vector3(-1202.648, -202.509, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 714
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 61.878936767578,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 714,
	authorizedJobs = {},
	objCoords = vector3(-1206.404, -209.5732, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 715
table.insert(Config.DoorList, {
	objHash = -674469114,
	objHeading = 62.000022888184,
	slides = false,
	maxDistance = 1.0,
	lockpick = false,
	fixText = true,
    motel = 715,
	authorizedJobs = {},
	objCoords = vector3(-1210.158, -216.636, 71.88638),
	audioRemote = false,
	garage = false,
	locked = true,		

})

-- Door 716
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 716,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1213.914, -223.699, 71.88638),
	authorizedJobs = {},
	objHeading = 61.999992370606,		

})

-- Door 717
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 717,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1217.67, -230.7622, 71.88638),
	authorizedJobs = {},
	objHeading = 61.999992370606,		

})

-- Door 718
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 718,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1221.426, -237.8262, 71.88638),
	authorizedJobs = {},
	objHeading = 61.999992370606,		

})

-- Door 719
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 719,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1222, -232.587, 71.88638),
	authorizedJobs = {},
	objHeading = 242.0,		

})

-- Door 720
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 720,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1218.244, -225.523, 71.88638),
	authorizedJobs = {},
	objHeading = 242.0,		

})

-- Door 721
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 721,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1214.488, -218.46, 71.88638),
	authorizedJobs = {},
	objHeading = 242.0,		

})

-- Door 722
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 722,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1210.732, -211.3962, 71.88638),
	authorizedJobs = {},
	objHeading = 242.0,		

})

-- Door 723
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 723,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1206.976, -204.3324, 71.88638),
	authorizedJobs = {},
	objHeading = 242.0,		

})

-- Door 724
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 724,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1203.266, -197.354, 71.88638),
	authorizedJobs = {},
	objHeading = 242.0,		

})

-- Door 725
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 725,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1210.898, -177.2776, 71.88638),
	authorizedJobs = {},
	objHeading = 306.99884033204,		

})

-- Door 726
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 726,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1220.526, -164.5004, 71.88638),
	authorizedJobs = {},
	objHeading = 306.99884033204,		

})

-- Door 727
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 727,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1230.154, -151.7216, 71.88638),
	authorizedJobs = {},
	objHeading = 306.99884033204,		

})

-- Door 728
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 728,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1225.132, -153.034, 71.88638),
	authorizedJobs = {},
	objHeading = 126.99882507324,		

})

-- Door 729
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 729,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1215.504, -165.8116, 71.88638),
	authorizedJobs = {},
	objHeading = 126.99882507324,		

})

-- Door 730
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	fixText = true,
    motel = 730,
	maxDistance = 1.0,
	locked = true,
	slides = false,
	lockpick = false,
	objHash = -674469114,
	objCoords = vector3(-1205.876, -178.5884, 71.88638),
	authorizedJobs = {},
	objHeading = 126.99882507324,		

})

-- Old Police Station Duble entrance Doors
table.insert(Config.DoorList, {
	audioRemote = false,
	maxDistance = 2.5,
	locked = true,
	lockpick = false,
	slides = false,
	doors = {
		{objHash = 320433149, objHeading = 270.0, objCoords = vector3(434.7478, -983.215, 30.83926)},
		{objHash = -1215222675, objHeading = 270.0, objCoords = vector3(434.7478, -980.6184, 30.83926)}
 },
	authorizedJobs = { ['police']=0 },		

})

-- Davis Sliding Door
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 140.00001525878,
	garage = false,
	lockpick = false,
	objCoords = vector3(397.8852, -1607.386, 28.34166),
	objHash = 1286535678,
	audioRemote = true,
	slides = true,
	maxDistance = 6.0,		

})

-- Park Ranger entrance
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 0.0,
	garage = false,
	lockpick = false,
	objCoords = vector3(387.7514, 792.871, 187.8492),
	objHash = -117185009,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,		

})

-- Park Ranger entrance 2
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 89.999977111816,
	garage = false,
	lockpick = false,
	objCoords = vector3(388.6312, 799.6824, 187.8262),
	objHash = -117185009,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,		

})

-- Park Ranger entrance cells
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 270.0,
	garage = false,
	lockpick = false,
	objCoords = vector3(383.408, 798.291, 187.6118),
	objHash = 517369125,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,		

})

-- Park Ranger cell1
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 1.0017911336036e-05,
	garage = false,
	lockpick = false,
	objCoords = vector3(382.9616, 796.8286, 187.6118),
	objHash = 517369125,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,		

})

-- Park Ranger cell2
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 1.0017911336036e-05,
	garage = false,
	lockpick = false,
	objCoords = vector3(378.7584, 796.8364, 187.6124),
	objHash = 517369125,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,
})

-- Park Ranger entrance 2floor
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=0 },
	objHeading = 0.0,
	garage = false,
	lockpick = false,
	objCoords = vector3(380.2174, 792.7882, 190.6414),
	objHash = -117185009,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,
})

-- Park Ranger Boss 2floor
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	authorizedJobs = { ['police']=6 },
	objHeading = 270.00003051758,
	garage = false,
	lockpick = false,
	objCoords = vector3(384.3812, 796.0928, 190.6396),
	objHash = 1704212348,
	audioRemote = false,
	slides = false,
	maxDistance = 2.0,
})

-- villa
table.insert(Config.DoorList, {
	objHash = 813813633,
	slides = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(-2599.566, 1900.004, 167.7372),
	items = { ['key-villa'] = false},
	maxDistance = 2.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	objHeading = 97.109367370606,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- villa1
table.insert(Config.DoorList, {
	objHash = 308207762,
	slides = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(-2587.574, 1910.456, 167.6492),
	items = { ['key-villa'] = false},
	maxDistance = 2.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	objHeading = 5.8312764167786,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- villa2
table.insert(Config.DoorList, {
	objHash = 813813633,
	slides = false,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(-2599.796, 1901.748, 164.1048),
	items = { ['key-villa'] = false},
	maxDistance = 2.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	objHeading = 95.44822692871,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- villa3
table.insert(Config.DoorList, {
	objHash = 1068002766,
	slides = 6.0,
	audioRemote = false,
	locked = true,
	fixText = false,
	objCoords = vector3(-2597.114, 1926.738, 167.6546),
	items = { ['key-villa'] = false},
	maxDistance = 6.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	objHeading = 185.63621520996,
	garage = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})


-- Mechanic new1
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	slides = false,
	objHash = -2023754432,
	objHeading = 135.0,
	audioRemote = false,
	objCoords = vector3(983.7192, -112.7636, 74.47338),
	lockpick = false,
	locked = true,
	fixText = false,
	maxDistance = 2.0,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Mechanic new2
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	slides = false,
	objHash = 1243635233,
	objHeading = 315.00003051758,
	audioRemote = false,
	objCoords = vector3(986.6098, -98.7691, 74.47464),
	lockpick = false,
	locked = true,
	fixText = false,
	maxDistance = 2.0,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Mechanic new3
table.insert(Config.DoorList, {
	authorizedJobs = { ['mechanic']=0 },
	slides = false,
	objHash = -551608542,
	objHeading = 134.99996948242,
	audioRemote = false,
	objCoords = vector3(997.335, -127.8876, 73.48542),
	lockpick = false,
	locked = true,
	fixText = false,
	maxDistance = 2.0,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- pharmacy back
table.insert(Config.DoorList, {
	locked = true,
	authorizedJobs = { ['ambulance']= 4 },
	audioRemote = false,
	garage = false,
	objHeading = 270.00003051758,
	fixText = false,
	objHash = -2051450263,
	slides = false,
	maxDistance = 2.0,
	lockpick = false,
	objCoords = vector3(372.8698, -826.4908, 29.42128),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- pharmacy front
table.insert(Config.DoorList, {
	locked = true,
	authorizedJobs = { ['ambulance']= 4 },
	audioRemote = false,
	garage = false,
	objHeading = 89.999977111816,
	fixText = false,
	objHash = -2037125726,
	slides = false,
	maxDistance = 2.0,
	lockpick = false,
	objCoords = vector3(376.3026, -825.5708, 29.443),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- malibu
table.insert(Config.DoorList, {
	objCoords = vector3(-3137.584, 798.9524, 16.35332),
	objHeading = 122.50592803956,
	fixText = false,
	objHash = 1286535678,
	locked = true,
	lockpick = false,
	authorizedJobs = { ['jamals']= 0 },
	maxDistance = 6.0,
	garage = false,
	audioRemote = false,
	slides = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Old Town Left Garage
table.insert(Config.DoorList, {
	slides = 6.0,
	objHeading = 180.075881958,
	fixText = false,
	lockpick = false,
	objHash = -822900180,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['realestate']=3 },
	maxDistance = 6.0,
	garage = true,
	objCoords = vector3(1182.306, 2645.232, 38.63962),
	items = { ['oldtown-key'] = false},		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Old Town Garage Door Right
table.insert(Config.DoorList, {
	slides = 6.0,
	objHeading = 180.075881958,
	fixText = false,
	lockpick = false,
	objHash = -822900180,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['none']=0 },
	maxDistance = 6.0,
	garage = true,
	objCoords = vector3(1174.654, 2645.222, 38.63962),
	items = { ['oldtown-key'] = false},		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Old Town Door
table.insert(Config.DoorList, {
	slides = false,
	objHeading = 180.075881958,
	fixText = false,
	lockpick = false,
	objHash = 1335311341,
	locked = true,
	audioRemote = false,
	authorizedJobs = { ['none']=0 },
	maxDistance = 2.0,
	garage = false,
	objCoords = vector3(1187.202, 2644.95, 38.55176),
	items = { ['oldtown-key'] = false},		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Police to Depo
table.insert(Config.DoorList, {
	objHash = -1156020871,
	garage = false,
	maxDistance = 2.0,
	objHeading = 49.99995803833,
	fixText = true,
	authorizedJobs = { ['police']=0 },
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(391.8602, -1636.07, 29.97438),
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})



-- Mechanic Service
table.insert(Config.DoorList, {
	objHash = 764243116,
	slides = 6.0,
	locked = true,
	authorizedJobs = { ['mechanic']=0 },
	objHeading = 225.0,
	garage = true,
	objCoords = vector3(985.4186, -135.9958, 74.95732),
	lockpick = false,
	audioRemote = false,
	fixText = false,
	maxDistance = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Аптеката1
table.insert(Config.DoorList, {
	authorizedJobs = { ['ambulance']=0 },
	locked = true,
	garage = false,
	objHash = -1119680854,
	objCoords = vector3(380.6896, -832.8232, 29.4732),
	lockpick = false,
	audioRemote = false,
	slides = false,
	fixText = false,
	objHeading = 179.99998474122,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffemain
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	authorizedJobs = { ['catcoffee']=0 },
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = 526179188, objHeading = 0.0, objCoords = vector3(-581.6678, -1069.628, 22.48974)},
		{objHash = -69331849, objHeading = 0.0, objCoords = vector3(-580.361, -1069.628, 22.48974)}
 },
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Big brother front
table.insert(Config.DoorList, {
	objCoords = vector3(-1091.374, 366.653, 67.70918),
	audioRemote = false,
	fixText = false,
	authorizedJobs = { ['realestate']=3 },
	items = { ['key-bigbrother'] = false},
	locked = true,
	maxDistance = 6.0,
	objHeading = 90.0,
	slides = true,
	lockpick = false,
	objHash = 1930237257,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Big brother front 2
table.insert(Config.DoorList, {
	objCoords = vector3(-1126.068, 388.979, 69.76716),
	audioRemote = false,
	fixText = false,
	authorizedJobs = { ['realestate']=3 },
	items = { ['key-bigbrother'] = false},
	locked = true,
	maxDistance = 6.0,
	objHeading = 176.50004577636,
	slides = true,
	lockpick = false,
	objHash = -2139443164,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})



-- catcaffeeback
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['catcoffee']=0 },
	fixText = false,
	objCoords = vector3(-600.8886, -1055.132, 22.71302),
	objHeading = 269.99996948242,
	locked = true,
	maxDistance = 2.0,
	objHash = 1099436502,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffeeback1
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['catcoffee']=0 },
	fixText = false,
	objCoords = vector3(-592.4738, -1056.092, 22.413),
	objHeading = 0.0,
	locked = true,
	maxDistance = 2.0,
	objHash = -60871655,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffeeback2
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['catcoffee']=0 },
	fixText = false,
	objCoords = vector3(-590.1828, -1054.148, 22.413),
	objHeading = 179.99998474122,
	locked = true,
	maxDistance = 2.0,
	objHash = -60871655,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffeeback3
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['catcoffee']=0 },
	fixText = false,
	objCoords = vector3(-587.34, -1051.9, 22.413),
	objHeading = 89.999977111816,
	locked = true,
	maxDistance = 2.0,
	objHash = -1283712428,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffeeback4
table.insert(Config.DoorList, {
	audioRemote = false,
	slides = false,
	lockpick = false,
	authorizedJobs = { ['catcoffee']=0 },
	fixText = false,
	objCoords = vector3(-571.7926, -1057.388, 26.76796),
	objHeading = 0.0,
	locked = true,
	maxDistance = 2.0,
	objHash = 2089009131,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- BIGROTHER
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHeading = 174.34184265136,
	audioRemote = false,
	fixText = false,
	objHash = 741314661,
	authorizedJobs = { ['realestate']=3 },
	items = { ['key-bigbrother'] = false},
	slides = true,
	lockpick = false,
	maxDistance = 6.0,
	objCoords = vector3(-1125.6, 391.3578, 69.79132),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- BIGBROTHER2
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHeading = 89.34181213379,
	audioRemote = false,
	fixText = false,
	objHash = 741314661,
	authorizedJobs = { ['realestate']=3 },
	items = { ['key-bigbrother'] = false},
	slides = true,
	lockpick = false,
	maxDistance = 6.0,
	objCoords = vector3(-1088.956, 366.0808, 67.5316),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mechanic boss
table.insert(Config.DoorList, {
	doors = {
		{objHash = 390840000, objHeading = 0.0, objCoords = vector3(0, 0, 0)},
		{objHash = 390840000, objHeading = 0.0, objCoords = vector3(0, 0, 0)}
 },
	slides = false,
	lockpick = false,
	locked = true,
	audioRemote = false,
	maxDistance = 2.5,
	authorizedJobs = { ['mechanic']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffegarage
table.insert(Config.DoorList, {
	locked = true,
	garage = true,
	authorizedJobs = { ['catcoffee']=0 },
	lockpick = false,
	audioRemote = false,
	objHeading = 270.00003051758,
	objCoords = vector3(-600.9106, -1059.218, 21.72144),
	slides = 6.0,
	maxDistance = 6.0,
	fixText = false,
	objHash = 522844070,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- qhta 
table.insert(Config.DoorList, {
	slides = false,
	lockpick = false,
	authorizedJobs = { ['crastenburg']=0 },
	audioRemote = false,
	objCoords = vector3(-2128.072, -2552.912, 6.034072),
	fixText = false,
	garage = false,
	objHeading = 126.99994659424,
	objHash = 563392945,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mechaniczen
table.insert(Config.DoorList, {
	objHeading = 149.99998474122,
	maxDistance = 6.0,
	slides = true,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	locked = true,
	garage = false,
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-875.4844, 18.12612, 44.4434),
	objHash = -844827165,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mechaniczen
table.insert(Config.DoorList, {
	objHeading = 149.99998474122,
	maxDistance = 6.0,
	slides = true,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	locked = true,
	garage = false,
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-875.4844, 18.12612, 44.4434),
	objHash = -844827165,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion1
table.insert(Config.DoorList, {
	objHash = -1527723153,
	objCoords = vector3(-1805.58, 436.0506, 128.8544),
	audioRemote = false,
	items = { ['key_mansion'] = false },
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion2
table.insert(Config.DoorList, {
	objHash = -1527723153,
	objCoords = vector3(-1804.114, 429.082, 128.9164),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 180.00001525878,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion3
table.insert(Config.DoorList, {
	objHash = -524036376,
	objCoords = vector3(-1813.33, 446.5412, 128.7278),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion4
table.insert(Config.DoorList, {
	objHash = 656216807,
	objCoords = vector3(-1816.872, 428.6214, 132.5938),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion5
table.insert(Config.DoorList, {
	objHash = 2060651272,
	objCoords = vector3(-1791.516, 419.0124, 132.536),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion6
table.insert(Config.DoorList, {
	objHash = -782244720,
	objCoords = vector3(-1786.228, 420.6412, 117.1524),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 270.00003051758,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion7
table.insert(Config.DoorList, {
	objHash = -801817937,
	objCoords = vector3(-1786.928, 411.7554, 113.7264),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = false,
	locked = true,
	fixText = false,
	slides = false,
	maxDistance = 2.0,
	objHeading = 180.00001525878,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- SubMansion8
table.insert(Config.DoorList, {
	objHash = 149328230,
	objCoords = vector3(-1792.468, 411.8614, 113.7774),
	audioRemote = false,
	items = { ['key_mansion'] = false},
	garage = true,
	locked = true,
	fixText = false,
	slides = 6.0,
	maxDistance = 6.0,
	objHeading = 0.0,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Medical Door
table.insert(Config.DoorList, {
	authorizedJobs = { ['emergency']=0 },
	lockpick = false,
	fixText = false,
	slides = false,
	audioRemote = false,
	objHash = -301673634,
	objCoords = vector3(809.35, -491.2876, 30.86946),
	garage = false,
	objHeading = 192.0,
	maxDistance = 2.0,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Little Seul Gate
table.insert(Config.DoorList, {
	garage = false,
	items = { ['key-vlak'] = false},
	objCoords = vector3(-668.4006, -889.6238, 23.68752),
	maxDistance = 6.0,
	lockpick = false,
	audioRemote = false,
	slides = true,
	fixText = false,
	objHeading = 90.00001525879,
	objHash = -1483471451,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Tattoo
table.insert(Config.DoorList, {
	objHash = 543652229,
	audioRemote = false,
	maxDistance = 2.0,
	slides = false,
	objHeading = 340.00003051758,
	lockpick = false,
	items = { ['tattoo-key'] = false},
	objCoords = vector3(321.8086, 178.36, 103.6782),
	locked = false,
	fixText = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Entry (normal door)
table.insert(Config.DoorList, {
	objCoords = vector3(154.9345, -3017.323, 7.190679),
	objHeading = 270.00003051758,		
	objHash = -2023754432, -- v_ilev_rc_door2
	maxDistance = 2.0,
	items = { ['tuner-key'] = false},
	audioRemote = false,
	garage = false,
	locked = false,
	lockpick = false,
	slides = false,
	fixText = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Garage door right (from outside)
table.insert(Config.DoorList, {
	items = { ['tuner-key'] = false},
	objCoords = vector3(154.8095, -3023.889, 8.503336),
	objHeading = 89.999961853027,
	objHash = -456733639, -- denis3d_ts_gate
	maxDistance = 5.0,
	audioRemote = false,
	garage = true,
	locked = true,
	lockpick = false,
	slides = 6.0,
	fixText = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Garage door left (from outside)
table.insert(Config.DoorList, {
	items = { ['tuner-key'] = false},
	objCoords = vector3(154.8095, -3034.051, 8.503336),
	objHeading = 89.999961853027,		
	objHash = -456733639, -- denis3d_ts_gate
	maxDistance = 5.0,
	audioRemote = false,
	garage = true,
	locked = true,
	lockpick = false,
	slides = 6.0,
	fixText = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Employees room
table.insert(Config.DoorList, {
	items = { ['tuner-key'] = false},
	objCoords = vector3(151.4668, -3011.705, 7.258367),
	objHeading = 89.999977111816,
	objHash = -1229046235, -- denis3d_ts_container_doors
	maxDistance = 2.0,
	audioRemote = false,
	garage = false,		
	locked = true,
	lockpick = false,
	slides = false,
	fixText = false,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lamesa 1
-- table.insert(Config.DoorList, {
-- 	audioRemote = false,
-- 	items = { 'Police' },
-- 	lockpick = false,
-- 	locked = true,
-- 	doors = {
-- 		{objHash = 277920071, objHeading = 89.999977111816, objCoords = vector3(827.952, -1288.786, 28.37116)},
-- 		{objHash = -34368499, objHeading = 269.99987792968, objCoords = vector3(827.952, -1291.386, 28.37116)}
--  },
-- 	maxDistance = 2.5,
-- 	authorizedJobs = { ['yacht']=0 },
-- 	slides = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- -- Lamesa 1
-- table.insert(Config.DoorList, {
-- 	audioRemote = false,
-- 	items = { 'Police' },
-- 	lockpick = false,
-- 	locked = true,
-- 	doors = {
-- 		{objHash = 277920071, objHeading = 89.999977111816, objCoords = vector3(827.952, -1288.786, 28.37116)},
-- 		{objHash = -34368499, objHeading = 269.99987792968, objCoords = vector3(827.952, -1291.386, 28.37116)}
--  },
-- 	maxDistance = 2.5,
-- 	authorizedJobs = { ['police']=0 },
-- 	slides = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- -- Lamesa 1
-- table.insert(Config.DoorList, {
-- 	audioRemote = false,
-- 	items = { 'Police' },
-- 	lockpick = false,
-- 	locked = true,
-- 	doors = {
-- 		{objHash = 277920071, objHeading = 89.999977111816, objCoords = vector3(827.952, -1288.786, 28.37116)},
-- 		{objHash = -34368499, objHeading = 269.99987792968, objCoords = vector3(827.952, -1291.386, 28.37116)}
--  },
-- 	maxDistance = 2.5,
-- 	authorizedJobs = { ['police']=0 },
-- 	slides = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	locked = true,
	doors = {
		{objHash = -34368499, objHeading = 269.99987792969, objCoords = vector3(827.9521, -1291.387, 28.37117)},
		{objHash = 277920071, objHeading = 89.999977111816, objCoords = vector3(827.9521, -1288.786, 28.37117)}
 },
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Observation - doorname: gabz_lamesapd_doors03_observation
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(840.0884, -1280.999, 28.37117),
	authorizedJobs = { ['police']=0 },
	objHash = -1011300766,
	maxDistance = 2.0,
	objHeading = 269.99996948242,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Interrogation - doorname: gabz_lamesapd_doors03_interogation
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(840.0861, -1281.824, 28.37117),
	authorizedJobs = { ['police']=0 },
	objHash = -1189294593,
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	locked = true,
	doors = {
		{objHash = 2076628221, objHeading = 0.0, objCoords = vector3(852.5331, -1287.346, 28.37117)},
		{objHash = -1983352576, objHeading = 179.99984741211, objCoords = vector3(849.9325, -1287.346, 28.37117)}
 },
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	locked = true,
	doors = {
		{objHash = 2076628221, objHeading = 0.0, objCoords = vector3(859.1082, -1287.346, 28.37117)},
		{objHash = -1983352576, objHeading = 179.99984741211, objCoords = vector3(856.5074, -1287.346, 28.37117)}
 },
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Archives - doorname: gabz_lamesapd_doors01_archives
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(858.865, -1291.385, 28.37111),
	authorizedJobs = { ['police']=0 },
	objHash = 539497004,
	maxDistance = 2.0,
	objHeading = 0.0,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cpt.Office - doorname: gabz_lamesapd_doors01_office
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(851.9497, -1298.389, 28.37117),
	authorizedJobs = { ['police']=0 },
	objHash = 1861900850,
	maxDistance = 2.0,
	objHeading = 89.999862670898,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cell - doorname: gabz_lamesapd_doors01_cell
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(834.2814, -1295.986, 28.37117),
	authorizedJobs = { ['police']=0 },
	objHash = 1162089799,
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lobby fence door - doorname: gabz_lamesapd_fancegate
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(835.9445, -1292.193, 27.78268),
	authorizedJobs = { ['police']=0 },
	objHash = -147896569,
	maxDistance = 2.0,
	objHeading = 270.00003051758,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Breakroom - doorname: gabz_lamesapd_doors01_breakroom
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(837.2611, -1309.514, 28.37111),
	authorizedJobs = { ['police']=0 },
	objHash = 1491736897,
	maxDistance = 2.0,
	objHeading = 269.99996948242,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Evidence - doorname: gabz_lamesapd_doors01_evidences
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(846.3696, -1310.04, 28.37111),
	authorizedJobs = { ['police']=0 },
	objHash = 272264766,
	maxDistance = 2.0,
	objHeading = 179.99995422363,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lockers1 - doorname: gabz_lamesapd_doors02_lockers
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(854.7811, -1310.04, 28.37111),
	authorizedJobs = { ['police']=0 },
	objHash = -1213101062,
	maxDistance = 2.0,
	objHeading = 0.0,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lockers2 - doorname: gabz_lamesapd_doors02_lockers
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(855.7422, -1314.608, 28.37111),
	authorizedJobs = { ['police']=0 },
	objHash = -1213101062,
	maxDistance = 2.0,
	objHeading = 269.99993896484,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	locked = true,
	doors = {
		{objCoords = vector3(856.5074, -1310.038, 28.37117), objHash = -375301406, objHeading = 179.99984741211},
		{objCoords = vector3(859.1082, -1310.038, 28.37117), objHash = -375301406, objHeading = 0.0}
 },
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Backentrance to hallway - doorname: gabz_lamesapd_doors02_entranceb
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(859.0076, -1320.125, 28.37111),
	authorizedJobs = { ['police']=0 },
	objHash = -1339729155,
	maxDistance = 2.0,
	objHeading = 0.0,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Backentrance to breakroom - doorname: gabz_lamesapd_doors02_entrancea
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(829.6385, -1310.128, 28.37117),
	authorizedJobs = { ['police']=0 },
	objHash = -1246730733,
	maxDistance = 2.0,
	objHeading = 179.99989318848,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Parkinglot gate - doorname: gabz_lamesapd_cargate
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(816.9862, -1325.258, 25.09328),
	authorizedJobs = { ['police']=0 },
	objHash = -1372582968,
	maxDistance = 6.0,
	objHeading = 269.0,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

table.insert(Config.DoorList, {
	audioRemote = false,
	lockpick = false,
	locked = true,
	doors = {
		{objCoords = vector3(1835.127, 3673.418, 34.33901), objHash = -1501157055, objHeading = 210.0},
		{objCoords = vector3(1837.378, 3674.718, 34.33901), objHash = -1501157055, objHeading = 29.999982833862}
 },
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lockers - doorname: gabz_sandypd_door_02
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1838.006, 3677.104, 34.28223),
	authorizedJobs = { ['police']=0 },
	objHash = 1364638935,
	maxDistance = 2.0,
	objHeading = 120.0,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Restroom - doorname: gabz_sandypd_door_02
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1836.488, 3681.427, 34.28223),
	authorizedJobs = { ['police']=0 },
	objHash = 1364638935,
	maxDistance = 2.0,
	objHeading = 29.999982833862,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Armory - doorname: gabz_sandypd_door_01
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1838.965, 3682.857, 34.28223),
	authorizedJobs = { ['police']=0 },
	objHash = -1264811159,
	maxDistance = 2.0,
	objHeading = 29.999982833862,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lobby to Office - doorname: gabz_sandypd_door_01
-- table.insert(Config.DoorList, {
-- 	garage = false,
-- 	objCoords = vector3(1829.853, 3673.789, 34.28223),
-- 	authorizedJobs = { ['police']=0 },
-- 	objHash = -1264811159,
-- 	maxDistance = 1.5,
-- 	objHeading = 300.00003051758,
-- 	audioRemote = false,
-- 	slides = false,
-- 	locked = true,
-- 	lockpick = false,
-- 	fixText = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- Lobby to hallway - doorname: gabz_sandypd_door_01
-- table.insert(Config.DoorList, {
-- 	garage = false,
-- 	objCoords = vector3(1830.65, 3676.562, 34.28223),
-- 	authorizedJobs = { ['police']=0 },
-- 	objHash = -1264811159,
-- 	maxDistance = 2.0,
-- 	objHeading = 210.00004577637,
-- 	audioRemote = false,
-- 	slides = false,
-- 	locked = true,
-- 	lockpick = false,
-- 	fixText = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- Hallway to Office - doorname: gabz_sandypd_door_01
-- table.insert(Config.DoorList, {
-- 	garage = false,
-- 	objCoords = vector3(1827.072, 3674.496, 34.28223),
-- 	authorizedJobs = { ['police']=0 },
-- 	objHash = -1264811159,
-- 	maxDistance = 1.5,
-- 	objHeading = 29.999975204468,
-- 	audioRemote = false,
-- 	slides = false,
-- 	locked = true,
-- 	lockpick = false,
-- 	fixText = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- Hallway to Reception - doorname: gabz_sandypd_door_01
-- table.insert(Config.DoorList, {
-- 	garage = false,
-- 	objCoords = vector3(1829.384, 3680.267, 34.28223),
-- 	authorizedJobs = { ['police']=0 },
-- 	objHash = -1264811159,
-- 	maxDistance = 2.0,
-- 	objHeading = 120.00000762939,
-- 	audioRemote = false,
-- 	slides = false,
-- 	locked = true,
-- 	lockpick = false,
-- 	fixText = false,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- Interrogation - doorname: gabz_sandypd_door_02
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1812.307, 3672.724, 34.28223),
	authorizedJobs = { ['police']=0 },
	objHash = 1364638935,
	maxDistance = 2.0,
	objHeading = 300.00003051758,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Observation - doorname: gabz_sandypd_door_01
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1814.195, 3669.453, 34.28223),
	authorizedJobs = { ['police']=0 },
	objHash = -1264811159,
	maxDistance = 2.0,
	objHeading = 300.00003051758,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Mugshot - doorname: gabz_sandypd_door_02
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1818.317, 3669.278, 34.28223),
	authorizedJobs = { ['police']=0 },
	objHash = 1364638935,
	maxDistance = 2.0,
	objHeading = 210.00004577637,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Celldoor - doorname: gabz_sandypd_cell_door
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1813.551, 3675.055, 34.39609),
	authorizedJobs = { ['police']=0 },
	objHash = 2010487154,
	maxDistance = 2.0,
	objHeading = 29.999982833862,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cell 1 - doorname: gabz_sandypd_cell_door
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1810.131, 3676.464, 34.39609),
	authorizedJobs = { ['police']=0 },
	objHash = 2010487154,
	maxDistance = 2.0,
	objHeading = 120.00000762939,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cell 2 - doorname: gabz_sandypd_cell_door
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1808.629, 3679.065, 34.39609),
	authorizedJobs = { ['police']=0 },
	objHash = 2010487154,
	maxDistance = 2.0,
	objHeading = 120.00000762939,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cell 3 - doorname: gabz_sandypd_cell_door
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1807.131, 3681.66, 34.39609),
	authorizedJobs = { ['police']=0 },
	objHash = 2010487154,
	maxDistance = 2.0,
	objHeading = 120.00000762939,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Archives - doorname: gabz_sandypd_door_01
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1828.527, 3680.229, 38.95245),
	authorizedJobs = { ['police']=0 },
	objHash = -1264811159,
	maxDistance = 2.0,
	objHeading = 300.00003051758,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Chief deputy sheriff - doorname: gabz_sandypd_door_03
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1831.23, 3675.428, 38.95245),
	authorizedJobs = { ['police']=0 },
	objHash = -1626613696,
	maxDistance = 2.0,
	objHeading = 120.0,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Sheriff - doorname: gabz_sandypd_door_03
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1828.429, 3673.812, 38.95245),
	authorizedJobs = { ['police']=0 },
	objHash = -1626613696,
	maxDistance = 2.0,
	objHeading = 120.00000762939,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Back Entrance - doorname: v_ilev_shrf2door
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1823.863, 3681.117, 34.33901),
	authorizedJobs = { ['police']=0 },
	objHash = -1501157055,
	maxDistance = 2.0,
	objHeading = 29.999982833862,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Parkinglot gate - doorname: prop_facgate_07b
table.insert(Config.DoorList, {
	garage = false,
	objCoords = vector3(1862.002, 3687.522, 33.01514),
	authorizedJobs = { ['police']=0 },
	objHash = 1286535678,
	maxDistance = 2.0,
	objHeading = 30.000005722046,
	audioRemote = false,
	slides = false,
	locked = true,
	lockpick = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cars
table.insert(Config.DoorList, {
	garage = false,
	objHash = -190780785,
	audioRemote = false,
	locked = true,
	slides = true,
	objCoords = vector3(484.5642, -1315.574, 30.20332),
	lockpick = false,
	objHeading = 116.87596130372,
	items = { ['fraud-key'] = false},
	authorizedJobs = { ['realestate']=3 },
	fixText = false,
	maxDistance = 5.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Cars 2
table.insert(Config.DoorList, {
	garage = false,
	objHash = -664582244,
	audioRemote = false,
	locked = true,
	slides = false,
	objCoords = vector3(482.8112, -1311.954, 29.35056),
	lockpick = false,
	objHeading = 116.87596130372,
	items = { ['fraud-key'] = false},
	authorizedJobs = { ['realestate']=3 },
	fixText = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- MansionGate
table.insert(Config.DoorList, {
	fixText = false,
	locked = true,
	maxDistance = 10.0,
	garage = false,
	slides = true,
	items = { ['key_mansion'] = false},
	audioRemote = false,
	objHeading = 178.04081726074,
	objCoords = vector3(-1799.668, 476.92, 132.9758),
	objHash = -2122677806,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Karting
-- table.insert(Config.DoorList, {
-- 	objCoords = vector3(-161.5716, -2147.834, 15.81698),
-- 	maxDistance = 5.0,
-- 	garage = false,
-- 	items = { 'key_karting' },
-- 	fixText = false,
-- 	audioRemote = false,
-- 	slides = true,
-- 	lockpick = false,
-- 	locked = true,
-- 	objHeading = 288.91543579102,
-- 	objHash = -1234764774,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- Karting 2
-- table.insert(Config.DoorList, {
-- 	objCoords = vector3(-158.7784, -2155.102, 17.06894),
-- 	maxDistance = 2.0,
-- 	garage = false,
-- 	items = { 'key_karting' },
-- 	fixText = false,
-- 	audioRemote = false,
-- 	slides = false,
-- 	lockpick = false,
-- 	locked = true,
-- 	objHeading = 109.46156311036,
-- 	objHash = 91564889,		
-- 	-- oldMethod = true,
-- 	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
-- 	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
-- 	-- autoLock = 1000
-- })

-- Red Circle Summer
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -1747016523, objHeading = 0.0, objCoords = vector3(4958.748, -4830.154, 5.74402)},
		{objHash = -23367131, objHeading = 0.0, objCoords = vector3(4964.22, -4830.154, 5.741168)}
 },
	authorizedJobs = { ['realestate']=3, ['redcircle'] = 0 },
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Red Circle Summer 2
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	doors = {
		{objHash = -23367131, objHeading = 299.99996948242, objCoords = vector3(5005.272, -4930.746, 9.451702)},
		{objHash = -1747016523, objHeading = 299.99996948242, objCoords = vector3(5002.538, -4926.006, 9.454554)}
 },
	authorizedJobs = { ['realestate']=3, ['redcircle'] = 0 },
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- front entry
table.insert(Config.DoorList, {
	doors = {
		{objHash = -49173194, objHeading = 270.00003051758, objCoords = vector3(794.2512, -759.4415, 27.02702)}, -- sm_pizzeria_mdoor_r
		{objHash = 95403626, objHeading = 270.00003051758, objCoords = vector3(794.2512, -757.0618, 27.02702)} -- sm_pizzeria_mdoor_l
 	},
	maxDistance = 2.5,
	locked = true,
	slides = false,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['pizzathis']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- left entry
table.insert(Config.DoorList, {
	doors = {
		{objHash = -49173194, objHeading = 180.00001525879, objCoords = vector3(803.2782, -747.9282, 27.02702)}, -- sm_pizzeria_mdoor_r
		{objHash = 95403626, objHeading = 180.00001525879, objCoords = vector3(805.658, -747.9282, 27.02702)} -- sm_pizzeria_mdoor_l
 	},
	maxDistance = 2.5,
	locked = true,
	slides = false,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['pizzathis']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- back entry
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	objCoords = vector3(814.5675, -762.8239, 27.04651), 
	lockpick = false,
	authorizedJobs = { ['pizzathis']=0 },
	locked = true,
	garage = false,
	slides = false,
	fixText = false,
	audioRemote = false,
	objHash = -420112688, -- sm_pizzeria_back_door
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- WC Ladies
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 89.999961853027,
	objCoords = vector3(800.403, -765.0848, 26.93464),
	lockpick = false,
	authorizedJobs = { ['pizzathis']=0 },
	locked = false,
	garage = false,
	slides = false,
	fixText = false,
	audioRemote = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- WC Gents
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 270.00003051758,
	objCoords = vector3(800.4145, -763.9932, 26.93464),
	lockpick = false,
	authorizedJobs = { ['pizzathis']=0 },
	locked = false,
	garage = false,
	slides = false,
	fixText = false,
	audioRemote = false, -- sm_pizzeria_wooden_door
	objHash = 1984391163,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Kitchen
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 0.0,
	objCoords = vector3(810.4092, -756.2733, 26.93464),
	lockpick = false,
	authorizedJobs = { ['pizzathis']=0 },
	locked = true,
	garage = false,
	slides = false,
	fixText = false,
	audioRemote = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
}) 

-- Fridge (sliding door)
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 90.0,
	objCoords = vector3(805.9268,-761.663,26.04281),
	lockpick = false,
	authorizedJobs = { ['pizzathis']=0 },
	locked = true,
	garage = false,
	slides = true,
	fixText = false,
	setText = true,
	textCoords = vector3(805.832,-761.683,26.781),
	audioRemote = false,
	objHash = 2136811971, -- sm_pizzeria_fridge_door	
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Freezer room (sliding door)
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	objCoords = vector3(805.2613, -758.6738, 25.79361),
	lockpick = false,
	authorizedJobs = { ['pizzathis']=0 },
	locked = true,
	garage = false,
	slides = false,
	fixText = false,
	setText = true,
	textCoords = vector3(805.152,-759.427,26.900),
	audioRemote = false,
	objHash = -357301147, -- sm_pizzeria_freezer_door	
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- cave
table.insert(Config.DoorList, {
	lockpick = false,
	garage = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	authorizedJobs = { ['pizzathis']=0 },
	fixText = false,
	slides = false,
	objCoords = vector3(806.2781, -765.8099, 26.93464),
	objHeading = 179.99998474121,
	audioRemote = false,
	locked = true,
	maxDistance = 5.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- stairs access
table.insert(Config.DoorList, {
	lockpick = false,
	garage = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	authorizedJobs = { ['pizzathis']=0 },
	fixText = false,
	slides = false,
	objCoords = vector3(811.9174, -762.428, 26.93464),
	objHeading = 89.999961853027,
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- stairs access (upper floor)
table.insert(Config.DoorList, {
	lockpick = false,
	garage = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	authorizedJobs = { ['pizzathis']=0 },
	fixText = false,
	slides = false,
	objCoords = vector3(804.4858, -767.6975, 31.41847),
	objHeading = 270.00003051758,
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office (upper floor)
table.insert(Config.DoorList, {
	lockpick = false,
	garage = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	authorizedJobs = { ['pizzathis']=0 },
	fixText = false,
	slides = false,
	objCoords = vector3(798.6847, -763.329, 31.41847),
	objHeading = 0.0,
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- CEO (upper floor)
table.insert(Config.DoorList, {
	lockpick = false,
	garage = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	authorizedJobs = { ['pizzathis']=0 },
	fixText = false,
	slides = false,
	objCoords = vector3(797.4042, -758.2521, 31.41847),
	objHeading = 179.99998474121,
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Lockers (upper floor)
table.insert(Config.DoorList, {
	lockpick = false,
	garage = false,
	objHash = 1984391163, -- sm_pizzeria_wooden_door
	authorizedJobs = { ['pizzathis']=0 },
	fixText = false,
	slides = false,
	objCoords = vector3(806.8858, -764.5674, 31.41847),
	objHeading = 270.00003051758,
	audioRemote = false,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Judge 2
table.insert(Config.DoorList, {
	slides = false,
	audioRemote = false,
	locked = true,
	maxDistance = 2.5,
	lockpick = false,
	authorizedJobs = { ['judge']=0 },
	doors = {
		{objHash = 220394186, objHeading = 277.99993896484, objCoords = vector3(-1387.389, -479.5271, 72.1973)},
		{objHash = 220394186, objHeading = 97.999946594238, objCoords = vector3(-1387.619, -477.8932, 72.1973)}
 	},		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Docks
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	maxDistance = 6.0,
	items = { ['fraud-key'] = false},
	authorizedJobs = { ['realestate']=3 },
	slides = true,
	doors = {
		{objHash = -190780785, objHeading = 179.99998474121, objCoords = vector3(-440.0606, -2171.827, 11.3672)},
		{objHash = -190780785, objHeading = 179.99998474121, objCoords = vector3(-445.3054, -2171.827, 11.3672)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- bean
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	doors = {
		{objHash = -1182160879, objHeading = 250.00004577637, objCoords = vector3(114.5629, -1039.888, 29.34832)},
		{objHash = -747011272, objHeading = 69.999992370605, objCoords = vector3(115.3757, -1037.655, 29.34832)}
 },
	lockpick = false,
	maxDistance = 2.5,
	authorizedJobs = { ['beanlegion']=0 },
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- bean 2
table.insert(Config.DoorList, {
	audioRemote = false,
	objHeading = 340.00003051758,
	maxDistance = 2.0,
	authorizedJobs = { ['beanlegion']=0 },
	objCoords = vector3(128.2134, -1029.455, 29.2618),
	locked = true,
	garage = false,
	lockpick = false,
	slides = false,
	fixText = false,
	objHash = 494354570,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Otto
table.insert(Config.DoorList, {
	fixText = false,
	garage = true,
	objHeading = 269.98028564453,
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['misfits']=0 },
	slides = 6.0,
	maxDistance = 6.0,
	objCoords = vector3(824.8448, -825.5403, 27.34478),
	objHash = 750116887,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- alcohol
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	garage = false,
	maxDistance = 2.0,
	audioRemote = false,
	authorizedJobs = { ['redcircle']=0 },
	objHash = -928479508,
	objHeading = 337.99996948242,
	fixText = false,
	lockpick = false,
	objCoords = vector3(4944.671, -5119.082, 2.444557),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	lockpick = false,
	slides = true,
	items = { ['key-cid'] = false},
	doors = {
		{objHash = -721607029, objHeading = 295.064453125, objCoords = vector3(-740.75, 484.4879, 108.7304)},
		{objHash = -533948079, objHeading = 115.06461334229, objCoords = vector3(-741.6517, 486.4066, 108.7294)}
 },
	audioRemote = false,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	lockpick = false,
	slides = true,
	items = { ['key-cid'] = false},
	doors = {
		{objHash = -721607029, objHeading = 25.064323425293, objCoords = vector3(-721.8962, 491.0047, 108.6374)},
		{objHash = -533948079, objHeading = 205.06428527832, objCoords = vector3(-723.8158, 490.1025, 108.6384)}
 },
	audioRemote = false,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	lockpick = false,
	slides = true,
	items = { ['key-cid'] = false},
	doors = {
		{objHash = -1939670839, objHeading = 25.064321517944, objCoords = vector3(-719.8082, 501.241, 109.6751)},
		{objHash = -1939670839, objHeading = 25.064321517944, objCoords = vector3(-716.4476, 502.8127, 109.6751)}
 },
	audioRemote = false,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(-732.8707, 500.6649, 109.905),
	slides = false,
	garage = false,
	objHash = 1051049560,
	fixText = false,
	locked = true,
	lockpick = false,
	items = { ['key-cid'] = false},
	objHeading = 205.06440734863,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['news']=0 },
	doors = {
		{objHash = -104698915, objHeading = 339.99862670898, objCoords = vector3(475.156, -104.5779, 63.30769)},
		{objHash = -350302570, objHeading = 159.9986114502, objCoords = vector3(472.9541, -103.7775, 63.30769)}
 },
	items = { ['key-cid'] = false},
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ottossmall
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	objHeading = 90.243560791016,
	maxDistance = 2.0,
	audioRemote = false,
	garage = false,
	objHash = 2142711795,
	lockpick = false,
	locked = true,
	objCoords = vector3(824.8727, -820.3558, 26.62302),
	authorizedJobs = { ['misfits']=0 },	
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ottossmall2
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	objHeading = 0.0,
	maxDistance = 2.0,
	audioRemote = false,
	garage = false,
	objHash = 2142711795,
	lockpick = false,
	locked = true,
	objCoords = vector3(835.075, -816.4485, 26.67217),
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- catcaffeedoorback1
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	objHeading = 89.999977111816,
	maxDistance = 2.0,
	audioRemote = false,
	garage = false,
	objHash = 2089009131,
	lockpick = false,
	locked = true,
	objCoords = vector3(-594.4123, -1049.769, 22.49713),
	authorizedJobs = { ['catcoffee']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Technicheski
table.insert(Config.DoorList, {
	objHash = -550347177,
	fixText = false,
	slides = true,
	lockpick = false,
	items = { ['tech-key'] = false},
	audioRemote = false,
	objCoords = vector3(-356.0905, -134.7714, 40.01295),
	objHeading = 249.99995422363,
	maxDistance = 6.0,
	garage = false,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- CJ door
table.insert(Config.DoorList, {
	items = { ['cj-key'] = false},
	locked = true,
	doors = {
		{objHash = -1497276645, objHeading = 49.999973297119, objCoords = vector3(132.5596, -1464.202, 29.91706)},
		{objHash = -1497276645, objHeading = 230.00001525879, objCoords = vector3(134.4969, -1461.921, 29.91706)}
 },
	slides = false,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- CJ back door
table.insert(Config.DoorList, {
	objHash = -2023754432,
	fixText = false,
	slides = false,
	lockpick = false,
	items = { ['cj-key'] = false},
	audioRemote = false,
	objCoords = vector3(144.0458, -1474.988, 29.51161),
	objHeading = 230.00001525879,
	maxDistance = 2.0,
	garage = false,
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- blaze it double door
table.insert(Config.DoorList, {
	items = { ['gsf-key'] = false},
	audioRemote = false,
	slides = false,
	lockpick = false,
	locked = true,
	doors = {
		{objHash = -742460265, objHeading = 51.0, objCoords = vector3(372.1755, -1256.03, 32.96777)},
		{objHash = 1107349801, objHeading = 51.0, objCoords = vector3(378.8466, -1247.792, 32.96777)}
 },
	maxDistance = 6,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- blaze it front door
table.insert(Config.DoorList, {
	objCoords = vector3(373.351, -1267.868, 32.74598),
	objHash = 418715782,
	garage = false,
	maxDistance = 2.0,
	items = { ['gsf-key'] = false},
	audioRemote = false,
	slides = false,
	lockpick = false,
	locked = true,
	fixText = false,
	objHeading = 50.308464050293,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- blaze it office
table.insert(Config.DoorList, {
	objCoords = vector3(360.6965, -1264.041, 32.91218),
	objHash = 345359835,
	garage = false,
	maxDistance = 2.0,
	items = { ['gsf-key'] = false},
	audioRemote = false,
	slides = false,
	lockpick = false,
	locked = true,
	fixText = false,
	objHeading = 50.308471679688,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- blaze it garage
table.insert(Config.DoorList, {
	objCoords = vector3(362.2495, -1253.155, 32.9098),
	objHash = 345359835,
	garage = false,
	maxDistance = 2.0,
	items = { ['gsf-key'] = false},
	audioRemote = false,
	slides = false,
	lockpick = false,
	locked = true,
	fixText = false,
	objHeading = 230.30847167969,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- side entrance - doorname: "v_ilev_ct_doorl"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = 1248599813,
	objHeading = 225.00004577637,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-116.5127, 6478.96, 31.78798),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- back entrance - doorname: "v_ilev_ct_doorl"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = 1248599813,
	objHeading = 135.00007629395,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-96.70866, 6474.057, 31.78798),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- side hallway - doorname: "gabz_paletobank_officedoors03"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = -56652918,
	objHeading = 225.00004577637,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-111.0427, 6475.328, 31.78798),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office1 - doorname: "gabz_paletobank_officedoors01b"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = 2110946875,
	objHeading = 225.00004577637,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-104.8371, 6463.774, 31.79335),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office2 - doorname: "gabz_paletobank_officedoors01b"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = 1754616769,
	objHeading = 45.000038146973,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-100.6217, 6467.989, 31.79335),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- main office - doorname: "gabz_paletobank_officedoors02"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = -368548260,
	objHeading = 45.000038146973,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-104.7057, 6473.918, 31.78798),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vault - doorname: "ch_prop_ch_vault_d_door_01a"
table.insert(Config.DoorList, {
	garage = false,
	locked = true,
	objHash = -2050208642,
	objHeading = 225.00010681152,
	fixText = false,
	authorizedJobs = { ['bank']=0 },
	slides = false,
	objCoords = vector3(-100.2419, 6464.549, 31.8846),
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- side entrance employee only - doorname "gabz_sm_pb_door_02"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 267980221,
	maxDistance = 2.0,
	objCoords = vector3(272.7905, 206.4805, 106.3822),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- side entrance 2nd floor - doorname "gabz_sm_pb_door_02"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 267980221,
	maxDistance = 2.0,
	objCoords = vector3(272.7905, 206.4805, 110.2805),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- roof entrance 2nd floor - doorname "gabz_sm_pb_door_02"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 267980221,
	maxDistance = 2.0,
	objCoords = vector3(277.5953, 223.5416, 110.2792),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- roof entrance 1st floor - doorname "gabz_sm_pb_door_02"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 267980221,
	maxDistance = 2.0,
	objCoords = vector3(277.5953, 223.5416, 106.3804),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- counter left - doorname "gabz_sm_pb_door_04"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = -2121568016,
	maxDistance = 2.0,
	objCoords = vector3(256.6068, 229.6896, 106.3702),
	objHeading = 70.000221252441,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- counter right - doorname "gabz_sm_pb_door_04"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = -2121568016,
	maxDistance = 2.0,
	objCoords = vector3(251.5199, 215.7132, 106.3702),
	objHeading = 250.00028991699,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- counter left 2 - doorname "gabz_sm_pb_door_04"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = -2121568016,
	maxDistance = 2.0,
	objCoords = vector3(270.2307, 221.2673, 106.3702),
	objHeading = 70.000221252441,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- counter right 2 - doorname "gabz_sm_pb_door_04"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = -2121568016,
	maxDistance = 2.0,
	objCoords = vector3(267.37, 213.408, 106.3702),
	objHeading = 250.00028991699,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 1 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(252.7898, 213.76, 106.3822),
	objHeading = 160.00025939941,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 2 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(262.1839, 210.3409, 106.3822),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 3 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(252.7898, 213.76, 110.2805),
	objHeading = 160.00025939941,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 4 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(262.1839, 210.3409, 110.2805),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 5 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(258.8165, 230.3764, 106.3822),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 6 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(268.2106, 226.9573, 106.3822),
	objHeading = 160.00025939941,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 7 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(258.8165, 230.3764, 110.2805),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- office 8 - doorname "gabz_sm_pb_door_01"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1721645826,
	maxDistance = 2.0,
	objCoords = vector3(268.2106, 226.9573, 110.2805),
	objHeading = 160.00022888184,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Main office left - doorname "gabz_sm_pb_door_03"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1109357065,
	maxDistance = 2.0,
	objCoords = vector3(273.1839, 216.8628, 110.2805),
	objHeading = 70.000213623047,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Main office right - doorname "gabz_sm_pb_door_03"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 1109357065,
	maxDistance = 2.0,
	objCoords = vector3(272.4721, 214.9073, 110.2805),
	objHeading = 250.00028991699,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement right - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(270.1032, 212.9229, 97.31798),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement left - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(272.6422, 219.8987, 97.31798),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement reception - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(265.7791, 225.8668, 97.31798),
	objHeading = 70.000221252441,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement middle right - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(256.4124, 229.2759, 97.31798),
	objHeading = 70.000221252441,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement middle left - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(251.6498, 216.1906, 97.31798),
	objHeading = 250.00028991699,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement left side vault - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(244.558, 216.8973, 97.31798),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Basement right side vault - doorname "gabz_sm_pb_door_08"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 409280169,
	maxDistance = 2.0,
	objCoords = vector3(250.5642, 233.3994, 97.31798),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vault door - doorname "v_ilev_bk_vaultdoor"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 961976194,
	maxDistance = 2.0,
	objCoords = vector3(234.9857, 228.0696, 97.72185),
	objHeading = 70.000213623047,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vault gold left - doorname "gabz_sm_pb_door_09"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 643152522,
	maxDistance = 2.0,
	objCoords = vector3(229.8905, 227.342, 97.32397),
	objHeading = 340.00024414062,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vault gold right - doorname "gabz_sm_pb_door_09"
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	objHash = 643152522,
	maxDistance = 2.0,
	objCoords = vector3(225.6463, 228.8868, 97.32397),
	objHeading = 160.00025939941,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bank']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- house door 1
table.insert(Config.DoorList, {
	doors = {
		{objHash = -349730013, objHeading = 31.6989402771, objCoords = vector3(-1488.126, 520.6134, 118.0117)},
		{objHash = -1918480350, objHeading = 26.41708946228, objCoords = vector3(-1483.332, 523.2794, 117.9981)}
 },
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	slides = false,
	items = { ['acejones-key'] = false},		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- house door 2
table.insert(Config.DoorList, {
	doors = {
		{objHash = -349730013, objHeading = 23.825971603394, objCoords = vector3(-1482.992, 523.4552, 117.9981)},
		{objHash = -1918480350, objHeading = 22.673013687134, objCoords = vector3(-1477.932, 525.6279, 117.9921)}
 },
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	slides = false,
	items = { ['acejones-key'] = false},		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- doktor garage
table.insert(Config.DoorList, {
	objHash = 2052512905,
	maxDistance = 6.0,
	fixText = false,
	items = { ['dok-key'] = false},
	objHeading = 140.20770263672,
	audioRemote = false,
	objCoords = vector3(-1980.549, -496.4539, 12.49603),
	lockpick = false,
	locked = true,
	slides = 6.0,
	garage = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- doktor back door
table.insert(Config.DoorList, {
	objHash = 308207762,
	maxDistance = 2.0,
	fixText = false,
	items = { ['dok-key'] = false},
	objHeading = 50.207668304443,
	audioRemote = false,
	objCoords = vector3(-1986.969, -511.6528, 12.329),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse garage
table.insert(Config.DoorList, {
	items = { ['mouse-key'] = false},
	doors = {
		{objHash = 587333565, objHeading = 39.999988555908, objCoords = vector3(-1461.143, -52.45336, 55.23286)},
		{objHash = 254433294, objHeading = 39.999988555908, objCoords = vector3(-1457.45, -49.35926, 55.2626)}
 },
	maxDistance = 6.0,
	lockpick = false,
	locked = true,
	slides = true,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door 1
table.insert(Config.DoorList, {
	objHash = -1017013428,
	maxDistance = 2.0,
	fixText = false,
	items = { ['mouse-key'] = false},
	objHeading = 220.00001525879,
	audioRemote = false,
	objCoords = vector3(-1468.499, -58.79865, 54.75858),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door 2
table.insert(Config.DoorList, {
	objHash = -1017013428,
	maxDistance = 2.0,
	fixText = false,
	items = { ['mouse-key'] = false},
	objHeading = 310.0,
	audioRemote = false,
	objCoords = vector3(-1473.412, -57.73341, 54.75858),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door 3
table.insert(Config.DoorList, {
	objHash = -1017013428,
	maxDistance = 2.0,
	fixText = false,
	items = { ['mouse-key'] = false},
	objHeading = 310.0,
	audioRemote = false,
	objCoords = vector3(-1472.461, -48.85187, 54.75858),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door 4
table.insert(Config.DoorList, {
	objHash = -1017013428,
	maxDistance = 2.0,
	fixText = false,
	items = { ['mouse-key'] = false},
	objHeading = 310.0,
	audioRemote = false,
	objCoords = vector3(-1483.029, -48.73466, 54.75858),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door 4
table.insert(Config.DoorList, {
	items = { ['mouse-key'] = false},
	doors = {
		{objHash = -1017013428, objHeading = 129.99996948242, objCoords = vector3(-1479.746, -41.42043, 56.99903)},
		{objHash = -1017013428, objHeading = 310.0, objCoords = vector3(-1481.161, -39.7336, 56.99903)}
 },
	maxDistance = 2.5,
	lockpick = false,
	locked = true,
	slides = false,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door idk
table.insert(Config.DoorList, {
	objHash = -1017013428,
	maxDistance = 2.0,
	fixText = false,
	items = { ['mouse-key'] = false},
	objHeading = 220.0,
	audioRemote = false,
	objCoords = vector3(-1485.9, -22.07615, 54.75699),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door idk2
table.insert(Config.DoorList, {
	objHash = -1017013428,
	maxDistance = 2.0,
	fixText = false,
	items = { ['mouse-key'] = false},
	objHeading = 129.99996948242,
	audioRemote = false,
	objCoords = vector3(-1465.059, -35.05593, 55.21259),
	lockpick = false,
	locked = true,
	slides = false,
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- mouse door idk2
table.insert(Config.DoorList, {
	items = { ['mouse-key'] = false},
	doors = {
		{objHash = -1918480350, objHeading = 251.23202514648, objCoords = vector3(-1454.664, -34.73074, 54.86434)},
		{objHash = -349730013, objHeading = 251.23202514648, objCoords = vector3(-1452.903, -29.55032, 54.86719)}
 },
	maxDistance = 2.5,
	lockpick = false,
	locked = true,
	slides = false,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- double door
table.insert(Config.DoorList, {
	items = { ['mouse-key'] = false},
	doors = {
		{objHash = -1918480350, objHeading = 9.7088384628296, objCoords = vector3(-1469.96, -13.79652, 54.89387)},
		{objHash = -349730013, objHeading = 9.7088384628296, objCoords = vector3(-1475.353, -14.71867, 54.89672)}
 },
	maxDistance = 2.5,
	lockpick = false,
	locked = true,
	slides = false,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- yachtdoor
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	garage = false,
	objHeading = 251.99032592773,
	fixText = false,
	slides = false,
	objHash = -2050208642,
	objCoords = vector3(-2069.251, -1018.408, 6.074322),
	audioRemote = false,
	lockpick = false,
	locked = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- bobcatlowrdoor
table.insert(Config.DoorList, {
	doors = {
		{objHash = 1438783233, objHeading = 264.99996948242, objCoords = vector3(904.9136, -2119.686, 31.38022)},
		{objHash = 1438783233, objHeading = 84.999885559082, objCoords = vector3(904.687, -2122.276, 31.38022)}
 },
	slides = false,
	maxDistance = 2.5,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
	locked = true,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- bobcatgarage
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	objCoords = vector3(889.9143, -2107.781, 30.23573),
	slides = true,
	locked = true,
	fixText = false,
	lockpick = false,
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['bobcat']=0 },
	objHeading = 174.99992370605,
	objHash = -1514454788,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- casinodoor3
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	locked = true,
	doors = {
		{objHash = -643593781, objHeading = 148.15661621094, objCoords = vector3(1002.308, 60.3161, 75.21008)},
		{objHash = -643593781, objHeading = 328.15661621094, objCoords = vector3(1000.608, 61.37116, 75.21008)}
 },
	items = { ['key_casino'] = false},
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- casinodoor15
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.5,
	locked = true,
	doors = {
		{objHash = 680601509, objHeading = 238.15664672852, objCoords = vector3(1018.692, 67.17648, 70.01008)},
		{objHash = 680601509, objHeading = 58.156597137452, objCoords = vector3(1017.638, 65.47772, 70.01008)}
 },
	items = { ['key_casino'] = false},
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- casinodoor5
table.insert(Config.DoorList, {
	lockpick = false,
	objHash = 401003935,
	garage = false,
	maxDistance = 2.0,
	locked = true,
	fixText = false,
	audioRemote = false,
	objHeading = 238.03240966796,
	objCoords = vector3(991.748, 25.03326, 71.61444),
	items = { ['key_casino'] = false},
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- casinodoor5
table.insert(Config.DoorList, {
	lockpick = false,
	objHash = 401003935,
	garage = false,
	maxDistance = 2.0,
	locked = true,
	fixText = false,
	audioRemote = false,
	objHeading = 238.03240966796,
	objCoords = vector3(991.748, 25.03326, 71.61444),
	items = { ['key_casino'] = false},
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- casinodoor6
table.insert(Config.DoorList, {
	lockpick = false,
	objHash = 1226684428,
	garage = false,
	maxDistance = 2.0,
	locked = true,
	fixText = false,
	audioRemote = false,
	objHeading = 148.15661621094,
	objCoords = vector3(1021.192, 20.66678, 71.6117),
	items = { ['key_casino'] = false},
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits1
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(800.3914, -824.3546, 26.48452),
	objHash = -147325430,
	garage = false,
	objHeading = 0.0,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits2
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(800.09, -827.1212, 26.48452),
	objHash = -147325430,
	garage = false,
	objHeading = 270.00012207032,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits3
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(830.62, -829.0284, 26.48238),
	objHash = -147325430,
	garage = false,
	objHeading = 90.0,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits4
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(823.7612, -828.9948, 26.48238),
	objHash = -147325430,
	garage = false,
	objHeading = 90.0,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits5
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(829.9662, -824.6748, 26.48238),
	objHash = -147325430,
	garage = false,
	objHeading = 180.00003051758,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits6
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(837.6532, -821.3134, 26.48238),
	objHash = -147325430,
	garage = false,
	objHeading = 270.00003051758,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits7
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(840.5322, -820.5624, 26.48238),
	objHash = 263193286,
	garage = false,
	objHeading = 0.0,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- misfits7
table.insert(Config.DoorList, {
	slides = false,
	fixText = false,
	audioRemote = false,
	locked = true,
	lockpick = false,
	maxDistance = 2.0,
	objCoords = vector3(840.5322, -820.5624, 26.48238),
	objHash = 263193286,
	garage = false,
	objHeading = 0.0,
	authorizedJobs = { ['misfits']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch1
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1390.666, 1131.117, 114.4808)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1390.666, 1133.317, 114.4808)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch2
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -52575179, objHeading = 179.99998474121, objCoords = vector3(1400.488, 1128.314, 114.4836)},
		{objHash = -1032171637, objHeading = 179.99998474121, objCoords = vector3(1402.688, 1128.314, 114.4836)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch3
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -52575179, objHeading = 179.99998474121, objCoords = vector3(1398.289, 1128.314, 114.4836)},
		{objHash = -1032171637, objHeading = 179.99998474121, objCoords = vector3(1400.489, 1128.314, 114.4836)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch4
table.insert(Config.DoorList, {
	fixText = false,
	lockpick = false,
	garage = false,
	maxDistance = 2.0,
	slides = false,
	locked = true,
	objHeading = 90.000022888184,
	objHash = -1170718279,
	authorizedJobs = { ['toshko']=0 },
	audioRemote = false,
	objCoords = vector3(1404.604, 1137.466, 114.5892),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch5
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1144.054, 114.4869)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1146.254, 114.4869)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch6
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1146.254, 114.4869)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1148.454, 114.4869)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch7
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -1032171637, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1148.454, 114.4869)},
		{objHash = -52575179, objHeading = 89.999961853027, objCoords = vector3(1409.292, 1150.654, 114.4869)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch8
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -52575179, objHeading = 269.98272705078, objCoords = vector3(1408.581, 1158.965, 114.4833)},
		{objHash = -1032171637, objHeading = 269.98272705078, objCoords = vector3(1408.581, 1161.165, 114.4833)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch9
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -52575179, objHeading = 269.98272705078, objCoords = vector3(1408.581, 1163.634, 114.4833)},
		{objHash = -1032171637, objHeading = 269.98272705078, objCoords = vector3(1408.581, 1165.834, 114.4833)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch10
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -1032171637, objHeading = 270.00003051758, objCoords = vector3(1390.478, 1163.438, 114.4832)},
		{objHash = -52575179, objHeading = 270.00003051758, objCoords = vector3(1390.478, 1161.238, 114.4832)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch11
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = -1032171637, objHeading = 270.00030517578, objCoords = vector3(1395.828, 1153.858, 114.4834)},
		{objHash = -52575179, objHeading = 270.00030517578, objCoords = vector3(1395.828, 1151.659, 114.4834)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ranch12
table.insert(Config.DoorList, {
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['toshko']=0 },
	doors = {
		{objHash = 1504256620, objHeading = 270.00003051758, objCoords = vector3(1395.92, 1142.904, 114.7902)},
		{objHash = 262671971, objHeading = 89.999961853027, objCoords = vector3(1395.92, 1140.705, 114.7902)}
 },
	maxDistance = 2.5,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ratgang1
table.insert(Config.DoorList, {
	items = { ['rat-key'] = false},
	maxDistance = 6.0,
	lockpick = false,
	doors = {
		{objHash = 1286535678, objHeading = 49.999996185303, objCoords = vector3(-1551.505, -291.727, 47.24379)},
		{objHash = 1286535678, objHeading = 229.99571228027, objCoords = vector3(-1561.054, -303.2914, 47.10868)}
 },
	audioRemote = false,
	locked = true,
	slides = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ratgang2
table.insert(Config.DoorList, {
	items = { ['rat-key'] = false},
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = -1156020871, objHeading = 75.129981994629, objCoords = vector3(-1592.066, -251.4989, 54.50538)},
		{objHash = -1156020871, objHeading = 255.13000488281, objCoords = vector3(-1591.195, -248.2271, 54.57217)}
 },
	audioRemote = false,
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ratgang3
table.insert(Config.DoorList, {
	items = { ['rat-key'] = false},
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = -1156020871, objHeading = 305.57000732422, objCoords = vector3(-1538.516, -232.3397, 53.30604)},
		{objHash = -1156020871, objHeading = 125.56999969482, objCoords = vector3(-1536.54, -235.1038, 53.17189)}
 },
	audioRemote = false,
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- heli door
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = 1190759826, objHeading = 320.05102539062, objCoords = vector3(336.433, -1432.266, 45.51992)},
		{objHash = 1816647734, objHeading = 320.05102539062, objCoords = vector3(334.8746, -1430.96, 45.51992)}
 },
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ward a 1
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = 1884112547, objHeading = 49.99998474121, objCoords = vector3(351.0932, -1405.288, 32.64838)},
		{objHash = 1884112547, objHeading = 230.00001525878, objCoords = vector3(352.7642, -1403.298, 32.64838)}
 },
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- reception
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	garage = false,
	slides = false,
	objHeading = 230.00001525878,
	lockpick = false,
	objCoords = vector3(361.1322, -1397.892, 32.6548),
	objHash = 2115166766,
	fixText = false,
	audioRemote = false,
	locked = true,
	authorizedJobs = { ['police']=0, ['ambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- ward a 2
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = 1884112547, objHeading = 49.99998474121, objCoords = vector3(359.7016, -1395.03, 32.64838)},
		{objHash = 1884112547, objHeading = 230.00001525878, objCoords = vector3(361.3728, -1393.038, 32.64838)}
 },
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- staff only
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	garage = false,
	slides = false,
	objHeading = 319.99993896484,
	lockpick = false,
	objCoords = vector3(354.9172, -1409.78, 32.6548),
	objHash = 2115166766,
	fixText = false,
	audioRemote = false,
	locked = true,
	authorizedJobs = { ['ambulance']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- intensive room
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = 1884112547, objHeading = 49.99998474121, objCoords = vector3(361.1468, -1404.976, 32.64838)},
		{objHash = 1884112547, objHeading = 230.00001525878, objCoords = vector3(362.8178, -1402.986, 32.64838)}
 },
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- intensive room 2
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	doors = {
		{objHash = 1884112547, objHeading = 230.00001525878, objCoords = vector3(373.0266, -1411.552, 32.64838)},
		{objHash = 1884112547, objHeading = 49.99998474121, objCoords = vector3(371.3556, -1413.544, 32.64838)}
 },
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- bloods
table.insert(Config.DoorList, {
	objHeading = 35.00001525879,
	objCoords = vector3(-1149.708, -1521.088, 10.78268),
	items = { ['key_bloods'] = false},
	maxDistance = 2.0,
	slides = false,
	locked = true,
	lockpick = false,
	garage = false,
	fixText = false,
	audioRemote = false,
	objHash = -607040053,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- outside little
table.insert(Config.DoorList, {
	objHeading = 265.0,
	objCoords = vector3(-848.9344, 179.3078, 70.0247),
	items = { ['key_michael'] = false},
	maxDistance = 2.0,
	slides = false,
	locked = true,
	lockpick = false,
	garage = false,
	fixText = false,
	audioRemote = false,
	objHash = -1568354151,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 291.00012207032,
	objCoords = vector3(-815.2816, 185.975, 72.99994),
	items = { ['key_michael'] = false},
	maxDistance = 6.0,
	slides = 6.0,
	locked = true,
	lockpick = false,
	garage = true,
	fixText = false,
	audioRemote = false,
	objHash = 30769481,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	items = { ['key_michael'] = false},
	doors = {
		{objHash = -1454760130, objHeading = 111.00005340576, objCoords = vector3(-793.3944, 180.5074, 73.04046)},
		{objHash = 1245831483, objHeading = 111.00005340576, objCoords = vector3(-794.1854, 182.568, 73.04046)}
 },
	maxDistance = 2.5,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	items = { ['key_michael'] = false},
	doors = {
		{objHash = -1454760130, objHeading = 21.000057220458, objCoords = vector3(-796.5656, 177.2214, 73.04046)},
		{objHash = 1245831483, objHeading = 21.000057220458, objCoords = vector3(-794.5052, 178.0124, 73.04046)}
 },
	maxDistance = 2.5,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHeading = 90.000518798828,
	objCoords = vector3(-844.051, 155.962, 66.03222),
	items = { ['key_michael'] = false},
	maxDistance = 10.0,
	slides = true,
	locked = true,
	lockpick = false,
	garage = false,
	fixText = false,
	audioRemote = false,
	objHash = -2125423493,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca1 - reception
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 69.865982055664,
	objCoords = vector3(309.6992, -280.303, 54.32193),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca1 - backdoor
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 249.86598205566,
	objCoords = vector3(308.6896, -281.5584, 54.32607),
	fixText = true,
	authorizedJobs = { ['police']=0 },
	bomb = 1,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca1 - vaultgate
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -1591004109,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 159.86595153809,
	objCoords = vector3(314.6438, -285.9401, 54.4749),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca2 - reception
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 270.00003051758,
	objCoords = vector3(1178.874, 2709.498, 38.24517),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca2 - backdoor
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 90.0,
	objCoords = vector3(1179.39, 2711.024, 38.24931),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca2 - vaultgate
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -1591004109,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 0.0,
	objCoords = vector3(1172.291, 2713.088, 38.39815),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca3 - reception
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 69.846183776855,
	objCoords = vector3(145.3686, -1041.936, 29.52521),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca3 - backdoor
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 249.84619140625,
	objCoords = vector3(144.3586, -1043.191, 29.52935),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca3 - vaultgate
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -1591004109,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 159.84617614746,
	objCoords = vector3(150.3113, -1047.575, 29.67819),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca4 - reception
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 116.86372375488,
	objCoords = vector3(-1214.849, -334.8487, 37.93817),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca4 - backdoor
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 296.86370849609,
	objCoords = vector3(-1214.62, -336.4432, 37.94231),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca4 - vaultgate
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -1591004109,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 206.86373901367,
	objCoords = vector3(-1207.354, -335.0772, 38.09115),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca5 - reception
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 70.859825134277,
	objCoords = vector3(-355.437, -51.19183, 49.19371),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca5 - backdoor
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 250.85984802246,
	objCoords = vector3(-356.4247, -52.46456, 49.19785),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca5 - vaultgate
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -1591004109,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 160.85981750488,
	objCoords = vector3(-350.3954, -56.74229, 49.34669),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca6 - reception
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 177.54205322266,
	objCoords = vector3(-2960.044, 479.0003, 15.85423),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- fleeca6 - backdoor
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -147325430,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 357.54205322266,
	objCoords = vector3(-2958.541, 478.4196, 15.85836),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})


-- fleeca6 - vaultgate
table.insert(Config.DoorList, {
	garage = false,
	lockpick = false,
	locked = true,
	objHash = -1591004109,
	audioRemote = false,
	maxDistance = 1.0,
	slides = false,
	objHeading = 267.54205322266,
	objCoords = vector3(-2956.174, 485.4231, 16.0072),
	fixText = true,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- front
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	items = { ['key_galaxy'] = false, ['vip_galaxy'] = false, ['platinum_galaxy'] = false },
	garage = false,
	slides = false,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	objCoords = vector3(355.6922, 301.0186, 104.2022),
	locked = true,
	objHeading = 165.6577911377,
	objHash = -1989765534,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	audioRemote = false,
	garage = false,
	locked = true,
	objHash = -1603817716,
	slides = true,
	items = { ['rat-key'] = false},
	objCoords = vector3(-1555.052, -295.4982, 47.30296),
	fixText = false,
	lockpick = false,
	objHeading = 46.999996185302,
	maxDistance = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- VIP
table.insert(Config.DoorList, {
	objHash = -1555108147,
	audioRemote = false,
	slides = false,
	lockpick = false,
	items = { ['vip_galaxy'] = false, ['platinum_galaxy'] = false },
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	locked = true,
	objCoords = vector3(377.781, 267.7672, 95.13994),
	objHeading = 74.592529296875,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- bar
table.insert(Config.DoorList, {
	objHash = 1695461688,
	audioRemote = false,
	slides = false,
	lockpick = false,
	items = { ['key_galaxy'] = false, ['vip_galaxy'] = false, ['platinum_galaxy'] = false },
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	locked = true,
	objCoords = vector3(354.45, 273.7086, 94.35608),
	objHeading = 74.592529296875,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vip 2
table.insert(Config.DoorList, {
	objHash = -1119680854,
	audioRemote = false,
	slides = false,
	lockpick = false,
	items = { ['vip_galaxy'] = false, ['platinum_galaxy'] = false },
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	locked = true,
	objCoords = vector3(393.944, 274.673, 95.1521),
	objHeading = 305.59243774414,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- library
table.insert(Config.DoorList, {
	objHash = -957944942,
	audioRemote = false,
	slides = false,
	lockpick = false,
	items = { ['platinum_galaxy'] = false },
	maxDistance = 2.0,
	garage = false,
	fixText = false,
	locked = true,
	objCoords = vector3(403.9532, 248.7954, 92.18534),
	objHeading = 164.0796508789,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- red room
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	lockpick = false,
	audioRemote = false,
	doors = {
		{objHash = 390840000, objHeading = 74.592529296875, objCoords = vector3(390.173, 254.8866, 92.2192)},
		{objHash = 390840000, objHeading = 254.59246826172, objCoords = vector3(390.8642, 257.3916, 92.2192)}
 },
	locked = true,
	items = { ['platinum_galaxy'] = false },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = 6.0,
	authorizedJobs = { ['fraudauto']=3 },
	objCoords = vector3(577.8744, -2804.136, 7.084586),
	fixText = false,
	lockpick = false,
	objHeading = 59.000011444092,
	garage = true,
	objHash = 531616259,
	audioRemote = false,
	maxDistance = 6.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['fraudauto']=3 },
	lockpick = false,
	doors = {
		{objHash = -1854394974, objHeading = 239.0, objCoords = vector3(562.6608, -2794.104, 6.44002)},
		{objHash = 2059796542, objHeading = 239.0, objCoords = vector3(563.549, -2792.628, 6.437998)}
 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	authorizedJobs = { ['fraudauto']=3 },
	objCoords = vector3(552.0214, -2787.322, 6.24807),
	fixText = false,
	lockpick = false,
	objHeading = 239.0,
	garage = false,
	objHash = -88942360,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	authorizedJobs = { ['fraudauto']=3 },
	objCoords = vector3(559.7366, -2789.144, 5.09887),
	fixText = false,
	lockpick = false,
	objHeading = 328.99996948242,
	garage = false,
	objHash = 664164832,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	slides = false,
	authorizedJobs = { ['fraudauto']=3 },
	objCoords = vector3(561.6404, -2785.972, 5.060212),
	fixText = false,
	lockpick = false,
	objHeading = 328.99996948242,
	garage = false,
	objHash = 664164832,
	audioRemote = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	audioRemote = false,
	objHeading = 65.00006866455,
	objHash = -1857663329,
	garage = true,
	objCoords = vector3(-62.37996, 352.7174, 113.2498),
	locked = true,
	fixText = false,
	slides = 6.0,
	lockpick = false,
	items = { ['key-fight'] = false },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ballas
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-ballas'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(0.2085236, -1823.302, 29.73544),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = -1052955611,
	objHeading = 50.084743499756,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Ballas 2
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-ballas'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(-1.873616, -1808.826, 25.5407),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = -1351120742,
	objHeading = 50.084743499756,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- GSF
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-gsf'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(-152.0244, -1622.648, 33.83776),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = 1381046002,
	objHeading = 232.98458862304,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vagos
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-vagos'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(334.6652, -1990.082, 24.35716),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = 1763005348,
	objHeading = 49.999992370606,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- vagos 2
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-vagos'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(324.7154, -1991.086, 24.36292),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = 2118614536,
	objHeading = 230.00003051758,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- aztecaz
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-aztecas'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(493.0756, -1541.83, 29.44704),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = 903896222,
	objHeading = 229.99401855468,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- aztecaz 2
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-aztecas'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(486.0136, -1530.394, 29.44704),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = 2103001488,
	objHeading = 229.99406433106,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- marabunta
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-marabunta'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(1250.222, -1583.802, 54.73964),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = -955445187,
	objHeading = 215.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Marabunta 2
table.insert(Config.DoorList, {
	locked = true,
	items = { ['key-marabunta'] = false },
	maxDistance = 4.0,
	fixText = false,
	garage = false,
	objCoords = vector3(1251.98, -1569.284, 58.93438),
	slides = false,
	audioRemote = false,
	lockpick = false,
	objHash = -658590816,
	objHeading = 215.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- burger front
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	slides = false,
	maxDistance = 2.5,
	lockpick = false,
	authorizedJobs = { ['burger']=0 },
	doors = {
		{objHash = -186646702, objHeading = 123.99998474122, objCoords = vector3(-1184.902, -883.2944, 14.24046)},
		{objHash = 1934064671, objHeading = 123.99998474122, objCoords = vector3(-1183.222, -885.7864, 14.24046)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- burger side
table.insert(Config.DoorList, {
	audioRemote = false,
	locked = true,
	slides = false,
	maxDistance = 2.5,
	lockpick = false,
	authorizedJobs = { ['burger']=0 },
	doors = {
		{objHash = 1934064671, objHeading = 213.99998474122, objCoords = vector3(-1196.542, -883.4892, 14.24046)},
		{objHash = -186646702, objHeading = 213.99998474122, objCoords = vector3(-1199.03, -885.1664, 14.24046)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- burger back
table.insert(Config.DoorList, {
	locked = true,
	maxDistance = 2.0,
	authorizedJobs = { ['burger']=0 },
	objHash = -1300743830,
	objCoords = vector3(-1199.356, -903.874, 14.07984),
	audioRemote = false,
	garage = false,
	fixText = false,
	lockpick = false,
	objHeading = 304.0,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- burger
table.insert(Config.DoorList, {
	locked = true,
	maxDistance = 2.0,
	authorizedJobs = { ['burger']=0 },
	objHash = -1448591934,
	objCoords = vector3(-1201.112, -892.9652, 14.24448),
	audioRemote = false,
	garage = false,
	fixText = false,
	lockpick = false,
	objHeading = 34.000019073486,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- burger
table.insert(Config.DoorList, {
	locked = true,
	maxDistance = 2.0,
	authorizedJobs = { ['burger']=0 },
	objHash = -1300743830,
	objCoords = vector3(-1179.22, -891.5004, 14.094),
	audioRemote = false,
	garage = false,
	fixText = false,
	lockpick = false,
	objHeading = 124.0,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Jamals
table.insert(Config.DoorList, {
	locked = true,
	objCoords = vector3(-230.6992, -1315.146, 31.45024),
	slides = false,
	maxDistance = 6.0,
	authorizedJobs = { ['jamals']=0 },
	lockpick = false,
	objHash = -147325430,
	audioRemote = false,
	fixText = false,
	objHeading = 270.00003051758,
	garage = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Jamals
table.insert(Config.DoorList, {
	locked = true,
	objCoords = vector3(-230.812, -1326.998, 30.2486),
	slides = false,
	maxDistance = 6.0,
	authorizedJobs = { ['jamals']=0 },
	lockpick = false,
	objHash = -48831039,
	audioRemote = false,
	fixText = false,
	objHeading = 270.0,
	garage = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Jamals
table.insert(Config.DoorList, {
	locked = true,
	objCoords = vector3(-215.7354, -1313.286, 30.45402),
	slides = false,
	maxDistance = 6.0,
	authorizedJobs = { ['jamals']=0 },
	lockpick = false,
	objHash = -1453834687,
	audioRemote = false,
	fixText = false,
	objHeading = 180.00004577636,
	garage = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Jamals
table.insert(Config.DoorList, {
	locked = true,
	objCoords = vector3(-207.7694, -1313.286, 30.45402),
	slides = false,
	maxDistance = 6.0,
	authorizedJobs = { ['jamals']=0 },
	lockpick = false,
	objHash = -1453834687,
	audioRemote = false,
	fixText = false,
	objHeading = 180.00004577636,
	garage = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- pitstop
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	objCoords = vector3(947.4182, -1572.45, 32.18716),
	lockpick = false,
	objHash = 308013701,
	audioRemote = false,
	slides = 6.0,
	fixText = false,
	locked = true,
	authorizedJobs = { ['jamals']=0 },
	garage = true,
	objHeading = 0.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- pitstop
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	objCoords = vector3(939.6362, -1572.45, 32.18716),
	lockpick = false,
	objHash = -441815588,
	audioRemote = false,
	slides = 6.0,
	fixText = false,
	locked = true,
	authorizedJobs = { ['jamals']=0 },
	garage = true,
	objHeading = 0.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- pitstop
table.insert(Config.DoorList, {
	maxDistance = 6.0,
	objCoords = vector3(924.21, -1560.256, 31.48226),
	lockpick = false,
	objHash = 70667834,
	audioRemote = false,
	slides = 6.0,
	fixText = false,
	locked = true,
	authorizedJobs = { ['jamals']=0 },
	garage = true,
	objHeading = 270.00003051758,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- Bahama
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	audioRemote = false,
	doors = {
		{objHash = -224738884, objHeading = 32.999996185302, objCoords = vector3(-1387.036, -586.6932, 30.44564)},
		{objHash = 666905606, objHeading = 213.00003051758, objCoords = vector3(-1389.136, -588.0576, 30.44564)}
 },
	locked = true,
	lockpick = false,
	slides = false,
	items = { ['key_galaxy'] = false },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	garage = false,
	items = { ['key_galaxy'] = false },
	objHash = -2102541881,
	lockpick = false,
	locked = true,
	objCoords = vector3(-1378.586, -621.3178, 30.44564),
	slides = false,
	objHeading = 122.99997711182,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	garage = false,
	items = { ['key_galaxy'] = false },
	objHash = -2102541881,
	lockpick = false,
	locked = true,
	objCoords = vector3(-1377.678, -624.8816, 30.44564),
	slides = false,
	objHeading = 32.999996185302,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})