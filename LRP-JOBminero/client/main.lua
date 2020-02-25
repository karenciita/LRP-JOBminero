local PlayerData                = {}
ESX                             = nil

local blip1 = {}
local blips = true
local blipActive = true
local mineActive = false
local washingActive = false
local remeltingActive = false
local firstspawn = false
local impacts = 0
local timer = 0
local locations = {


{ ['x'] =2955.14,  ['y'] = 2819.51 , ['z'] = 42.46},
{ ['x'] =2946.94,  ['y'] = 2820.4 , ['z'] = 42.86},
{ ['x'] =2943.53,  ['y'] = 2819.70 , ['z'] = 43.16},
{ ['x'] = 2925.66,  ['y'] = 2812.85,  ['z'] = 44.58},
{ ['x'] = 2952.57,  ['y'] = 2769.48,  ['z'] = 39.04},
{ ['x'] = 2947.37,  ['y'] = 2766.84,  ['z'] = 39.04},
{ ['x'] = 2971.29,  ['y'] = 2776.11,  ['z'] = 38.31},
{ ['x'] =2967.93,  ['y'] = 2774.54,  ['z'] = 38.31},
{ ['x'] =2977.62,  ['y'] = 2791.22,  ['z'] = 40.64},
{ ['x'] =2971.05,  ['y'] = 2799.05,  ['z'] = 41.43},
{ ['x'] =2937.0,  ['y'] = 2773.62,  ['z'] = 39.21},
{ ['x'] =2926.92,  ['y'] = 2790.57,  ['z'] = 40.27},
{ ['x'] =2929.76,  ['y'] = 2787.01,  ['z'] = 39.57},
{ ['x'] =2920.2,  ['y'] = 2799.06,  ['z'] = 41.18},
}

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)  

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



RegisterNetEvent("esxLRP:lavarpiedra")
AddEventHandler("esxLRP:lavarpiedra", function()
    Washing()
end)

RegisterNetEvent("esxLRP:fundirpiedra")
AddEventHandler("esxLRP:fundirpiedra", function()
    Remelting()


end)

RegisterNetEvent('esxLRP:Temporizador')
AddEventHandler('esxLRP:Temporizador', function()
    local timer = 0
    local ped = PlayerPedId()
    
    Citizen.CreateThread(function()
		while timer > -1 do
			Citizen.Wait(150)

			if timer > -1 then
				timer = timer + 1
            end
            if timer == 100 then
                break
            end
		end
    end) 





    Citizen.CreateThread(function()
        while true do

    local ped = PlayerPedId()
    
    local lavado2X = 1182.2
    local lavado2Y = -204.13
    local lavado2Z = 53.64

    local lavado3X = 1176.07
    local lavado3Y = -211.26
    local lavado3Z = 53.76

    local lavado4X = 1181.52
    local lavado4Y = -199.37
    local lavado4Z = 53.62

    local FundirRoca2X = 1109.76
    local FundirRoca2Y = -2009.81
    local FundirRoca2Z = 30.98

    local FundirRoca3X = 1085.3
    local FundirRoca3Y = -2001.87
    local FundirRoca3Z = 31.43

    Citizen.Wait(10)

            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.WashingX, Config.WashingY, Config.WashingZ, true) < 1.5 then
                Draw3DText(Config.WashingX, Config.WashingY, Config.WashingZ-2.0, (' Lavado de roca en progreso ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            --Draw3DText 
            end


----### LAVADO2 SIN BLIP
            if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado2X, lavado2Y, lavado2Z, true) < 1.5 then
                Draw3DText(lavado2X, lavado2Y, lavado2Z-2.0, (' Lavado de roca en progreso ~g~ '.. timer .. '%'), 4, 0.1, 0.1)
            end
----### FIN LAVADO2 SIN BLIP

----### LAVADO3 SIN BLIP
            if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado3X, lavado3Y, lavado3Z, true) < 1.5 then
                Draw3DText(lavado3X, lavado3Y, lavado3Z-2.0, (' Lavado de roca en progreso ~g~'.. timer .. '%'), 4, 0.1, 0.1)
            end
----### FIN LAVADO3 SIN BLIP

----### LAVADO4 SIN BLIP
            if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado4X, lavado4Y, lavado4Z, true) < 1.5 then
                Draw3DText(lavado4X, lavado4Y, lavado4Z-2.0, (' Lavado de roca en progreso ~g~'.. timer .. '%'), 4, 0.1, 0.1)
            end
