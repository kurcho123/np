Config = {}

-------------------------- COMMANDS & FUNCTIONALITY

Config.InvoicesCommand = 'bill' -- Command used to open the invoices menu

Config.VATPercentage = 23 -- Visual only, it won't influence the final invoice value, change it to your country VAT value

Config.LimitDate = true -- Used to enable/disable whether we want to have the payment limit date or not

Config.LimitDateDays = 14 -- If Config.LimitDate is enabled, it is used to define the days of the deadline for payment after issuing the invoice

Config.PayAutomaticallyAfterLimit = true -- It serves to enable/disable if we want the invoice to be automatically paid after the due date

-- (For this to work you need to set  = true and add a number to LimitDateDays)
Config.FeeAfterEachDay = true -- Serves to enable/disable if we want unpaid invoices to increase in value after each day they are not paid 

Config.FeeAfterEachDayPercentage = 1 -- If Config.FeeAfterEachDay is enabled, it is used to set the fee percentage after each day

Config.OnlyBossCanAccessSocietyInvoices = true -- Defines if only the boss can access the society invoices, if false all the employees will have access to it

Config.AllowedSocieties = { -- Allowed societies to open the 'Society Invoices' and 'Create Invoice' menus
	['police'] = 6,
	['taxi'] = 4,
	['ambulance'] = 4,
	['mechanic'] = 4,
	['judge'] = 5,
	['coffee'] = 3,
	['fixit'] = 4,
	['cranberry'] = 3,
	['crastenburg'] = 2,
	['realestate'] = 3,
	['redcircle'] = 3,
	['burger'] = 4,
	['catcoffee'] = 3,
	['pizzathis'] = 4,
	['fraudauto'] = 4,
	['beanlegion'] = 4,
	['misfits'] = 4,
	['tehnicheski'] = 2,
	['blazeit'] = 3,
	['oldtown'] = 4,
}

Config.ToBossMenu = { -- Societies which works with the boss menu
	['police3'] = 0, -- police
	--['ambulance'] = 0
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 5

Config.BotName = 'Нап' -- Write the desired bot name

Config.ServerName = 'NoLag' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/934810367094321182/934811122278752336/TEJAAAAAElFTkSuQmCC.png' -- Image

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html45518a

Config.CreateNewInvoiceWebhookColor = '16127'

Config.PayInvoiceWebhookColor = '65352'

Config.AutopayInvoiceWebhookColor = '4542858'

Config.CancelInvoiceWebhookColor = '9868950'