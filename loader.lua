local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local WEBHOOK = https://discordapp.com/api/webhooks/1464221554882773015/ftA-3uBbD71H5K_0RsOgJr5nX0lFdMDlCaOQFPHhmzuo-czcDhJQQJmcH5F3bpBCAqxR"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/nofearscripts/flicks/main.lua"

pcall(function()
    local player = Players.LocalPlayer
    local executor = (identifyexecutor and identifyexecutor()) or "Unknown"

    local data = {
        content = "**Script Executed**",
        embeds = {{
            title = "Execution Log",
            fields = {
                { name = "User", value = player.Name .. " (" .. player.UserId .. ")", inline = true },
                { name = "Executor", value = executor, inline = true },
                { name = "Game", value = tostring(game.PlaceId), inline = true }
            },
            timestamp = DateTime.now():ToIsoDate()
        }}
    }

    HttpService:PostAsync(
        WEBHOOK,
        HttpService:JSONEncode(data),
        Enum.HttpContentType.ApplicationJson
    )
end)

loadstring(game:HttpGet(MAIN_SCRIPT))()
