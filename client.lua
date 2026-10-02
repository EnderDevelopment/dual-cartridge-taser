local Config = Config

local function drawHUD()
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local cartridgeCount = GetResourceKvpInt('taser_cartridges_' .. playerId) or Config.Taser.Cartridges
    
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(Config.Taser.HUD.Scale, Config.Taser.HUD.Scale)
    SetTextColour(Config.Taser.HUD.Color.r, Config.Taser.HUD.Color.g, Config.Taser.HUD.Color.b, Config.Taser.HUD.Color.a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName('Taser: ' .. cartridgeCount .. '/' .. Config.Taser.Cartridges)
    EndTextCommandDisplayText(Config.Taser.HUD.Position.x, Config.Taser.HUD.Position.y)
end

local function activateTaser()
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local cartridgeCount = GetResourceKvpInt('taser_cartridges_' .. playerId) or Config.Taser.Cartridges
    
    if cartridgeCount > 0 then
        SetPedConfigFlag(playerPed, 36, true)
        SetPedConfigFlag(playerPed, 37, true)
        SetPedConfigFlag(playerPed, 38, true)
        
        cartridgeCount = cartridgeCount - 1
        SetResourceKvp('taser_cartridges_' .. playerId, tostring(cartridgeCount))
        
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Taser.ProbeWireDuration)
            SetPedConfigFlag(playerPed, 36, false)
            SetPedConfigFlag(playerPed, 37, false)
            SetPedConfigFlag(playerPed, 38, false)
        end)
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = { 'Taser', 'No cartridges left!' }
        })
    end
end

RegisterCommand('taser', function()
    activateTaser()
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        drawHUD()
    end
end)

RegisterNetEvent('taser:reactivate')
AddEventHandler('taser:reactivate', function()
    local playerId = PlayerId()
    SetResourceKvp('taser_cartridges_' .. playerId, tostring(Config.Taser.Cartridges))
    TriggerEvent('chat:addMessage', {
        color = { 0, 255, 0 },
        multiline = true,
        args = { 'Taser', 'Taser reactivated!' }
    })
end)