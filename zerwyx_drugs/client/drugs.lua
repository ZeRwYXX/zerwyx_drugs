ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local open = false
local MenuSellZeRwYXDrugs = RageUI.CreateMenu("Drogue", "Rachat de drogue")
MenuSellZeRwYXDrugs.Display.Header = true
MenuSellZeRwYXDrugs.Closed = function()
    open = false
end

function OpenMenuSellZeRwYXDrugs() 
    if open then 
        open = false
        RageUI.Visible(MenuSellZeRwYXDrugs, false)
        return
    else
        open = true
        RageUI.Visible(MenuSellZeRwYXDrugs, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuSellZeRwYXDrugs, function()
                    RageUI.Separator("↓     ~g~Drogue Traitée     ~s~↓")
                    for k, v in pairs(Config.DrogueMenu) do
                        RageUI.Button(v.Nom, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('drugs:ShellDrugs', v.Nom, v.Item, v.Price)
                            end
                        })
                    end
                    RageUI.Separator("↓     ~r~Drogue Non Traitée   ~s~↓")
                    for k, v in pairs(Config.Drogue) do
                        RageUI.Button(v.Nom, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('drugs:ShellDrugs', v.Nom, v.Item, v.Price)
                            end
                        })
                    end
              
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do 
        local wait = 750
        for k in pairs(Config.PointRevente) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.PointRevente
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= 2.0 then 
                wait = 0
                Visual.Subtitle(Config.TextSellZeRwYXDrugs)
                if IsControlJustPressed(1, 51) then 
                    OpenMenuSellZeRwYXDrugs()
                end
            end
        end
    Wait(wait)
    end
end)

Citizen.CreateThread(function()
    if Config.BlipSellZeRwYXDrugs then
        for k, v in pairs(Config.PointRevente) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, Config.BlipSellZeRwYXDrugsId)
            SetBlipScale (blip, Config.BlipSellZeRwYXDrugsTaille)
            SetBlipColour(blip, Config.BlipSellZeRwYXDrugsCouleur)
            SetBlipAsShortRange(blip, Config.BlipSellZeRwYXDrugsRange)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipSellZeRwYXDrugsName)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

