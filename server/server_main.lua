-- importing core functions --
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- local variables --
local resourcename = 'ox_core'

-- get user information for user_info context menu --
lib.callback.register('test_1', function()
    local result = MySQL.query.await('SELECT * FROM characters WHERE charid = 6', {playerIdentifier})
    return result
end)

lib.callback.register('test_2', function()
    local result = MySQL.query.await('SELECT * FROM character_groups WHERE charid = 6', {playerIdentifier})
    return result
end)