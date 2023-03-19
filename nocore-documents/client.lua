Framework = nil

local PlayerData                = {}
local UI_MOUSE_FOCUS = false
local USER_DOCUMENTS = {}
local fontId
local CURRENT_DOCUMENT = nil
local DOCUMENT_FORMS = {
    ["public"] = {

      {
        headerTitle = "Форма за потвърждение",
        headerSubtitle = "Гражданска форма за потвърждение.",
        icon = "fa-solid fa-person",
        elements = {
          { label = "Съдържание на потвърждението", type = "textarea", value = "", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "Свидетелски показания",
        headerSubtitle = "Официални свидетелски показания.",
        icon = "fa-solid fa-eye",
        elements = {
          { label = "Дата", type = "input", value = "", can_be_emtpy = false },
          { label = "Съдържание на показанията", type = "textarea", value = "", can_be_emtpy = false },
        }
      }
      
    },


  ["police"] = {

      {
        headerTitle = "Разрешително за паркиране",
        headerSubtitle = "Специално разрешение за паркиране без ограничение.",
        icon = "fa-solid fa-square-parking",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "Информация", type = "textarea", value = "Гореспоменатият гражданин е получил неограничено разрешение за паркинг във всяка градска зона и е валиден до споменатата дата.", can_be_emtpy = false },
        }
      },

      {
        headerTitle = "Лиценз за оръжие",
        headerSubtitle = "Лиценз за оръжия предоставен от полицията.",
        icon = "fa-solid fa-gun",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
                { label = "Вид лиценз", type = "input", value = "", can_be_empty = false },
          { label = "Информация", type = "textarea", value = "Гореспоменатият гражданин има право на лиценз за оръжия който е валиден до споменатата дата.", can_be_emtpy = false },
        }
      },

      {
        headerTitle = "Чисто криминално досие",
        headerSubtitle = "Официално чисто криминално досие.",
        icon = "fa-solid fa-handcuffs",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "досие", type = "textarea", value = "Полицията заявява че гражданинът е с чисто криминално досие. Този резултат е генериран от данни, постъпили в базата данни и валиден до датата на подписване на този документ.", can_be_emtpy = false, can_be_edited = false },
        }        
      }
  },
    
  ["mechanic"] = {
      {
        headerTitle = "Застраховка на МПС",
        headerSubtitle = "Застраховка на МПС.",
        icon = "fa-solid fa-car-burst",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "Регистрационен номер:", type = "input", value = "", can_be_empty = false },
          { label = "Допълнителна информация", type = "textarea", value = "Застраховката покрива, всички разходи за поправка на двигател и гуми на МПС-то, извършени от служител на Главния на Механиците.", can_be_emtpy = false },
         }
        },
      {
        headerTitle = "Годишен преглед",
        headerSubtitle = "Годишен преглед.",
        icon = "fa-solid fa-check",
        elements = {
          { label = "Първо име", type = "input", value = "Име на собственика", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "Име на собственика", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "20днеа след днешна дата.", can_be_empty = false },
          { label = "Регистрационен номер:", type = "input", value = "", can_be_empty = false },
          { label = "Допълнителна информация", type = "textarea", value = "Колата е преминала успешно Годишен Технически Преглед в Главния сервиз на LS-custom's.", can_be_emtpy = false },
         }
      },
      {
        headerTitle = "Извършени дейности по МПС",
        headerSubtitle = "Тунинговане на МПС.",
        icon = "fa-solid fa-screwdriver-wrench",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Регистрационен номер:", type = "input", value = "", can_be_empty = false },
          { label = "Модел на МПС:", type = "input", value = "", can_be_empty = false },
          { label = "Извършени допълнения", type = "textarea", value = "Тунинга извършен по МПС с погоре посочения рег. номер:", can_be_emtpy = false },
        }
      }
  },

  ["tehnicheski"] = {
    {
      headerTitle = "Месечен технически преглед",
      headerSubtitle = "Месечен технически преглед.",
      icon = "fa-solid fa-check",
      elements = {
        { label = "Първо име", type = "input", value = "Име на собственика", can_be_emtpy = false },
        { label = "Трето име", type = "input", value = "Име на собственика", can_be_emtpy = false },
        { label = "Валидно до:", type = "input", value = "30днеа след днешна дата.", can_be_empty = false },
        { label = "Регистрационен номер:", type = "input", value = "", can_be_empty = false },
        { label = "Допълнителна информация", type = "textarea", value = "Колата е преминала успешно Годишен Технически Преглед в Главния сервиз на Auto Expert.", can_be_emtpy = false },
       }
    },
},
      
  ["cardealer"] = {
      {
        headerTitle = "Прададено МПС",
        headerSubtitle = "Преписване на МПС.",
        icon = "fa-solid fa-car",
        elements = {
          { label = "Първо име", type = "input", value = "Първо име на купувач", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "Третео име на купувач", can_be_emtpy = false },
          { label = "Модел на МПС:", type = "input", value = "", can_be_empty = false },
          { label = "Регистрационен номер:", type = "input", value = "", can_be_empty = false },
          { label = "Информация", type = "textarea", value = "Компанията, продала споменатата по-горе кола, с този документ потвърждава нейното ЛЕГАЛНО продаване/предаване, на гореспоменатото лице.При остановена неизправност в МПС-то при предаване/продаване фирмата поема отговорност за МПС-то и сумата предадена от купувача.", can_be_emtpy = false },
         }
      }
   },

  ["state"] = {
      {
        headerTitle = "Договор за ППС",
        headerSubtitle = "Договор за продажба на пътно превозно средство.",
        icon = "fa-solid fa-car",
        elements = {
          --{ label = "Първо име", type = "input", value = "Първо име на собственика", can_be_emtpy = false },
          --{ label = "Трето име", type = "input", value = "Третео име на собственика", can_be_emtpy = false },
          --{ label = "Име на магазин/заведение:", type = "input", value = "", can_be_empty = false },
          --{ label = "Валидност:", type = "input", value = "", can_be_empty = false },
          { label = "Информация", type = "textarea", value = "Аз _____ ______ като Нотариус-Адвокат потвърждавам преписването на:\n\nМПС,\nс рег номер _ _ _ - _ _ _ ,\nмарка ______,\nмодел _______,\n\nпринадлежащо на _______ ________ роден на __-__-____ \nпродадено на _______ ________ роден на __-__-____                             За сумата от: $9999999\n\nДнешна дата: __-__-____", can_be_emtpy = false },
         }
      },
      {
        headerTitle = "Лиценз за тютюн",
        headerSubtitle = "Лиценз за продажба на тютюневи изделия.",
        icon = "fa-solid fa-smoking",
        elements = {
          { label = "Първо име", type = "input", value = "Първо име на собственика", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "Третео име на собственика", can_be_emtpy = false },
          { label = "Име на магазин/заведение:", type = "input", value = "", can_be_empty = false },
          { label = "Валидност:", type = "input", value = "", can_be_empty = false },
          { label = "Информация", type = "textarea", value = "С този документ собственика на магазина/заведението може легално да предоставя тютюневи изделия на неговите клиенти.", can_be_emtpy = false },
         }
      },
      {
        headerTitle = "Лиценз за алкохол",
        headerSubtitle = "Лиценз за продажба на алколни изделия.",
        icon = "fa-solid fa-beer-mug-empty",
        elements = {
          { label = "Първо име", type = "input", value = "Първо име на собственика", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "Третео име на собственика", can_be_emtpy = false },
          { label = "Име на магазин/заведение:", type = "input", value = "", can_be_empty = false },
          { label = "Валидност:", type = "input", value = "", can_be_empty = false },
          { label = "Информация", type = "textarea", value = "С този документ собственика на магазина/заведението може легално да предоставя алколни изделия на неговите клиенти.", can_be_emtpy = false },
         }
      }

  },
    
    
  ["ambulance"] = {
      {
        headerTitle = "Медицинско - патология",
        headerSubtitle = "Официален медицински доклад, предоставен от патолог.",
        icon = "fa-solid fa-star-of-life",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "МЕДИЦИНСКИ ЗАБЕЛЕЖКИ", type = "textarea", value = "Гореспоменатият гражданин беше прегледан от служител на здравеопазването и е определен здрав без открити дългосрочни заболявания. Този доклад е валиден до споменатата дата.", can_be_emtpy = false },
        }
      },
      
      {
        headerTitle = "Медицинско - психология",
        headerSubtitle = "Официален медицински доклад, предоставен от психолог.",
        icon = "fa-solid fa-star-of-life",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "МЕДИЦИНСКИ ЗАБЕЛЕЖКИ", type = "textarea", value = "Гореспоменатият гражданин беше прегледан от служител на здравеопазването и е определен психически здрав от най-ниско одобрените стандарти. Този доклад е валиден до споменатата дата.", can_be_emtpy = false },
          }
      },

      {
        headerTitle = "МЕДИЦИНСКО СВИДЕТЛЕСТВО ЗА РАБОТА",
        headerSubtitle = "МЕДИЦИНСКО СВИДЕТЛЕСТВО ЗА РАБОТА",
        icon = "fa-solid fa-star-of-life",
        elements = {
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "МЕДИЦИНСКИ ЗАБЕЛЕЖКИ", type = "textarea", value = "МЕДИЦИНСКО СВИДЕТЛЕСТВО ЗА РАБОТА\n На (име): \nроден(а) на:  г. , ЕГН: \nЛицето кандидатства за работа в: \nкато (длъжност): \nРаботил е още като: \nДАННИ ОТ АНАМНЕЗАТА: Минали заболявания: \nДАННИ ОТ ПРЕГЛЕДА: \nЗАКЛЮЧЕНИЕ: \nВъз основа на прегледа и дадените консултации от лекарите специалисти, лицето може да бъде прието в (фирма): \nИзданен на: ", can_be_emtpy = false },
        }
      },

      {
        headerTitle = "СЪДЕБНОМЕДИЦИНСКО УДОСТОВЕРЕНИЕ",
        headerSubtitle = "СЪДЕБНОМЕДИЦИНСКО УДОСТОВЕРЕНИЕ",
        icon = "fa-solid fa-star-of-life",
        elements = {
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "МЕДИЦИНСКИ ЗАБЕЛЕЖКИ", type = "textarea", value = "Подписаният\n КРАТКА АНАМНЕЗА И ОБЕКТИВНА НАХОДКА\n(описание на болестното състояние или травматични промени)\n ЗАКЛЮЧЕНИЕ\n Издаден на: ", can_be_emtpy = false },
        }
      },

      {
        headerTitle = "Болничен лист",
        headerSubtitle = "Болничен лист",
        icon = "fa-solid fa-star-of-life",
        elements = {
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "МЕДИЦИНСКИ ЗАБЕЛЕЖКИ", type = "textarea", value = "БОЛНИЧЕН  ЛИСТ №\n за временна неработоспособност\n Издаден от: \nОсигурен: \nМесторабота: \nДлъжност: \nДиагноза: \nПричина: \nРежим на лечение: \nДни в отпуск от: \nДа се яви на работа на: \nИздаден на:", can_be_emtpy = false },
          }
      },
      
      {
        headerTitle = "Здравна Осигуровка",
        headerSubtitle = "Официална Мецинска Застраховка.",
        icon = "fa-solid fa-heart-circle-check",
        elements = {
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "Допълнителна информация", type = "textarea", value = "Лицето:  , \nс ЕГН: , \ne здравно осигурен към болничното заведение Los Santos Medical Center. \nИздаден на:", can_be_emtpy = false },
        }
      },
      
      {
        headerTitle = "Разрешение за ползване на марихуана",
        headerSubtitle = "Официално разрешение за употреба на марихуана за граждани.",
        icon = "fa-solid fa-cannabis",
        elements = {
          { label = "Първо име", type = "input", value = "", can_be_emtpy = false },
          { label = "Трето име", type = "input", value = "", can_be_emtpy = false },
          { label = "Валидно до:", type = "input", value = "", can_be_empty = false },
          { label = "Допустимо количество:", type = "input", value = "", can_be_empty = false },
          { label = "МЕДИЦИНСКИ ЗАБЕЛЕЖКИ", type = "textarea", value = "Медицинското лице извършило прегледа декларира, че въпросният човек може да употребява марихуана, в рамките на допустимото количество!", can_be_emtpy = false, can_be_edited = false },
        }
      }
  },
  ["realestate"] = {

    {
      headerTitle = "Договор за покупко-продажба на имот",
      headerSubtitle = "Договор за покупко-продажба на имот.",
      icon = "fa-solid fa-house",
      elements = {
        { label = "Съдържание на договора", type = "textarea", value = "Днес на дата 00.00 лицето [Две имена], с ЕГН: ,осъществи покупко-продажба на недвижим имот(Вид на имота) през брокерска фирма 'Албански измами' на адрес [Адрес]  за сумата от $[Сума] плюс брокерска такса 5% от стойността.", can_be_emtpy = false },
      }
    },

    {
      headerTitle = "Договор за наем на имот",
      headerSubtitle = "Договор за наем на имот.",
      icon = "fa-solid fa-house",
      elements = {
        { label = "Дата", type = "input", value = "", can_be_emtpy = false },
        { label = "Съдържание на договора", type = "textarea", value = "От горепосочената дата в срок на [дни] влиза в сила договор за наем на обект[вид на обекта] на адрес [Адрес]. Лицето [Две имена] се явява наемател, а сумата по договора е [Колко кратно заплащане на сума от $] по банков път. Лицето има пълното право да употребява обекта както намери за добре, стига да НЕ поврежда цялостта на обекта.", can_be_emtpy = false },
      }
    }
  }
} 
 
 
local isLoggedIn = false

