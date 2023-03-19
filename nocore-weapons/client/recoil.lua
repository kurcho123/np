Citizen.CreateThread( function()
	while true do 
		 if IsPedArmed(PlayerPedId(), 6) then
		 	Citizen.Wait(1)
		 else
		 	Citizen.Wait(1500)
		 end  
	    if IsPedShooting(PlayerPedId()) then
	    	local ply = PlayerPedId()
	    	local GamePlayCam = GetFollowPedCamViewMode()
			local WeaponSilenced = IsPedCurrentWeaponSilenced(ply)
	    	local Vehicled = IsPedInAnyVehicle(ply, false)
	    	local MovementSpeed = math.ceil(GetEntitySpeed(ply))
	    	if MovementSpeed > 69 then
	    		MovementSpeed = 69
	    	end
	        local _, wep = GetCurrentPedWeapon(ply)
	        local p = GetGameplayCamRelativePitch()
	        local cameraDistance = #(GetGameplayCamCoord() - GetEntityCoords(ply))
	        local recoil = math.random(130,180+(math.ceil(MovementSpeed*1.5)))/100
			--print(recoil)
          	if cameraDistance < 5.3 then
          		cameraDistance = 1.5
          	else
          		if cameraDistance < 8.0 then
          			cameraDistance = 4.0
          		else
          			cameraDistance = 7.0
          		end
          	end
	        if Vehicled then
	        	recoil = recoil + (recoil * cameraDistance)
	        else
	        	recoil = recoil * Config.WeaponsList[wep]['Recoil']
	        end
	        if GamePlayCam == 4 then
	        	recoil = recoil * 0.5
	        end
	        if WeaponSilenced then
	        	recoil = recoil * 0.6
	        end
	        local rightleft = math.random(Config.WeaponsList[wep]['Recoil2'])
	        local h = GetGameplayCamRelativeHeading()
	        local hf = math.random(10,80 + MovementSpeed)/ 100
	        if Vehicled then
	        	hf = hf * 2.0
	        end
	        if rightleft == 1 then
	        	SetGameplayCamRelativeHeading(h+hf)
	        elseif rightleft == 2 then
	        	SetGameplayCamRelativeHeading(h-hf)
	        end 
	        local set = p+recoil
			--print(recoil, rightleft)
	       	SetGameplayCamRelativePitch(set, 0.8)    	       	
	    end
	end
end)