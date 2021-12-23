LEEDS.Discord = {};
local Discord = LEEDS.Discord;

local link = {
    anticheat = "https://discord.com/api/webhooks/923694624181202974/MyRULBj0F2kRzq4-AqUJIR3iPzjrtzurXPmcGPFgFlntXYAykAwtgOAdPEYirI2-jxCh"
}


function Discord.SendWebhook(webhookLink, webhook, customUsername, avatar)
    local embedMsg = webhook
    PerformHttpRequest(webhookLink, function(err, text, headers)
    end, 'POST', json.encode({username = customUsername, avatar_url = avatar, embeds = webhook}), {['Content-Type'] = 'application/json'})
end

function Discord.SendAnticheat(source, type, data)
    exports['screenshot-basic']:requestClientScreenshotUpload(source, "http://localhost:3555/upload", "files[]", {fileName = "screenshot"}, function(err, image)
        print('err', err)
        local timesTemp = os.date("%c")
        local resp = json.decode(image)
        local embed = {}
        embed = {
            {
                ["title"] = "",
                ["color"] = 8912899,
                ["description"] = "",
                ["timestamp"] = timesTemp,
                ["author"] = {
                    ["name"] = "ANTICHEAT - Trigger injection",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/842450821194711040/922667741381541968/Logopit_1640051166789.png"
                },
                --["thumbnail"] = {
                --    ["url"] = "http://localhost:3555/screenshot.jpg"
                --},
                ["footer"] = {
                    ["text"] = "ANTICHEAT - Trigger injection",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/842450821194711040/922667741381541968/Logopit_1640051166789.png"
                },
                ["fields"] = {
                    {
                        ["name"] = "Username:",
                        ["value"] = LEEDS.PlayerList[source].username,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "License:",
                        ["value"] = LEEDS.PlayerList[source].license,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Trigger:",
                        ["value"] = "```\n"..data.trigger.."```",
                        ["inline"] = false
                    },
                }
            },
        }
        LEEDS.Discord.SendWebhook(link.anticheat, embed, "LEEDS ROBOT", "https://cdn.discordapp.com/attachments/842450821194711040/922667741381541968/Logopit_1640051166789.png")
    end)

end
