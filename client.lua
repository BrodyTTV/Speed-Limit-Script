local speedLimit = 500 -- Adjust the speed limit as needed
local warningDistance = 100 -- Distance at which warning message will start showing in meters

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = GetPlayerPed(-1)
        local playerVehicle = GetVehiclePedIsIn(playerPed, false)

        if playerVehicle ~= 0 then
            local vehicleSpeed = GetEntitySpeed(playerVehicle) * 3.6 

            if vehicleSpeed > speedLimit then
                local vehiclePosition = GetEntityCoords(playerVehicle)
                local playerPosition = GetEntityCoords(playerPed)
                local distance = GetDistanceBetweenCoords(vehiclePosition.x, vehiclePosition.y, vehiclePosition.z, playerPosition.x, playerPosition.y, playerPosition.z, true)

                if distance <= warningDistance then
                    DrawText3D(vehiclePosition.x, vehiclePosition.y, vehiclePosition.z + 1.0, "~r~You are exceeding the speed limit!") -- Change this to your liking.
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
