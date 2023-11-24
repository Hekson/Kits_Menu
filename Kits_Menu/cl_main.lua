ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand('kits', function(source)
    SendNUIMessage({
        action = "open",
        vip = tonumber(vip)
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('silverbutton', function()
    TriggerServerEvent('kit:menu', 'silverkit')
end)

RegisterNUICallback('goldenkitbutton', function()
    TriggerServerEvent('kit:menu', 'goldenkit')
end)

RegisterNUICallback('diamondkitbutton', function()
    TriggerServerEvent('kit:menu', 'diamondkit')
end)

RegisterNUICallback('freekitbutton', function()
    TriggerServerEvent('kit:menu', 'freekit')
end)

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)