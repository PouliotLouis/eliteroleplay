Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1856.10,3679.10,33.7, true ) < 80 then
      ClearAreaOfPeds(1856.10,3679.10,33.7, 58.0, 0)
    end
  end
end)
