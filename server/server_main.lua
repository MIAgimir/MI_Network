-- importing core functions --
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- local variables --
local players = {}
local table = lib.table

-- get user information for user_info context menu --
lib.callback.register('test_1', function()
    local result = MySQL.query.await('SELECT * FROM characters WHERE charid = 6', {playerIdentifier})
    return result
end)

lib.callback.register('test_2', function()
    local result = MySQL.query.await('SELECT * FROM character_groups WHERE charid = 6', {playerIdentifier})
    return result
end)

-- Player Service Actions --
CreateThread(function()
    for _, player in pairs(Ox.GetPlayers(true, { groups = Config.JobGroup })) do
        local inService = player.get('inService')
        if inService and table.contains(Config.JobGroup, inService) then
            players[player.source] = player
        end
    end
end)

RegisterNetEvent('setPlayerInService', function(group)
    local player = Ox.GetPlayer(source)
    if player then
        if group and table.contains(Config.JobGroup, group) 
        and player.hasGroup(Config.JobGroup) then
            players[source] = player
            return player.set('inService', group, true)
        end
        player.set('inService', false, true)
    end
    players[source] = nil
end)

AddEventHandler('playerLogout', function(source)
    players[source] = nil
end)


lib.callback.register('mioxjob:checkservice', function(source, target)
    return players[target or source]
end)