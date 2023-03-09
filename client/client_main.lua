-- importing core functions
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- callback example --
RegisterCommand('ctest', function()
local count = lib.callback.await('ox_inventory:getItemCount', false, 'water')
local data = lib.callback.await('test_1', false)
local job = lib.callback.await('test_2', false)
    if data then
        for i = 1, #data do
            local row = data[i]
            print(row.identifier, row.firstname, row.lastname)
            lib.notify({
                title = row.firstname,
                description = row.lastname,
                type = 'success'
            })
            lib.registerContext({
                id = 'user_info',
                title = 'User Information',
                options = {
                    {
                    title = row.firstname,
                    },
                    {
                    title = row.lastname,
                    },
                    {
                    title = row.gender,
                    },
                    {
                    title = row.phone_number,
                    },
                }
            })
        end
    end
    if job then
        for i = 1, #job do
            local row = job[i]
            print(row.name)
            
        end
    end
    print(count)
    lib.showContext('user_info')
end)