ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayers)
    local xPlayer = xPlayers

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        if result[1].vip > 0 then
            xPlayer.set('vip', result[1].vip)
        end
    end)
end)

RegisterNetEvent('kit:menu')
AddEventHandler('kit:menu', function(stats)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)

        if stats == 'silverkit' then
            if result[1].vip == 1 then
                if result[1].silver == 0 then
                    xPlayer.addInventoryItem('bread', 10)

                    MySQL.Async.execute('UPDATE users SET silver = @silver WHERE identifier = @identifier', {
                        ['@silver'] = 1,
                        ['@identifier'] = xPlayer.identifier
                    })
                else
                    TriggerClientEvent('esx:showNotification', src, "Shoma Kit Ra Qablan Daryaft Kardid.")
                end
            else
                TriggerClientEvent('esx:showNotification', src, "Shoma Vip Nistid Jahat Kharid Vip Be Discord Moraje konid.")
            end
        elseif stats == 'goldenkit' then
            if result[1].vip == 1 then
                if result[1].golden == 0 then
                    xPlayer.addInventoryItem('phone', 1)

                    MySQL.Async.execute('UPDATE users SET golden = @golden WHERE identifier = @identifier', {
                        ['@golden'] = 1,
                        ['@identifier'] = xPlayer.identifier
                    })
                else
                    TriggerClientEvent('esx:showNotification', src, "Shoma Kit Ra Qablan Daryaft Kardid.")
                end
            else
                TriggerClientEvent('esx:showNotification', src, "Shoma Vip Nistid Jahat Kharid Vip Be Discord Moraje konid.")
            end
        elseif stats == 'diamondkit' then
            if result[1].vip == 1 then
                if result[1].diamond == 0 then
                    xPlayer.addInventoryItem('water', 1)

                    MySQL.Async.execute('UPDATE users SET diamond = @diamond WHERE identifier = @identifier', {
                        ['@diamond'] = 1,
                        ['@identifier'] = xPlayer.identifier
                    })
                else
                    TriggerClientEvent('esx:showNotification', src, "Shoma Kit Ra Qablan Daryaft Kardid.")
                end
            else
                TriggerClientEvent('esx:showNotification', src, "Shoma Vip Nistid Jahat Kharid Vip Be Discord Moraje konid.")
            end
        elseif stats == 'freekit' then
            if result[1].freekit == 1 then
                xPlayer.addInventoryItem('iron', 1)

                MySQL.Async.execute('UPDATE users SET freekit = @freekit WHERE identifier = @identifier', {
                    ['@freekit'] = 0,
                    ['@identifier'] = xPlayer.identifier
                })
            else
                TriggerClientEvent('esx:showNotification', src, "Shoma Kit Ra Qablan Daryaft Kardid.")
            end
        end
    end)
end)

TriggerEvent('es:addAdminCommand', 'givevip', 10, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerId = args[1]
    local kittype = args[2]

    if playerId ~= nil then
        MySQL.Async.execute('UPDATE users SET vip = @vip WHERE identifier = @identifier', {
            ['@vip'] = 1,
            ['@identifier'] = xPlayer.identifier
        })
    end

    if kittype == 'silver' then
        MySQL.Async.execute('UPDATE users SET silver = @silver WHERE identifier = @identifier', {
            ['@silver'] = 0,
            ['@identifier'] = xPlayer.identifier
        })
    end

    if kittype == 'golden' then
        MySQL.Async.execute('UPDATE users SET golden = @golden WHERE identifier = @identifier', {
            ['@golden'] = 0,
            ['@identifier'] = xPlayer.identifier
        })
    end

    if kittype == 'diamond' then
        MySQL.Async.execute('UPDATE users SET diamond = @diamond WHERE identifier = @identifier', {
            ['@diamond'] = 0,
            ['@identifier'] = xPlayer.identifier
        })
    end

end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1[ System ] : ", "Shoma Dastresi Kafi Nadari!"} })
end, {help = "Taqir Dadan Type Kit Fard", params = {{ name="id", help="id player" }, { name="type", help="Entekhabe Type:(silver, golden, diamond)" },}})


TriggerEvent('es:addAdminCommand', 'removevip', 10, function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerId = args[1]

    if playerId then
        MySQL.Async.execute('UPDATE users SET vip = @vip WHERE identifier = @identifier', {
            ['@vip'] = 0,
            ['@identifier'] = xPlayer.identifier
        })
    else
        TriggerClientEvent('chat:addMessage', source, { args = { '^1[ SYSTEM ] : ', '/removevip [id]' } })
    end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1[ System ] : ", "Shoma Dastresi Kafi Nadari!"} })
end, {help = "remove vip", params = {{name = "id", help = "Player Id"}}})