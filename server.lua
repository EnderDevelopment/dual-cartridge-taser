local Config = Config

RegisterNetEvent('taser:activate')
AddEventHandler('taser:activate', function()
    local playerId = source
    local cartridgeCount = GetResourceKvpInt('taser_cartridges_' .. playerId) or Config.Taser.Cartridges
    
    if cartridgeCount > 0 then
        cartridgeCount = cartridgeCount - 1
        SetResourceKvp('taser_cartridges_' .. playerId, tostring(cartridgeCount))
        
        TriggerClientEvent('taser:activate', playerId)
    else
        TriggerClientEvent('chat:addMessage', playerId, {
            color = { 255, 0, 0 },
            multiline = true,
            args = { 'Taser', 'No cartridges left!' }
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.Taser.ReactivationDelay)
        
        for _, playerId in ipairs(GetPlayers()) do
            local cartridgeCount = GetResourceKvpInt('taser_cartridges_' .. playerId) or Config.Taser.Cartridges
            
            if cartridgeCount < Config.Taser.Cartridges then
                SetResourceKvp('taser_cartridges_' .. playerId, tostring(Config.Taser.Cartridges))
                TriggerClientEvent('taser:reactivate', playerId)
            end
        end
    end
end)