----### FIN LAVADO4 SIN BLIP

----###FUNDICION DE ROCA

----### FUNDICION DE ROCA LAVADA CON BLIP
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, true) < 1.5 then
                Draw3DText(Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ-2.0, (' Extrayendo Minerales de la roca lavada ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end
----### FIN FUNDICION DE ROCA LAVADA CON BLIP

----### FUNDICION 2 DE ROCA LAVADA SIN BLIP
            if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca2X, FundirRoca2Y, FundirRoca2Z, true) < 1.5 then
                Draw3DText(FundirRoca2X, FundirRoca2Y, FundirRoca2Z-2.0, (' Extrayendo Minerales de la roca lavada ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end
----### FIN FUNDICION 2DE ROCA LAVADA

----### FUNDICION 3 DE ROCA LAVADA SIN BLIP
            if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca3X, FundirRoca3Y, FundirRoca3Z, true) < 1.5 then
                Draw3DText(FundirRoca3X, FundirRoca3Y, FundirRoca3Z-2.0, (' Extrayendo Minerales de la roca lavada ~g~ ' .. timer .. '%'), 4, 0.1, 0.1)
            end
----### FIN FUNDICION 3 DE ROCA LAVADA

            if timer == 100 then
                timer = 0
                break
            end
        end
    end)
end)


