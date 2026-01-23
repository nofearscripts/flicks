--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=game:GetService("HttpService");local v1=game:GetService("Players");local v2="https://discord.com/api/webhooks/1464221554882773015/ftA-3uBbD71H5K_0RsOgJr5nX0lFdMDlCaOQFPHhmzuo-czcDhJQQJmcH5F3bpBCAqxR";local v3="https://raw.githubusercontent.com/nofearscripts/flicks/main/main.lua";local v4=v1.LocalPlayer;local v5="nofear_exec_"   .. v4.UserId   .. ".txt" ;local v6=0;if (isfile and readfile and writefile) then if isfile(v5) then v6=tonumber(readfile(v5)) or 0 ;end v6+=1 writefile(v5,tostring(v6));end pcall(function() local v7=(identifyexecutor and identifyexecutor()) or "Unknown" ;local v8={content="**Script Executed**",embeds={{title="Execution Log",fields={{name="User",value=v4.Name   .. " ("   .. v4.UserId   .. ")" ,inline=true},{name="Executor",value=v7,inline=true},{name="Game",value=tostring(game.PlaceId),inline=true},{name="Execution Count",value=tostring(v6),inline=true}},timestamp=DateTime.now():ToIsoDate()}}};local v9=v0:JSONEncode(v8);local v10=(syn and syn.request) or http_request or request ;if v10 then v10({Url=v2,Method="POST",Headers={["Content-Type"]="application/json"},Body=v9});end end);loadstring(game:HttpGet(v3))();
