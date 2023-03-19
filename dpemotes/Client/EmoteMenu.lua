TriggerServerEvent("dp:CheckVersion")

rightPosition = {x = 1450, y = 100}
leftPosition = {x = 0, y = 100}
menuPosition = {x = 0, y = 200}

if Config.MenuPosition then
    if Config.MenuPosition == "left" then
        menuPosition = leftPosition
    elseif Config.MenuPosition == "right" then
        menuPosition = rightPosition
    end
end

local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head')
local Object = CreateDui(Config.MenuImage, 512, 128)
_G.Object = Object
local TextureThing = GetDuiHandle(Object)
local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head', TextureThing)
Menuthing = "Custom_Menu_Head"

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "", menuPosition["x"], menuPosition["y"], Menuthing, Menuthing)
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
local menuOpend = false

mainMenu.OnMenuClosed = function()
    menuOpend = false
end

local EmoteTable = {}
local FavEmoteTable = {}
local KeyEmoteTable = {}
local SmokeTable = {}
local PhoneTable = {}
local IdleTable = {}
local JobsTable = {}
local ReactionTable = {}
local DrinkTable = {}
local ClubTable = {}
local OtherTable = {}
local SitTable = {}
local DanceTable = {}
local HiDanTable = {}
local MiDanTable = {}
local LiDanTable = {}
local SideDanTable = {}
local LiDanfTable = {}
local HiDanfTable = {}
local MiDanfTable = {}
local PropDanTable = {}
local CrazyDanTable = {}
local PropETable = {}
local WalkTable = {}
local FaceTable = {}
local ShareTable = {}
local FavoriteEmote = ""

lang = Config.MenuLanguage

function AddEmoteMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['emotes'], "", "", Menuthing, Menuthing)
    local dancemenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['danceemotes'], "", "", Menuthing, Menuthing)
    local hidanmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['hidanemotes'], "", "", Menuthing, Menuthing)
    local midanmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['midanemotes'], "", "", Menuthing, Menuthing)
    local lidanmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['lidanemotes'], "", "", Menuthing, Menuthing)
    local lidanfmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['lidanfemotes'], "", "", Menuthing, Menuthing)
    local hidanfmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['hidanfemotes'], "", "", Menuthing, Menuthing)
    local midanfmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['midanfemotes'], "", "", Menuthing, Menuthing)
    local crazydanmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['crazydanemotes'], "", "", Menuthing, Menuthing)
    local propdanmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['propdanemotes'], "", "", Menuthing, Menuthing)
    local sidedanmenu = _menuPool:AddSubMenu(dancemenu, Config.Languages[lang]['sidedanemotes'], "", "", Menuthing, Menuthing)
    local smokemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['smokeemotes'], "", "", Menuthing, Menuthing)
    local idlemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['idleemotes'], "", "", Menuthing, Menuthing)
    local sitmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['sitemotes'], "", "", Menuthing, Menuthing)
    local jobsmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['jobsemotes'], "", "", Menuthing, Menuthing)
    local reactionmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['reactionemotes'], "", "", Menuthing, Menuthing)
    local phonemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['phoneemotes'], "", "", Menuthing, Menuthing)
    local drinkmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['drinkemotes'], "", "", Menuthing, Menuthing)
    local othermenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['otheremotes'], "", "", Menuthing, Menuthing)
    local clubmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['clubemotes'], "", "", Menuthing, Menuthing)
    local propmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['propemotes'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    
    if Config.SharedEmotesEnabled then
        sharemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['shareemotes'], Config.Languages[lang]['shareemotesinfo'], "", Menuthing, Menuthing)
        table.insert(ShareTable, 'none')
        table.insert(EmoteTable, Config.Languages[lang]['shareemotes'])
    end
    
    
    for a, b in pairsByKeys(DP.Emotes) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        submenu:AddItem(emoteitem)
        table.insert(EmoteTable, a)
    end
    
    for a, b in pairsByKeys(DP.Smoke) do
        x, y, z = table.unpack(b)
        smokeitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        smokemenu:AddItem(smokeitem)
        table.insert(SmokeTable, a)
    end
    
    for a, b in pairsByKeys(DP.Sit) do
        x, y, z = table.unpack(b)
        sititem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        sitmenu:AddItem(sititem)
        table.insert(SitTable, a)
    end
    
    for a, b in pairsByKeys(DP.Jobs) do
        x, y, z = table.unpack(b)
        jobsitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        jobsmenu:AddItem(jobsitem)
        table.insert(JobsTable, a)
    end
    
    for a, b in pairsByKeys(DP.Other) do
        x, y, z = table.unpack(b)
        otheritem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        othermenu:AddItem(otheritem)
        table.insert(OtherTable, a)
    end
    
    for a, b in pairsByKeys(DP.Idle) do
        x, y, z = table.unpack(b)
        idleitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        idlemenu:AddItem(idleitem)
        table.insert(IdleTable, a)
    end
    
    for a, b in pairsByKeys(DP.Reaction) do
        x, y, z = table.unpack(b)
        reactionitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        reactionmenu:AddItem(reactionitem)
        table.insert(ReactionTable, a)
    end
    
    for a, b in pairsByKeys(DP.Phone) do
        x, y, z = table.unpack(b)
        phoneitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        phonemenu:AddItem(phoneitem)
        table.insert(PhoneTable, a)
    end
    
    for a, b in pairsByKeys(DP.Drink) do
        x, y, z = table.unpack(b)
        drinkitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        drinkmenu:AddItem(drinkitem)
        table.insert(DrinkTable, a)
    end
    
    for a, b in pairsByKeys(DP.Club) do
        x, y, z = table.unpack(b)
        clubitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        clubmenu:AddItem(clubitem)
        table.insert(ClubTable, a)
    end
    
    for a, b in pairsByKeys(DP.HiDan) do
        x, y, z = table.unpack(b)
        hidanitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        hidanmenu:AddItem(hidanitem)
        table.insert(HiDanTable, a)
    end
    
    for a, b in pairsByKeys(DP.MiDan) do
        x, y, z = table.unpack(b)
        midanitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        midanmenu:AddItem(midanitem)
        table.insert(MiDanTable, a)
    end
    
    for a, b in pairsByKeys(DP.LiDan) do
        x, y, z = table.unpack(b)
        lidanitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        lidanmenu:AddItem(lidanitem)
        table.insert(LiDanTable, a)
    end
    
    for a, b in pairsByKeys(DP.CrazyDan) do
        x, y, z = table.unpack(b)
        crazydanitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        crazydanmenu:AddItem(crazydanitem)
        table.insert(CrazyDanTable, a)
    end

    for a, b in pairsByKeys(DP.PropDan) do
        x, y, z = table.unpack(b)
        propdanitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        propdanmenu:AddItem(propdanitem)
        table.insert(PropDanTable, a)
    end
    
    for a, b in pairsByKeys(DP.SideDan) do
        x, y, z = table.unpack(b)
        sidedanitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        sidedanmenu:AddItem(sidedanitem)
        table.insert(SideDanTable, a)
    end
    
    for a, b in pairsByKeys(DP.LiDanf) do
        x, y, z = table.unpack(b)
        lidanfitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        lidanfmenu:AddItem(lidanfitem)
        table.insert(LiDanfTable, a)
    end
    
    for a, b in pairsByKeys(DP.HiDanf) do
        x, y, z = table.unpack(b)
        hidanfitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        hidanfmenu:AddItem(hidanfitem)
        table.insert(HiDanfTable, a)
    end
    
    for a, b in pairsByKeys(DP.MiDanf) do
        x, y, z = table.unpack(b)
        midanfitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        midanfmenu:AddItem(midanfitem)
        table.insert(MiDanfTable, a)
    end
    
    for a, b in pairsByKeys(DP.Dances) do
        x, y, z = table.unpack(b)
        danceitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        sharedanceitem = NativeUI.CreateItem(z, "")
        dancemenu:AddItem(danceitem)
        table.insert(DanceTable, a)
    end
    
    if Config.SharedEmotesEnabled then
        for a, b in pairsByKeys(DP.Shared) do
            x, y, z, otheremotename = table.unpack(b)
            if otheremotename == nil then
                shareitem = NativeUI.CreateItem(z, "/nearby (~g~" .. a .. "~w~)")
            else
                shareitem = NativeUI.CreateItem(z, "/nearby (~g~" .. a .. "~w~) " .. Config.Languages[lang]['makenearby'] .. " (~y~" .. otheremotename .. "~w~)")
            end
            sharemenu:AddItem(shareitem)
            table.insert(ShareTable, a)
        end
    end
    
    for a, b in pairsByKeys(DP.PropEmotes) do
        x, y, z = table.unpack(b)
        propitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        propmenu:AddItem(propitem)
        table.insert(PropETable, a)
    end
    
    dancemenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(DanceTable[index], "dances")
    end
    
    if Config.SharedEmotesEnabled then
        sharemenu.OnItemSelect = function(sender, item, index)
            if ShareTable[index+1] ~= 'none' then
                target, distance = GetClosestPlayer()
                if (distance ~= -1 and distance < 3) then
                    _, _, rename = table.unpack(DP.Shared[ShareTable[index+1]])
                    TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), ShareTable[index+1])
                    SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
                else
                    SimpleNotify(Config.Languages[lang]['nobodyclose'])
                end
            end
        end
    end
    
    propmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(PropETable[index], "props")
    end
    
    smokemenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(SmokeTable[index], "smoke")
    end
    
    hidanmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(HiDanTable[index], "hidan")
    end
    
    midanmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(MiDanTable[index], "midan")
    end
    
    crazydanmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(CrazyDanTable[index], "crazydan")
    end
    
    propdanmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(PropDanTable[index], "propdan")
    end

    sidedanmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(SideDanTable[index], "sidedan")
    end
    
    lidanmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(LiDanTable[index], "lidan")
    end
    
    lidanfmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(LiDanfTable[index], "lidanf")
    end
    
    hidanfmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(HiDanfTable[index], "hidanf")
    end
    
    midanfmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(MiDanfTable[index], "midanf")
    end
    
    idlemenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(IdleTable[index], "idle")
    end
    
    sitmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(SitTable[index], "sit")
    end
    
    reactionmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(ReactionTable[index], "reaction")
    end
    
    phonemenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(PhoneTable[index], "phone")
    end
    
    jobsmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(JobsTable[index], "jobs")
    end
    
    othermenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(OtherTable[index], "other")
    end
    
    drinkmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(DrinkTable[index], "drink")
    end
    
    clubmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(ClubTable[index], "club")
    end
    
    submenu.OnItemSelect = function(sender, item, index)
        if EmoteTable[index] ~= Config.Languages[lang]['favoriteemotes'] then
            EmoteMenuStart(EmoteTable[index], "emotes")
        end
    end
    
