-- importing core functions -- 
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- creating local variables --
local debug = Config.Debug

exports('MI_Network:menu_handler', function(menu, item)
    print(menu, item)
    if debug == true then
        if menu == 'work_menu' and item == 1 then
            print('workmenu_loaded')
        elseif menu == 'user_menu' and item == 1 then
            print('usermenu_loaded')
        elseif menu == 'vehicle_menu' and item == 1 then
            print('vehiclemenu_loaded')
        elseif menu == 'alert_menu' and item == 1 then
            print('alertmenu_loaded')
        elseif menu == 'network_menu' and item == 1 then
            print('networkmenu_loaded')
        end
    end
end)

-- use link to change icons for menu(s)
-- https://fontawesome.com/search?o=r&new=yes&s=thin

-- main radial menu
lib.addRadialItem({
    { -- load network tablet
        id = 'network_menu',
        label = 'MI_Net',
        icon = 'globe',
        menu = 'networkmenu_loaded',
        --onSelect = function()
        --end
    },
    { -- load user radial menu
        id = 'user_menu',
        label = 'User Menu',
        icon = 'user',
        menu = 'usermenu_loaded',
        --onSelect = function()
        --end
    },
    { -- load vehicle radial menu
        id = 'vehicle_menu',
        label = 'Vehicle Menu',
        icon = 'car-side',
        menu = 'vehiclemenu_loaded',
        --onSelect = function()
        --end
    },
    { -- load work radial menu
        id = 'work_menu',
        label = 'Job Menu',
        icon = 'briefcase',
        menu = 'workmenu_loaded',
        --onSelect = function()
        --end
    },
    { -- load alert radial menu
        id = 'alert_menu',
        label = 'Alert Menu',
        icon = 'siren-on',
        menu = 'alertmenu_loaded',
        --onSelect = function()
        --end
    }
})