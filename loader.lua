-- SERVICES
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- CONFIG
local WEBHOOK = "https://discord.com/api/webhooks/1464221554882773015/ftA-3uBbD71H5K_0RsOgJr5nX0lFdMDlCaOQFPHhmzuo-czcDhJQQJmcH5F3bpBCAqxR"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/nofearscripts/flicks/main/main.lua"

-- EXECUTION COUNTER (LOCAL, PERSISTENT)
local player = Players.LocalPlayer
local counterFile = "nofear_exec_" .. player.UserId .. ".txt"
local executions = 0

if isfile and readfile and writefile then
    if isfile(counterFile) then
        executions = tonumber(readfile(counterFile)) or 0
    end
    executions += 1
    writefile(counterFile, tostring(executions))
end

-- SEND WEBHOOK
pcall(function()
    local executor = (identifyexecutor and identifyexecutor()) or "Unknown"

    local data = {
        content = "**Script Executed**",
        embeds = {{
            title = "Execution Log",
            fields = {
                { name = "User", value = player.Name .. " (" .. player.UserId .. ")", inline = true },
                { name = "Executor", value = executor, inline = true },
                { name = "Game", value = tostring(game.PlaceId), inline = true },
                { name = "Execution Count", value = tostring(executions), inline = true }
            },
            timestamp = DateTime.now():ToIsoDate()
        }}
    }

    local body = HttpService:JSONEncode(data)

    local req = syn and syn.request
        or http_request
        or request

    if req then
        req({
            Url = WEBHOOK,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = body
        })
    end
end)

-- LOAD MAIN SCRIPT
loadstring(game:HttpGet(MAIN_SCRIPT))()