end

function AddCancelEmote(menu)
    local newitem = NativeUI.CreateItem(Config.Languages[lang]['cancelemote'], Config.Languages[lang]['cancelemoteinfo'])
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, checked_)
        if item == newitem then
            EmoteCancel()
            DestroyAllProps()
        end
    end
end

function AddWalkMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['walkingstyles'], "", "", Menuthing, Menuthing)
    
    walkreset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(walkreset)
    table.insert(WalkTable, Config.Languages[lang]['resetdef'])
    
    WalkInjured = NativeUI.CreateItem("Injured", "")
    submenu:AddItem(WalkInjured)
    table.insert(WalkTable, "move_m@injured")
    
    for a, b in pairsByKeys(DP.Walks) do
        x = table.unpack(b)
        walkitem = NativeUI.CreateItem(a, "")
        submenu:AddItem(walkitem)
        table.insert(WalkTable, x)
    end
    
    submenu.OnItemSelect = function(sender, item, index)
        if item ~= walkreset then
            WalkMenuStart(WalkTable[index])
        else
            ResetPedMovementClipset(PlayerPedId())
        end
    end
end

function AddFaceMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['moods'], "", "", Menuthing, Menuthing)
    
    facereset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(facereset)
    table.insert(FaceTable, "")
    
    for a, b in pairsByKeys(DP.Expressions) do
        x, y, z = table.unpack(b)
        faceitem = NativeUI.CreateItem(a, "")
        submenu:AddItem(faceitem)
        table.insert(FaceTable, a)
    end
    
    submenu.OnItemSelect = function(sender, item, index)
        if item ~= facereset then
            EmoteMenuStart(FaceTable[index], "expression")
        else
            ClearFacialIdleAnimOverride(PlayerPedId())
        end
    end
end

function AddInfoMenu(menu)
    if not UpdateAvailable then
        infomenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['infoupdate'], "(1.7.3)", "", Menuthing, Menuthing)
    else
        infomenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['infoupdateav'], Config.Languages[lang]['infoupdateavtext'], "", Menuthing, Menuthing)
    end
    contact = NativeUI.CreateItem(Config.Languages[lang]['suggestions'], Config.Languages[lang]['suggestionsinfo'])
    u170 = NativeUI.CreateItem("1.7.0", "Added /emotebind [key] [emote]!")
    u165 = NativeUI.CreateItem("1.6.5", "Updated camera/phone/pee/beg, added makeitrain/dance(glowstick/horse).")
    u160 = NativeUI.CreateItem("1.6.0", "Added shared emotes /nearby, or in menu, also fixed some emotes!")
    u151 = NativeUI.CreateItem("1.5.1", "Added /walk and /walks, for walking styles without menu")
    u150 = NativeUI.CreateItem("1.5.0", "Added Facial Expressions menu (if enabled by server owner)")
    infomenu:AddItem(contact)
    infomenu:AddItem(u170)
    infomenu:AddItem(u165)
    infomenu:AddItem(u160)
    infomenu:AddItem(u151)
    infomenu:AddItem(u150)
end

function OpenEmoteMenu()
    if exports['nocore-hospital']:GetDeathStatus() then return end
    mainMenu:Visible(not mainMenu:Visible())
    menuOpend = true
    CreateThread(function()
        while menuOpend do
            Citizen.Wait(0)
            _menuPool:ProcessMenus()
        end
    end)
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

AddEmoteMenu(mainMenu)
if Config.WalkingStylesEnabled then
    AddWalkMenu(mainMenu)
end
if Config.ExpressionsEnabled then
    AddFaceMenu(mainMenu)
end
AddCancelEmote(mainMenu)

_menuPool:RefreshIndex()

RegisterNetEvent("dp:Update")
AddEventHandler("dp:Update", function(state)
    UpdateAvailable = state
    --AddInfoMenu(mainMenu)
    _menuPool:RefreshIndex()
end)

RegisterNetEvent("dp:RecieveMenu")-- For opening the emote menu from another resource.
AddEventHandler("dp:RecieveMenu", function()
    OpenEmoteMenu()
end)