RegisterNetEvent('esxLRP:creadorblipminero')
AddEventHandler('esxLRP:creadorblipminero', function()
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(1)
                if blips == true and blipActive == false then
                    blip1 = AddBlipForCoord(Config.MinerX, Config.MinerY, Config.MinerZ)
                    blip2 = AddBlipForCoord(Config.WashingX, Config.WashingY, Config.WashingZ)
                    blip3 = AddBlipForCoord(Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ)
                    blip4 = AddBlipForCoord(Config.SellX, Config.SellY, Config.SellZ)
                  
                    SetBlipSprite(blip1, 365)
                    SetBlipColour(blip1, 5)
                     SetBlipScale(blip1,1.7)
                    SetBlipAsShortRange(blip1, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Piedra")
                    EndTextCommandSetBlipName(blip1)  
                  

                    SetBlipSprite(blip2, 365)
                    SetBlipColour(blip2, 5)
                    SetBlipScale(blip2,1.7)
                    SetBlipAsShortRange(blip2, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Lavado Piedra")
                    EndTextCommandSetBlipName(blip2)   
                    SetBlipSprite(blip3, 365)
                    SetBlipColour(blip3, 5)
                    SetBlipScale(blip3,1.7)
                    SetBlipAsShortRange(blip3, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Fundicion Piedra")
                    EndTextCommandSetBlipName(blip3)
                    SetBlipSprite(blip4, 272)
                    SetBlipColour(blip4, 5)
                    SetBlipAsShortRange(blip4, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Venta Joyas")
                    EndTextCommandSetBlipName(blip4)    
                    blipActive = true
                elseif blips == false and blipActive == false then
                 RemoveBlip(blip1)
                    RemoveBlip(blip2)
                    RemoveBlip(blip3)
                end
        end
    end)
end)

Citizen.CreateThread(function()
    blip1ve = AddBlipForCoord(Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ)
    SetBlipSprite(blip1ve, 365)
    SetBlipColour(blip1ve, 5)
     SetBlipScale(blip1ve,1.7)
    SetBlipAsShortRange(blip1ve, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Minero")
    EndTextCommandSetBlipName(blip1ve)   
end)



    


Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
    local coords = GetEntityCoords(PlayerPedId()) 
        Citizen.Wait(1)
           -- if PlayerData.job ~= nil and PlayerData.job.name == 'miner' and not IsEntityDead( ped ) then
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, true) < 25 then
                    DrawMarker(25, Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ-0.95, 0, 0, 0, 0, 0, 90.0, 2.0, 2.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)
                                   
                                   if GetDistanceBetweenCoords(coords,  Config.CloakroomX,Config.CloakroomY,Config.CloakroomZ, true) < 4.0 then
                                         DrawText3Ds(vector3(Config.CloakroomX,Config.CloakroomY,Config.CloakroomZ), "Presiona [E] entrar al vestuario", 0.35)    
                                    end    
   
                        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.CloakroomX, Config.CloakroomY, Config.CloakroomZ, true) < 1 then
                            ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ para abrir el menu.')
                                if IsControlJustReleased(1, 51) then
                                    Cloakroom() 
                                end
                         end
                       
                  end
                   
           --   end
                
      end
     end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
            for i=1, #locations, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 25 and mineActive == false then
                DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
            --  DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)


                    if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 1 then
                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para minar.")
                            if IsControlJustReleased(1, 51) then
                                Animation()
                                mineActive = true
                            end
                        end
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do

    local ped = PlayerPedId()

    local lavado2X = 1182.2
    local lavado2Y = -204.13
    local lavado2Z = 53.64

    local lavado3X = 1176.07
    local lavado3Y = -211.26
    local lavado3Z = 53.76

    local lavado4X = 1181.52
    local lavado4Y = -199.37
    local lavado4Z = 53.62

        Citizen.Wait(1)
       
        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.WashingX, Config.WashingY, Config.WashingZ, true) < 25 and washingActive == false then
            DrawMarker(20, Config.WashingX, Config.WashingY, Config.WashingZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.WashingX, Config.WashingY, Config.WashingZ, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para lavar roca ")
                        if IsControlJustReleased(1, 51) then
                            TriggerServerEvent("esxLRP:lavarpiedra")
                end
            end
        end
---## SEGUNDO PUNTO DE LAVADO SIN BLIP ##---
        if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado2X, lavado2Y, lavado2Z, true) < 25 and washingActive == false then
            DrawMarker(20, lavado2X, lavado2Y, lavado2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado2X, lavado2Y, lavado2Z, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para lavar roca ")
                        if IsControlJustReleased(1, 51) then
                            TriggerServerEvent("esxLRP:lavarpiedra")
                end
            end
        end
---## FIN SEGUNDO PUNTO DE LAVADO SIN BLIP ##---

---## TERCER PUNTO DE LAVADO SIN BLIP ##---
        if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado3X, lavado3Y, lavado3Z, true) < 25 and washingActive == false then
            DrawMarker(20, lavado3X, lavado3Y, lavado3Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado3X, lavado3Y, lavado3Z, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para lavar roca ")
                        if IsControlJustReleased(1, 51) then
                            TriggerServerEvent("esxLRP:lavarpiedra")
                end
            end
        end
---## FIN TERCER PUNTO DE LAVADO SIN BLIP ##---

---## CUARTO PUNTO DE LAVADO SIN BLIP ##---
        if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado4X, lavado4Y, lavado4Z, true) < 25 and washingActive == false then
            DrawMarker(20, lavado4X, lavado4Y, lavado4Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), lavado4X, lavado4Y, lavado4Z, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para lavar roca ")
                        if IsControlJustReleased(1, 51) then
                            TriggerServerEvent("esxLRP:lavarpiedra")
                end
            end
        end
---## CUARTO PUNTO  DE LAVADO SIN BLIP ##---


    end
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
     Citizen.Wait(1)

    local FundirRoca2X = 1109.76
    local FundirRoca2Y = -2009.81
    local FundirRoca2Z = 30.98

    local FundirRoca3X = 1085.3
    local FundirRoca3Y = -2001.87
    local FundirRoca3Z = 31.43

        if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, true) < 25 and remeltingActive == false then
            DrawMarker(20, Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para fundir rocas")
                        if IsControlJustReleased(1, 51) then
                          TriggerServerEvent("esxLRP:fundirpiedra")  
                    end
                end
            end


               if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca2X, Config.RemeltingY, FundirRoca2Z, true) < 25 and remeltingActive == false then
            DrawMarker(20, FundirRoca2X, FundirRoca2Y, FundirRoca2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca2X, FundirRoca2Y, FundirRoca2Z, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para fundir rocas")
                        if IsControlJustReleased(1, 51) then
                          TriggerServerEvent("esxLRP:fundirpiedra")  
                    end
                end
            end


        if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca3X, Config.RemeltingY, FundirRoca3Z, true) < 25 and remeltingActive == false then
            DrawMarker(20, FundirRoca3X, FundirRoca3Y, Config.RemeltingZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 1, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), FundirRoca3X, FundirRoca3Y, FundirRoca3Z, true) < 1 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ para fundir rocas")
                        if IsControlJustReleased(1, 51) then
                          TriggerServerEvent("esxLRP:fundirpiedra")  
                    end
                end
            end


        end
    end)



