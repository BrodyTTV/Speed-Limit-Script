local speedLimit = 200
local displayText = true 

RegisterServerEvent('speedlimit:checkSpeed')
AddEventHandler('speedlimit:checkSpeed', function()
    local player = source
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(player), false)
    local speed = GetEntitySpeed(vehicle) * 2.23694 -- Convert speed from m/s to mph
    if speed > speedLimit then
        TriggerClientEvent('speedlimit:exceeded', player, speedLimit)
    end
end)

-- Function to display notification
function DisplayNotification(player, text)
    TriggerClientEvent('chatMessage', player, "[Speed Limit]", {255, 0, 0}, text)
end