local MENU_OPTIONS = {
    x = 0.5,
    y = -0.01,
    width = 0.5,
    height = 0.04,
    scale = 0.3,
    font = fontId,
    menu_subtitle = 'Меню Документи',
    color_r = 0,
    color_g = 128,
    color_b = 255,
}

RegisterNetEvent('Framework:Client:OnPlayerLoaded')
AddEventHandler('Framework:Client:OnPlayerLoaded', function()
    TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
            Citizen.Wait(200)
    isLoggedIn = true
end)
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)
        Citizen.Wait(200)
        isLoggedIn = true
    end
end)

Citizen.CreateThread(function()
    while isLoggedIn == false do
        Citizen.Wait(10)
    end
    PlayerData = Framework.Functions.GetPlayerData()
    MENU_OPTIONS.font = 4
    GetAllUserForms()
    SetNuiFocus(false, false)
end)

function OpenMainMenu()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Документи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Публични Документи",
        txt = "",
        icon = "fa-solid fa-file",
        params = { 
            event = "nocore-documents:client:OpenNewPublicFormMenu",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Работни Документи",
        txt = "",
        icon = "fa-solid fa-file",
        params = { 
            event = "nocore-documents:client:OpenNewJobFormMenu",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Запазени Документи",
        txt = "",
        icon = "fa-solid fa-folder-open",
        params = { 
            event = "nocore-documents:client:OpenMyDocumentsMenu",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function CopyFormToPlayer(aPlayer)
    --TriggerServerEvent('nocore-documents:CopyToPlayer', GetPlayerServerId(player), aDocument)
    TriggerServerEvent('nocore-documents:server:CopyToPlayer', aPlayer, CURRENT_DOCUMENT)
    CURRENT_DOCUMENT = nil;
end

function ShowToNearestPlayers(aDocument)
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Близки играчи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    local players_clean = GetNeareastPlayers()
    CURRENT_DOCUMENT = aDocument
    if #players_clean > 0 then
        for i=1, #players_clean, 1 do
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = players_clean[i].playerName .. "[" .. tostring(players_clean[i].playerId) .. "]",
                txt = "",
                icon = "fa-solid fa-person",
                params = { 
                    event = "nocore-documents:client:ShowDocument",
                    args = {
                        player = players_clean[i].playerId
                    }
                }
            })
        end
    else
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Няма играч до теб",
            txt = "",
            icon = "fa-solid fa-person",
            params = { 
                event = "nocore-documents:client:fakeevent",
                args = {}
            }
        })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function CopyToNearestPlayers(aDocument)
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Близки играчи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    local players_clean = GetNeareastPlayers()
    CURRENT_DOCUMENT = aDocument
    if #players_clean > 0 then
        for i=1, #players_clean, 1 do
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = players_clean[i].playerName .. "[" .. tostring(players_clean[i].playerId) .. "]",
                txt = "",
                icon = "fa-solid fa-person",
                params = { 
                    event = "nocore-documents:client:CopyFormToPlayer",
                    args = {
                        player = players_clean[i].playerId
                    }
                }
            })
        end
    else
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = "Няма играч до теб",
            txt = "",
            icon = "fa-solid fa-person",
            params = { 
                event = "nocore-documents:client:fakeevent",
                args = {}
            }
        })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        icon = "fa-solid fa-xmark",
        txt = "",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function OpenNewPublicFormMenu()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Публични Документи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    for i=1, #DOCUMENT_FORMS["public"], 1 do
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = DOCUMENT_FORMS["public"][i].headerTitle,
            txt = DOCUMENT_FORMS["public"][i].headerSubtitle,
            icon = DOCUMENT_FORMS["public"][i].icon,
            params = { 
                event = "nocore-documents:client:CreateNewForm",
                args = {
                    document = DOCUMENT_FORMS["public"][i]
                }
            }
        })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Назад",
        txt = "",
        icon = "fa-solid fa-angle-left",
        params = { 
            event = "nocore-documents:client:OpenDocuments",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function OpenNewJobFormMenu()
    PlayerData = Framework.Functions.GetPlayerData()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Работни Документи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    if DOCUMENT_FORMS[PlayerData.job.name] ~= nil then
        for i=1, #DOCUMENT_FORMS[PlayerData.job.name], 1 do
            table.insert(sendMenu,{
                id = #sendMenu+1,
                header = DOCUMENT_FORMS[PlayerData.job.name][i].headerTitle,
                txt = DOCUMENT_FORMS[PlayerData.job.name][i].headerSubtitle,
                icon = DOCUMENT_FORMS[PlayerData.job.name][i].icon,
                params = { 
                    event = "nocore-documents:client:CreateNewForm",
                    args = {
                        document = DOCUMENT_FORMS[PlayerData.job.name][i]
                    }
                }
            })
        end
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Назад",
        txt = "",
        icon = "fa-solid fa-angle-left",
        params = { 
            event = "nocore-documents:client:OpenDocuments",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function OpenMyDocumentsMenu()
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Лични Документи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    for i=#USER_DOCUMENTS, 1, -1 do
        local date_created = ""
        if USER_DOCUMENTS[i].data.headerDateCreated ~= nil then
            date_created = USER_DOCUMENTS[i].data.headerDateCreated
        end
        table.insert(sendMenu,{
            id = #sendMenu+1,
            header = USER_DOCUMENTS[i].data.headerTitle,
            txt = date_created,
            icon = "fa-solid fa-file-lines",
            params = { 
                event = "nocore-documents:client:OpenFormPropertiesMenu",
                args = {
                    document = USER_DOCUMENTS[i]
                }
            }
        })
    end
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Назад",
        txt = "",
        icon = "fa-solid fa-angle-left",
        params = { 
            event = "nocore-documents:client:OpenDocuments",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)

end

function OpenFormPropertiesMenu(aDocument)

    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Документи",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Виж",
        txt = "",
        icon = "fa-solid fa-eye",
        params = { 
            event = "nocore-documents:client:ViewDocument",
            args = {
                document = aDocument.data,
            }
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Покажи",
        txt = "",
        icon = "fa-solid fa-eye",
        params = { 
            event = "nocore-documents:client:ShowToNearestPlayers",
            args = {
                document = aDocument.data,
            }
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Дай копие",
        txt = "",
        icon = "fa-solid fa-copy",
        params = { 
            event = "nocore-documents:client:CopyToNearestPlayers",
            args = {
                document = aDocument.data,
            }
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Накъсай",
        txt = "",
        icon = "fa-solid fa-trash-can",
        params = { 
            event = "nocore-documents:client:OpenDeleteFormMenu",
            args = {
                document = aDocument,
            }
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Назад",
        txt = "",
        icon = "fa-solid fa-angle-left",
        params = { 
            event = "nocore-documents:client:OpenMyDocumentsMenu",
            args = {}
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function OpenDeleteFormMenu(aDocument)
    local sendMenu = {}
    table.insert(sendMenu,{
        id = 1,
        header = "Изтрий документ",
        txt = "",
        icon = "fa-solid fa-file-lines",
        isMenuHeader = true
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Да, сигурен съм",
        txt = "",
        icon = "fa-solid fa-trash-can",
        params = { 
            event = "nocore-documents:client:DeleteDocument",
            args = {
                document = aDocument,
            }
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Назад",
        txt = "",
        icon = "fa-solid fa-angle-left",
        params = { 
            event = "nocore-documents:client:OpenFormPropertiesMenu",
            args = {
                document = aDocument
            }
        }
    })
    table.insert(sendMenu,{
        id = #sendMenu+1,
        header = "Затвори",
        txt = "",
        icon = "fa-solid fa-xmark",
        params = { 
            event = "nocore-documents:client:fakeevent",
            args = {}
        }
    })
    exports['nocore-context']:openMenu(sendMenu)
end

function DeleteDocument(aDocument)

    local key_to_remove = nil

    Framework.Functions.TriggerCallback('nocore-documents:server:deleteDocument', function (cb)
        if cb == true then
            --remove form_close
            for i=1, #USER_DOCUMENTS, 1 do
                if USER_DOCUMENTS[i].id == aDocument.id then
                    key_to_remove = i
                end
            end

            if key_to_remove ~= nil then
                table.remove(USER_DOCUMENTS, key_to_remove)
            end
            OpenMyDocumentsMenu()
        end
    end, aDocument.id)
end

function CreateNewForm(aDocument)
    PlayerData = Framework.Functions.GetPlayerData()
    SetNuiFocus(true, true)
    aDocument.headerFirstName = PlayerData.charinfo.firstname
    aDocument.headerLastName = PlayerData.charinfo.lastname
    aDocument.headerDateOfBirth = PlayerData.charinfo.birthdate
    aDocument.headerJobLabel = PlayerData.job.label
    aDocument.headerJobGrade = PlayerData.job.grade.name
    aDocument.locale = Config.Locale
    SendNUIMessage({
        type = "createNewForm",
        data = aDocument
    })
end

function ShowDocument(aPlayer)
    TriggerServerEvent('nocore-documents:server:ShowToPlayer', aPlayer, CURRENT_DOCUMENT)
    CURRENT_DOCUMENT = nil
end

function ViewDocument(aDocument)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "ShowDocument",
        data = aDocument
    })
end

function CopyForm(aDocument)
    --table.insert(USER_DOCUMENTS, aDocument)
end

function GetAllUserForms()
    Framework.Functions.TriggerCallback('nocore-documents:server:getPlayerDocuments', function (cb_forms)
        if cb_forms ~= nil then
            --print("Received dump : " .. dump(cb_forms))
            USER_DOCUMENTS = cb_forms
        else
            print ("Received nil from newely created scale object.")
        end
    end)
end

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players = Framework.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 3.0)

    local players_clean = {}
    local found_players = false

    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            --playesdata = Framework.Functions.GetPlayerData(players[i])
            table.insert(players_clean, {playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i])} )
        end
    end
    return players_clean
end


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

--[[ NUI CALLBACKS ]]


RegisterNUICallback('form_close', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('form_submit', function(data, cb)
    Framework.Functions.TriggerCallback('nocore-documents:server:submitDocument', function (cb_form)
        if cb_form ~= nil then
            table.insert(USER_DOCUMENTS, cb_form)
            OpenFormPropertiesMenu(cb_form)
        else
            print ("Received nil from newely created scale object.")
        end
    end, data)
    SetNuiFocus(false, false)
end)

--[[ EVENTS ]]


RegisterNetEvent('nocore-documents:client:OpenDocuments')
AddEventHandler('nocore-documents:client:OpenDocuments', function()
    OpenMainMenu()
end)

RegisterNetEvent('nocore-documents:client:viewDocument')
AddEventHandler('nocore-documents:client:viewDocument', function( data )
    ViewDocument(data)
end)

RegisterNetEvent('nocore-documents:client:copyForm')
AddEventHandler('nocore-documents:client:copyForm', function( data )
    table.insert(USER_DOCUMENTS, data)
end)

RegisterNetEvent('nocore-documents:client:OpenNewPublicFormMenu')
AddEventHandler('nocore-documents:client:OpenNewPublicFormMenu', function()
    OpenNewPublicFormMenu()
end)
RegisterNetEvent('nocore-documents:client:OpenNewJobFormMenu')
AddEventHandler('nocore-documents:client:OpenNewJobFormMenu', function()
    OpenNewJobFormMenu()
end)
RegisterNetEvent('nocore-documents:client:OpenMyDocumentsMenu')
AddEventHandler('nocore-documents:client:OpenMyDocumentsMenu', function()
    OpenMyDocumentsMenu()
end)
RegisterNetEvent('nocore-documents:client:CreateNewForm')
AddEventHandler('nocore-documents:client:CreateNewForm', function(data)
    CreateNewForm(data.document)
end)
RegisterNetEvent('nocore-documents:client:OpenFormPropertiesMenu')
AddEventHandler('nocore-documents:client:OpenFormPropertiesMenu', function(data)
    OpenFormPropertiesMenu(data.document)
end)
RegisterNetEvent('nocore-documents:client:ViewDocument')
AddEventHandler('nocore-documents:client:ViewDocument', function(data)
    ViewDocument(data.document)
end)
RegisterNetEvent('nocore-documents:client:ShowToNearestPlayers')
AddEventHandler('nocore-documents:client:ShowToNearestPlayers', function(data)
    ShowToNearestPlayers(data.document)
end)
RegisterNetEvent('nocore-documents:client:CopyToNearestPlayers')
AddEventHandler('nocore-documents:client:CopyToNearestPlayers', function(data)
    CopyToNearestPlayers(data.document)
end)
RegisterNetEvent('nocore-documents:client:OpenDeleteFormMenu')
AddEventHandler('nocore-documents:client:OpenDeleteFormMenu', function(data)
    OpenDeleteFormMenu(data.document)
end)
RegisterNetEvent('nocore-documents:client:ShowDocument')
AddEventHandler('nocore-documents:client:ShowDocument', function(data)
    ShowDocument(data.player)
end)
RegisterNetEvent('nocore-documents:client:CopyFormToPlayer')
AddEventHandler('nocore-documents:client:CopyFormToPlayer', function(data)
    CopyFormToPlayer(data.player)
end)
RegisterNetEvent('nocore-documents:client:DeleteDocument')
AddEventHandler('nocore-documents:client:DeleteDocument', function(data)
    DeleteDocument(data.document)
end)