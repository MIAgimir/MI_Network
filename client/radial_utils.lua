-- importing core functions -- 
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- creating local variables --
local debug = Config.Debug

--[[ for notifications
RegisterNetEvent('mirm_notification', function()
    if debug == true then
        print('debug_statement')
    end
    exports.scully_emotemenu:PlayByCommand('emote_here')
    lib.notify({
        id = 'some_identifier',
        title = 'Notification title',
        description = 'Notification description',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
        icon = 'ban',
        iconColor = '#C53030'
    })
end)
]]

RegisterNetEvent('mirm_prompt', function(header_ctx, content_ctx)
    if debug == true then
        print('debug_statement')
    end
    exports.scully_emotemenu:PlayByCommand('emote_here')
    local alert = lib.alertDialog({
        header = header_ctx,
        content = content_ctx,
        centered = true,
        cancel = true
    }) print(alert)
end)