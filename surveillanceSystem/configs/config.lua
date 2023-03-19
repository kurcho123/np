--[[
EVENTS YOU CAN USE FREELY:

    CLIENT EVENTS:
    "cameraSystem:client:OpenCamera", <camera id> --Open camera. Make sure you send also the camera id you want.
    "cameraSystem:client:DisableAllCameras"

    SERVER EVENTS:
    "cameraSystem:server:OpenCamera", source, <camera id> --Opens camera and checks for job also.
    "cameraSystem:server:updateState", <camera id>, <state> --Sets the current state of the camera. Online or not.
]]

Config = {}

--SERVERSIDE STUFF--
Config.CheckVersion =  true -- Enable/Disable version checker. Prints on serverside console.
--SERVERSIDE STUFF--


--SIMPLE STUFF--
Config.UseCommand = true
Config.CommandName = "cam"
Config.UsingNoCore = true
--SIMPLE STUFF--


--JOBS CHECKER--
Config.UsingJobs = true --Set to true if you want only JOBS to access the cameras.
Config.WhitelistedJobs = { --Place all the jobs you want to have access here.
    "police",
    "ambulance"
}
--JOBS CHECKER--


--ENHANCEMENTS--
Config.HideMinimap = true --Hides the minimap while being inside the camera. IF YOU WANT TO DISABLE HUD GO TO client_customise_me at function HideMinimap() and add your code there.
Config.RecordFootage = false --Automatically records GTA V clips while being in the camera. Saves them as regular gta clips under C:\Users\<USERNAME>\Documents\Rockstar Games\GTA V\videos\clips.
--ENHANCEMENTS--


--CAMERA SETTINGS--
Config.RotateUp = 32
Config.RotateDown = 8
Config.RotateLeft = 34
Config.RotateRight = 9
Config.Disconnect = 177
--CAMERA SETTINGS--

--Instructional Buttons--
Config.CameraUpDown = 8
Config.CameraUpDownText = "Turn Up/Down" 
Config.CameraRightLeft = 9
Config.CameraRightLeftText = "Turn Left/Right"
Config.CameraDisconnect = 194
Config.CameraEnabledDisconnectText = "Disconnect"
Config.CameraDisabledDisconnectText = "CAMERA CAN NOT TURN - Disconnect"
--Instructional Buttons--

--HACKING SETTINGS--
Config.EnableHacking = true --Enable/disable hacking
Config.HackDistance = 1.00 --Hack distance is for the 3d text. Keep it 1, it's good.
Config.HackButton = 38 --DEFAULT IS 38 (E BUTTON)
Config.AbortHackButton = 73  --DEFAULT IS 73 (X BUTTON)
Config.HackChance = 75 --How much chance to succeed hacking attempt ONLY USE FROM 0-100%.
Config.HackMessage = "[~g~E~w~] - Attempt Hacking"
Config.RestoreMessage = "[~g~E~w~] - Restore Cameras"
Config.AbortMessage = "[~g~X~w~] - Abort"
Config.HackStage1 = "Booting up the rig"
Config.HackStage2 = "Attempting to sign in"
Config.HackStage2Fail = "Shit mate, the computer is locked"
Config.HackStage3 = "Booting surveillance-system.exe"
Config.HackStage4 = "Shutting down camera systems"
Config.ReactivateComputerHacking = "Re-activating camera systems"
Config.HackAborted = "Fuck man, hacking aborted"
Config.RestoringMessage = "Restoring cameras"
--HACKING SETTINGS--

