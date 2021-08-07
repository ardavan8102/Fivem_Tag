---------------------------------------------------  αυтнσя : αя∂αναη81  -----------------------------------------------

ESX = nil
AdminPlayers = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Server Side Options
RegisterCommand('a', function(source,args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if AdminPlayers[source] == nil then
        if Config.TagByPermission then
            AdminPlayers[source] = {source = source, permission = xPlayer.getPermissions()}
        else
            AdminPlayers[source] = {source = source, group = xPlayer.getGroup()}
        end

        TriggerClientEvent('chat:addMessage',source, { args = { '~r~[S Y S T E M] | ', 'Shoma ~g~On Duty~s~ Shodid!' }, color = { 255, 50, 50 } })
    else
        AdminPlayers[source] = nil
        TriggerClientEvent('chat:addMessage',source, { args = { '~r~[S Y S T E M] | ', 'Shoma ~r~Off Duty~s~ Shodid!' }, color = { 255, 50, 50 } })
    end
    TriggerClientEvent('ard:set_admins',-1,AdminPlayers)
end)

ESX.RegisterServerCallback('ard:getAdminsPlayers',function(source,cb)
    cb(AdminPlayers)
end)

AddEventHandler('esx:playerDropped', function(source)
    if AdminPlayers[source] ~= nil then
        AdminPlayers[source] = nil
    end
    TriggerClientEvent('ard:set_admins',-1,AdminPlayers)
end)


---------------------------------------------------  αυтнσя : αя∂αναη81  -----------------------------------------------