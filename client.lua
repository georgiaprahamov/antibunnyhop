local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
            local chance_result = math.random()
            if chance_result < Config.RagdollChance then 
                Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                QBCore.Functions.Notify('ТВЪРДЕ ИЗМОРЕН СИ!', 'error', 2500)
                SetPedToRagdoll(ped, 5000, 1, 2)
            else
                Wait(2000)
            end
        end
    end
end)
