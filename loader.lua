-- SERVICES
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- CONFIG
local WEBHOOK = "https://discord.com/api/webhooks/1464221554882773015/ftA-3uBbD71H5K_0RsOgJr5nX0lFdMDlCaOQFPHhmzuo-czcDhJQQJmcH5F3bpBCAqxR"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/nofearscripts/flicks/main/main.lua"

-- PLAYER INFO
local player = Players.LocalPlayer
local executor = (identifyexecutor and identifyexecutor()) or "Unknown"

-- EXECUTION COUNTER (LOCAL)
local executions = 1
local counterFile = "nofear_exec_" .. player.UserId .. ".txt"

if isfile and readfile and writefile then
    if isfile(counterFile) then
        executions = tonumber(readfile(counterFile)) or 0
        executions += 1
    end
    writefile(counterFile, tostring(executions))
end

-- SEND DISCORD WEBHOOK
pcall(function()
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

    local req =
        (syn and syn.request)
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
local success, result = pcall(function()
    return loadstring(game:HttpGet(MAIN_SCRIPT))()
end)

if not success then
    warn("[NoFear Loader] Failed to load main script:", result)
end