DrawText3Ds = function(coords, text, scale)
    local x,y,z = coords.x, coords.y, coords.z
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 420

    DrawRect(_x, _y + 0.0115, 0.032 + factor, 0.033, 41, 11, 41, 100)
end





Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
    local coords = GetEntityCoords(PlayerPedId()) 
        Citizen.Wait(1)

     
     if GetDistanceBetweenCoords(coords,Config.SellX,Config.SellY,Config.SellZ, true) < 2.0 then
      DrawText3Ds(vector3(Config.SellX,Config.SellY,Config.SellZ+0.90), "Presiona [E] Vender tus joyas", 0.35)
        
     end     
     if GetDistanceBetweenCoords(coords, Config.Sell2X,Config.Sell2Y,Config.Sell2Z, true) < 2.0 then
      DrawText3Ds(vector3(Config.Sell2X,Config.Sell2Y,Config.Sell2Z+0.90), "Presiona [E] Vender tus joyas", 0.35)
        
     end          

     if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellX,  Config.SellY, Config.SellZ, true) < 25 then
          DrawMarker(25,Config.SellX,Config.SellY, Config.SellZ, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellX, Config.SellY, Config.SellZ, true) < 2 then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ Para vender joyas ")
                    if IsControlJustReleased(1, 51) then
                        Jeweler()                          
            end
        end
    end
    ---###VENTA DE JOYAS SIN BLIP
     if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Sell2X,  Config.Sell2Y, Config.Sell2Z, true) < 25 then
          DrawMarker(25,Config.Sell2X,Config.Sell2Y, Config.Sell2Z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 100, 0, 0, 2, 0, 0, 0, 0)

            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.Sell2X, Config.Sell2Y, Config.Sell2Z, true) < 2 then
                ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ Para vender joyas ")
                    if IsControlJustReleased(1, 51) then
                        Jeweler()                          
            end
        end
    end
    --- FIN ###VENTA DE JOYAS SIN BLIP




    end
 end)
    

--Citizen.CreateThread(function()
  --  local hash = GetHashKey("ig_natalia")

  --  if not HasModelLoaded(hash) then
  --      RequestModel(hash)
  --      Citizen.Wait(100)
 --   end
--
  --  while not HasModelLoaded(hash) do
  --      Citizen.Wait(0)
  --  end

  --  if firstspawn == false then
  --      local npc = CreatePed(6, hash, Config.SellX, Config.SellY, Config.SellZ, 129.0, false, false)
   --     SetEntityInvincible(npc, true)
   --     FreezeEntityPosition(npc, true)
    --    SetPedDiesWhenInjured(npc, false)
    --    SetPedCanRagdollFromPlayerImpact(npc, false)
   --     SetPedCanRagdoll(npc, false)
    --    SetEntityAsMissionEntity(npc, true, true)
   --     SetEntityDynamic(npc, true)
   -- end
  --end)



function Cloakroom()
    local elements = {
        {label = '<span style="color:red;"> Desactivar Blips 1ro </span>',   value = 'desactivar'},
        {label = '<span style="color:green;">Activar Blips 2do  </span>',      value = 'activar'},
        {label = 'Carro de TRabajo',       value = 'vehicle'},
         {label = 'Salir Menu',         value = 'Salir'},
    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'miner_actions', {
        title    = 'Miner',
        align    = 'top-right',
        elements = elements
    }, function(data, menu)
       
        if data.current.value == 'desactivar' then
           menu.close()
            blips = false
            blipActive = false
            TriggerEvent("esxLRP:creadorblipminero")

        elseif data.current.value == 'activar' then
            menu.close()
                blips = true
                TriggerEvent("esxLRP:creadorblipminero")
      
elseif data.current.value == 'Salir' then
 menu.close()


        elseif data.current.value == 'vehicle' then
            menu.close()
            RequestModel(Config.Vehiculo)
            Citizen.Wait(100)
            CreateVehicle(Config.Vehiculo, Config.VehiclespawnX, Config.VehiclespawnY, Config.VehiclespawnZ, Config.VehiclespawnH, true, true)
           
           --ESX.ShowNotification("The vehicle was pulled out of the garage.")
            exports['mythic_notify']:DoCustomHudText('cajaverde', ' Vehiculo de trabaja se te fue dado. ',5000)
            Citizen.Wait(100)
            exports['mythic_notify']:DoCustomHudText('cajaroja', ' Procura no sacar muchos vehiculos ',3500)

        end
    end)
