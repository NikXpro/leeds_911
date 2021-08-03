LEEDS.Keys = {};
local Keys = LEEDS.Keys;

function Keys.Register(Controls, ControlName, Description, Print, Action)
    local _Keys = {
        CONTROLS = Controls
    }
    RegisterKeyMapping(string.format('+leeds-%s', ControlName), Description, "keyboard", Controls)
    RegisterCommand(string.format('+leeds-%s', ControlName), function(source, args)
        if (Action ~= nil) then
            Action();
        end
    end, false)
    return setmetatable(_Keys, LEEDS.Keys)
end

function Keys.HoldRegister(Controls, ControlName, Description, Print, Action, Time)
    local _Keys = {
        [ControlName] = true
    }

    RegisterKeyMapping(string.format('+leeds-%s', ControlName), Description, "keyboard", Controls)
    RegisterCommand(string.format('+leeds-%s', ControlName), function(source, args)
        if (Action ~= nil) then
            _Keys[ControlName] = true
            Citizen.CreateThread(function()
                while _Keys[ControlName] do
                    Action()
                    Citizen.Wait(Time)
                end
            end)
        end
    end, false)
    
    RegisterCommand(string.format('-leeds-%s', ControlName), function(source, args)
        _Keys[ControlName] = false
    end, false)
end