-- importing core functions -- 
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- creating local variables --
local debug = Config.Debug
local display = false

exports('MI_Network:menu_handler', function(menu, item)
    print(menu, item)
    if debug == true then
        if menu == 'work' and item == 1 then
            print('work_menu')
        elseif menu == 'user' and item == 1 then
            print('user_menu')
        elseif menu == 'alert' and item == 1 then
            print('alert_menu')
        elseif menu == 'network' and item == 1 then
            print('network_menu')
        end
    end
end)

local function userinfo()
    local data = lib.callback.await('test_1', false)
    if data then
        for i = 1, #data do
            local row = data[i]
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
    lib.showContext('user_info')
end

-- use link to change icons for menus
-- https://fontawesome.com/search?o=r&new=yes&s=thin

-- user menu
lib.registerRadial({
    id = 'user_menu',
    items = {
        {
        label = 'Housing',
        icon = 'house',
        onSelect = function()
            print('testing')
            exports['MI_Housing']:open_userhousingmenu()
        end
        },
        {
        label = 'User Info',
        icon = 'user',
        onSelect = function()
            userinfo()
        end
        },
        {
        label = 'Outfits',
        icon = 'shirt',
        onSelect = function()
            TriggerEvent('ox_appearance:wardrobe')
        end
        },
        {
        label = 'Vehicles',
        icon = 'car-side',
        onSelect = function()
            print('housing')
        end
        },
    }
  })

lib.registerRadial({
    id = 'work_menu',
    items = {
        {
        label = 'Check in',
        icon = 'circle-check',
        onSelect = function()
            print('checking in')
            exports['MI_Job']:radial_checkin()
            TriggerServerEvent('setPlayerInService')
        end
        },
        {
        label = 'Req. work car',
        icon = 'truck',
        onSelect = function()
            print('checking out')
        end
        },
        {
        label = 'Req. job',
        icon = 'list-check',
        onSelect = function()
            print('appearance')
            exports['MI_Job']:assignment_check()
        end
        },
        {
        label = 'Job Menu',
        icon = 'list',
        onSelect = function()
            print('housing')
        end
        },
        {
        label = 'Checkout',
        icon = 'circle-xmark',
        onSelect = function()
            print('checking out')
            exports['MI_Job']:radial_checkout()
            TriggerServerEvent('setPlayerInService')
        end
        }        
    }
})

lib.registerRadial({
    id = 'alert_menu',
    items = {
        {
        label = 'Police',
        icon = 'shield-halved',
        onSelect = function()
            print('Cops on the way')
        end
        },
        {
        label = 'Medical',
        icon = 'briefcase-medical',
        onSelect = function()
            print('We gon fix your bones')
        end
        },
        {
        label = 'Rescue',
        icon = 'fire-extinguisher',
        onSelect = function()
            print('Did you drop them')
        end
        }
    }
})
  
lib.addRadialItem({
    { -- menu: work_menu
        id = 'work',
        label = 'Work',
        icon = 'briefcase',
        menu = 'work_menu',
        onSelect = function()
        print("work")
        end
    },
    { -- menu: user_menu 
        id = 'user',
        label = 'User',
        icon = 'user',
        menu = 'user_menu',
        onSelect = function()
        print("user")
        end
    },
    { -- menu: alert_menu
        id = 'alert',
        label = 'Emergency',
        icon = 'shield-halved',
        menu = 'alert_menu',
        onSelect = function()
        print("alert")
        end
    }
})