end

function Jeweler()
    local elements = {
        {label = 'Venta Diamante &nbsp;&nbsp;<span style="color:#06E931;"> ' ..Config.DiamondPrice ..'$</span>'  ,   value = 'diamonds'},
        {label = 'Venta Oro     &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<span style="color:#06E931;"> ' ..Config.GoldPrice ..'$</span>' ,      value = 'gold'},
        {label = 'Venta Hierro     &nbsp;&nbsp; &nbsp;&nbsp;<span style="color:#06E931;"> ' ..Config.IronPrice ..'$</span>' ,       value = 'iron'},
        {label = 'Venta Cobre    &nbsp; &nbsp;&nbsp;&nbsp;<span style="color:#06E931;"> ' ..Config.CopperPrice ..'$</span>' ,       value = 'copper'},
        {label = 'Salir   &nbsp;&nbsp;<span style="color:#EA1313;"> Cerrar Ventana</span>' ,       value = 'Salir'},

    }

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jeweler_actions', {
        title    = ' Venta de Joyas ',
        align    = 'top-right',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'diamonds' then
            --menu.close()
            TriggerServerEvent("esxLRP:VentaDiamante")
        elseif data.current.value == 'gold' then
            --menu.close()
            TriggerServerEvent("esxLRP:VentaOro")
        elseif data.current.value == 'iron' then
           -- menu.close()
            TriggerServerEvent("esxLRP:VentaHierro")
        elseif data.current.value == 'copper' then
           -- menu.close()
            TriggerServerEvent("esxLRP:VentaCobre")

        elseif data.current.value == 'Salir' then
         menu.close()
        end
    end)
end

function Animation()
    Citizen.CreateThread(function()
        while impacts < 3 do
            Citizen.Wait(1)
		local ped = PlayerPedId()	
                RequestAnimDict("melee@large_wpn@streamed_core")
                Citizen.Wait(100)
                TaskPlayAnim((ped), 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
                SetEntityHeading(ped, 270.0)

                TriggerServerEvent('InteractSound_SV:PlayOnSource', 'pickaxe', 4.0)
                if impacts == 0 then
                    pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
                    AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
                end  
                Citizen.Wait(2500)
                ClearPedTasks(ped)
                impacts = impacts+1
                if impacts == 3 then
                    DetachEntity(pickaxe, 1, true)
                    DeleteEntity(pickaxe)
                    DeleteObject(pickaxe)
                    mineActive = false
                    impacts = 0
                    TriggerServerEvent("esxLRP:darpiedra")
                    break
                end        
        end
    end)
end

function Washing()
    local ped = PlayerPedId()
    --RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    RequestAnimDict("amb@world_human_gardener_plant@male@idle_a")
    washingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
   -- TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
   TaskPlayAnim((ped), 'amb@world_human_gardener_plant@male@idle_a', 'idle_b', 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    TriggerEvent("esxLRP:Temporizador")
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    washingActive = false
end

function Remelting()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    remeltingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
 TriggerEvent("esxLRP:Temporizador")

TriggerServerEvent('InteractSound_SV:PlayOnSource', 'rocafundida', 4.0)

    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    remeltingActive = false
end

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100 


    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()   

end

DrawText3Ds = function(coords, text, scale)
    local x,y,z = coords.x, coords.y, coords.z
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)

    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 420

    DrawRect(_x, _y + 0.0115, 0.032 + factor, 0.033, 41, 11, 41, 100)
end
