Framework = exports['no-core']:GetCoreObject()

local peds = {
    {name = "RatBoy", model = 'RatBoy', description = "Малкия гаден гризач"},
    {name = "TOSHKO's Ped", model = 'ig_tommyt', description = "На Тошко педа"},
    {name = "Francis", model = 'ig_francis', description = "Малко джудже хобит"},
    {name = "Дебел Полицай", model = 's_m_y_cop_01', description = "Дебелия полицай на Andrew"},
    {name = "Друг дебел полицай", model = 'walter', description = "Другия дебел полицай"},
    {name = "Ленивец", model = 'a_c_sloth', description = "Просто ленивец"},
    {name = "Racoon", model = 'A_C_Racoon_01', description = "Миеща мечка"},
    {name = "Doge", model = 'a_c_husky_np', description = "Husky we"},
    {name = "Doge2", model = 'A_C_Pit_NP', description = "pit"},
    {name = "Doge3", model = 'A_C_Retriever_np', description = "Retriver we"},
    {name = "Doge4", model = 'a_c_shepherd_np', description = "Shpred we"},
    {name = "Jaba", model = 'Nc_Pepe_CS', description = "Jaba jaburana"},
    -- {name = "", model = '', description = ""},
}

RegisterNetEvent('nocore-peds:openMenu', function()
  local sendMenu = {}
  sendMenu[#sendMenu+1] = {
      id = 1,
      header = "Ped Menu",
      isMenuHeader = true,
  }
  for i = 1, #peds do
    sendMenu[#sendMenu+1] = {
        id = i,
        header = peds[i].name,
        txt = peds[i].description,
        params = {
            event = "nocore-peds:setModel",
            args = peds[i].model
        }
    }
  end
  sendMenu[#sendMenu+1] = {
    id = #sendMenu+1,
    header = "Върни се в стария си вид",
    txt = "Ако си използвал магазин и не можеш да се върнеш пиши на Тошко",
    params = { 
        event = "raid_clothes:LoadYourClothes",
        args = {}
        }
    }
  sendMenu[#sendMenu+1] = {
      id = #sendMenu+1,
      header = "Затвори",
      txt = "",
      params = { 
          event = "fakeevnettt",
          args = {}
      }
  }
  exports['nocore-context']:openMenu(sendMenu)
end)

AddEventHandler('nocore-peds:setModel', function(model)
  local modelHash = model
  if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end
  SetPlayerModel(PlayerId(), modelHash)  
end)