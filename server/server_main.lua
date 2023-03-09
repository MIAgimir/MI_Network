-- importing core functions
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()



-- lua sync sql test
local val = 10000
RegisterCommand('luasync', function()
    local queryTimesLocal = {}
    local result
    MySQL.prepare.await('SELECT identifier from users WHERE lastname = ?', {'Linden'})

    for i=1, val do
        local time = os.nanotime()
        local r = MySQL.prepare.await('SELECT identifier from users WHERE lastname = ?', {'Linden'})
        queryTimesLocal[#queryTimesLocal+1] = (os.nanotime() - time) / 1000000
        if i==1 then result = r end
    end

    local queryMsLow, queryMsSum = 1000, 0

    for _, v in pairs(queryTimesLocal) do queryMsSum = queryMsSum + v end
    for _, v in pairs(queryTimesLocal) do
        if v < queryMsLow then queryMsLow = v end
    end

    local averageQueryTime = queryMsSum / #queryTimesLocal
    print(json.encode(result))
    print('Low: '.. queryMsLow ..'ms | Avg: '..averageQueryTime..'ms | Total: '..queryMsSum..'ms ('..#queryTimesLocal..' queries)')
end)

-- get user information for user_info context menu --
local function getplayerinfo()
    local first = nil
    local last = nil
    local dob = nil
    local group = nil
    local grade = nil
end