--SECURITY CAMERA LOCATIONS--
Config.SecurityCameras = {

    --[[CAMERA TYPES:

    1)brown --Clear to see, has a brown colour.
    2)low --Very low quality of feed.
    3)medium --Meidum quality of feed.
    4)blackandwhite --Decent quality but black and white.
    5)blurred --Looks like this is kind of blurred in the sides. I like it.
    6)offline --Offline, it is the one that has snow.

    canRotate is if the camera should be rotate-able.
    isOnline should be set to true, pretty much explains by itself.

    ---]]

    cameras = {
        [1] = {label = "Pacific Bank - CAMERA ID: #1", x = 257.45, y = 210.07, z = 109.08, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true, isOnline = true, quality = "blurred"},
        [2] = {label = "Pacific Bank - CAMERA ID: #2", x = 232.86, y = 221.46, z = 107.83, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true, isOnline = true, quality = "blurred"},
        [3] = {label = "Pacific Bank - CAMERA ID: #3", x = 252.27, y = 225.52, z = 103.99, r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = true, isOnline = true, quality = "blurred"},
        [4] = {label = "Limited Ltd Grove St. - CAMERA ID: #1", x = -53.1433, y = -1746.714, z = 31.546, r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true, quality = "medium"},
        [5] = {label = "Rob's Liqour Prosperity St. - CAMERA ID: #1", x = -1482.9, y = -380.463, z = 42.363, r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true, quality = "low"},
        [6] = {label = "Rob's Liqour San Andreas Ave. - CAMERA ID: #1", x = -1224.874, y = -911.094, z = 14.401, r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true, quality = "low"},
        [7] = {label = "Limited Ltd Ginger St. - CAMERA ID: #1", x = -718.153, y = -909.211, z = 21.49, r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true, quality = "medium"},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. - CAMERA ID: #1", x = 23.885, y = -1342.441, z = 31.672, r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true, quality = "medium"},
        [9] = {label = "Rob's Liqour El Rancho Blvd. - CAMERA ID: #1", x = 1133.024, y = -978.712, z = 48.515, r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true, quality = "low"},
        [10] = {label = "Limited Ltd West Mirror Drive - CAMERA ID: #1", x = 1151.93, y = -320.389, z = 71.33, r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true, quality = "medium"},
        [11] = {label = "24/7 Supermarkt Clinton Ave - CAMERA ID: #1", x = 383.402, y = 328.915, z = 105.541, r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [12] = {label = "Limited Ltd Banham Canyon Dr - CAMERA ID: #1", x = -1832.057, y = 789.389, z = 140.436, r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true, quality = "medium"},
        [13] = {label = "Rob's Liqour Great Ocean Hwy - CAMERA ID: #1", x = -2966.15, y = 387.067, z = 17.393, r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true, quality = "low"},
        [14] = {label = "24/7 Supermarkt Ineseno Road - CAMERA ID: #1", x = -3046.749, y = 592.491, z = 9.808, r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. - CAMERA ID: #1", x = -3246.489, y = 1010.408, z = 14.705, r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [16] = {label = "24/7 Supermarkt Route 68 - CAMERA ID: #1", x = 539.773, y = 2664.904, z = 44.056, r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [17] = {label = "Rob's Liqour Route 68 - CAMERA ID: #1", x = 1169.855, y = 2711.493, z = 40.432, r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true, quality = "low"},
        [18] = {label = "24/7 Supermarkt Senora Fwy - CAMERA ID: #1", x = 2673.579, y = 3281.265, z = 57.541, r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. - CAMERA ID: #1", x = 1966.24, y = 3749.545, z = 34.143, r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [20] = {label = "24/7 Supermarkt Senora Fwy - CAMERA ID: #2", x = 1729.522, y = 6419.87, z = 37.262, r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [21] = {label = "Fleeca Bank Hawick Ave - CAMERA ID: #1", x = 309.341, y = -281.439, z = 55.88, r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true, quality = "blurred"},
        [22] = {label = "Fleeca Bank Legion Square - CAMERA ID: #1", x = 144.871, y = -1043.044, z = 31.017, r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true, quality = "blurred"},
        [23] = {label = "Fleeca Bank Hawick Ave - CAMERA ID: #2", x = -355.7643, y = -52.506, z = 50.746, r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true, quality = "blurred"},
        [24] = {label = "Fleeca Bank Del Perro Blvd - CAMERA ID: #1", x = -1214.226, y = -335.86, z = 39.515, r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true, quality = "blurred"},
        [25] = {label = "Fleeca Bank Great Ocean Hwy - CAMERA ID: #1", x = -2958.885, y = 478.983, z = 17.406, r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true, quality = "blurred"},
        [26] = {label = "Paleto Bank - CAMERA ID: #1", x = -102.939, y = 6467.668, z = 33.424, r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = true, isOnline = true, quality = "brown"},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", x = -163.75, y = 6323.45, z = 33.424, r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [28] = {label = "Don's Country Store Paleto Bay - CAMERA ID: #1", x = 166.42, y = 6634.4, z = 33.69, r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [29] = {label = "Don's Country Store Paleto Bay - CAMERA ID: #2", x = 163.74, y = 6644.34, z = 33.69, r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [30] = {label = "Don's Country Store Paleto Bay - CAMERA ID: #3", x = 169.54, y = 6640.89, z = 33.69, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true, quality = "blackandwhite"},
        [31] = {label = "Vangelico Jewellery - CAMERA ID: #1", x = -627.54, y = -239.74, z = 40.33, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true, quality = "brown"},
        [32] = {label = "Vangelico Jewellery - CAMERA ID: #2", x = -627.51, y = -229.51, z = 40.24, r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true, quality = "brown"},
        [33] = {label = "Vangelico Jewellery - CAMERA ID: #3", x = -620.3, y = -224.31, z = 40.23, r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true, quality = "brown"},
        [34] = {label = "Vangelico Jewellery - CAMERA ID: #4", x = -622.57, y = -236.3, z = 40.31, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true, quality = "brown"},
        [35] = {label = "Digita Den - CAMERA ID: #1", x = 1159.9005, y = -487.672, z = 78.399896, r = {x = -35.0, y = 0.0, z = 55.78}, canRotate = true, isOnline = true, quality = "blurred"},
        [36] = {label = "Scrap - CAMERA ID: #1", x = 1894.94, y = 4918.06, z = 53.15, r = {x = -25.0, y = 0.0, z = 280.0}, canRotate = true, isOnline = true, quality = "blurred"},
        [37] = {label = "West Eclipse Boulevard - CAMERA ID: #1", x = -2066.11, y = -334.39, z = 15.0, r = {x = -25.0, y = 0.0, z = 46.59}, canRotate = true, isOnline = true, quality = "blurred"},
        [38] = {label = "Na Albaneca Camerata - ID: #1", x = 822.263, y = -778.305, z = 28.308, r = {x = -25.0, y = 0.0, z = 117.33}, canRotate = true, isOnline = true, quality = "blurred"},
        [39] = {label = "Na Albaneca Camerata - ID: #2", x = 812.015, y = -773.854, z = 27.695, r = {x = -25.0, y = 0.0, z = 242.17}, canRotate = true, isOnline = true, quality = "blurred"},
    },
}
--SECURITY CAMERA LOCATIONS--


--SECURITY CAMERA HACK LOCATIONS--
Config.HackLocations = {
        --[[
            IF YOU WANT TO ADD MULTIPLE CAMERAS FOR ONE PLACE THEN at cameras = add a string value. Then simply add the string at Config.MultipleCameraHackingLocations below + the cameras you want to control from 
            that one location.

            3 MINIGAMES:
            computer - Computer hacking. Does not have any dependencies.
            mhacking - MHacking with a cellphone. Needs mhacking resource. You may download it free here: https://github.com/GHMatti/FiveM-Scripts
            thermite: Thermite is a script made by me. You do need to purchase it from tebex. If you do have another resource for thermite then feel free to write the code at client_customise_me.lua.

        --]]

        [1] = {label = "Pacific Bank", cameras = "pacific", location = {x = 258.33, y = 274.91, z=105.63}, type = "thermite"},
        [4] = {label = "Limited Ltd Grove St.", cameras = 4, location = {x = -44.52, y = -1749.18, z=29.42, h = 50.0}, type = "computer"},
        [5] = {label = "Rob's Liqour Prosperity St.", cameras = 5, location = {x = -1488.2, y = -376.86, z = 40.18,h = 99.62}, type = "computer"},
        [6] = {label = "Rob's Liqour San Andreas Ave.", cameras = 6, location = {x = -1220.489, y = -906.57, z = 12.43,h = 345.46}, type = "computer"},
        [7] = {label = "Limited Ltd Ginger St.", cameras = 7, location = {x = -710.25, y = -905.43, z = 19.22, h = 83.32 }, type = "computer"},
        [8] = {label = "24/7 Supermarkt Innocence Blvd.",cameras = 8, location = {x = 28.936937, y = -1339.688, z = 29.496955, h = 210.46882}, type = "computer"},
        [9] = {label = "Rob's Liqour El Rancho Blvd.", cameras = 9, location = {x = 1135.00, y = -984.52, z = 46.57, h = 227.24}, type = "computer"},
        [10] = {label = "Limited Ltd West Mirror Drive", cameras = 10, location = {x = 1159.37, y = -315.27, z = 69.21, h= 94.39}, type = "computer"},
        [11] = {label = "24/7 Supermarkt Clinton Ave", cameras = 11, location = {x = 378.78262, y = 332.66107, z = 103.56631, h = 199.95507}, type = "computer"},
        [12] = {label = "Limited Ltd Banham Canyon Dr", cameras = 12, location = {x = -1828.54, y = 797.75, z = 138.18, h= 136.75}, type = "computer"},
        [13] = {label = "Rob's Liqour Great Ocean Hwy",cameras = 13, location = {x = -2966.86, y = 393.04, z = 15.04, h= 211.42}, type = "computer"},
        [14] = {label = "24/7 Supermarkt Ineseno Road.",cameras = 14, location = {x = -3047.579, y = 586.47399, z = 7.9088587, h = 320.48904}, type = "computer"},
        [15] = {label = "24/7 Supermarkt Barbareno Rd.",cameras = 15, location = {x = -3249.439, y = 1005.1132, z = 12.830638, h = 302.74877}, type = "computer"},
        [16] = {label = "24/7 Supermarkt Route 68", cameras = 16, location = {x = 545.57293, y = 2663.2929, z = 42.156429, h = 46.908744}, type = "computer"},
        [17] = {label = "Rob's Liqour Route 68", cameras = 17, location = {x = 1163.72, y = 2710.34, z = 38.16, h = 167.30}, type = "computer"},
        [18] = {label = "24/7 Supermarkt Senora Fwy", cameras = 18, location = {x = 2673.6481, y = 3287.0473, z = 55.241077, h = 271.82226}, type = "computer"},
        [22] = {label = "Fleeca Bank Legion Square", cameras = 22, location={x = 135.60, y = -1046.48, z = 29.65, h=160.00}, type = "mhacking"},
}


Config.MultipleCameraHackingLocations = {
    --You may add whatever the fuck you want here. Really. This resource was made with a million loops. So feel free to make up your own Camera locations above and embed them here.   
    ["pacific"] = {1,2,3},
    ["paleto"] = {26},
    ["vangelico"] = {31,32,33,34},    
}
