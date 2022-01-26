ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('drugs:startDrugs')
AddEventHandler('drugs:startDrugs', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local haveZeRwYXDrugsingRod = (xPlayer.getInventoryItem(Config.ZeRwYXDrugsingRod).count >= 1)
    if not haveZeRwYXDrugsingRod then
        return
    end
    TriggerClientEvent('drugs:startDrugs', _src)
    SetTimeout(math.random(Config.MinTime, Config.MaxTime), function()
        local ZeRwYXDrugs = Config.ZeRwYXDrugs[math.random(#Config.ZeRwYXDrugs)]
        xPlayer.addInventoryItem(ZeRwYXDrugs, 1)
        TriggerClientEvent('drugs:stopDrugs', _src)
    end)
end)

RegisterNetEvent('drugs:ShellDrugs')
AddEventHandler('drugs:ShellDrugs', function(Nom, Item, Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local haveZeRwYXDrugs = (xPlayer.getInventoryItem(Item).count >= 1)
    if haveZeRwYXDrugs then
        xPlayer.addMoney(Price)
        xPlayer.removeInventoryItem(Item, 1)
		Citizen.Wait(500) 
		TriggerClientEvent('esx:showAdvancedNotification', _src, 'Vente de Drogue', 'HorizonCity', "Vous venez de vendre ~b~x1 "..Nom.." ~s~pour ~r~"..Price.."$", 2)
    else
		Citizen.Wait(500) 
		TriggerClientEvent('esx:showAdvancedNotification', _src, 'Vente de Drogue', 'HorizonCity', "Vous n'avez pas suffisament de ~b~"..Nom.." ~s~pour en vendre !", 2)
    end
end)
