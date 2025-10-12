local server1 = ipv4 .. ":5000"
local server2 = ipv4 .. ":6000"
local Workspace = game:GetService('Workspace')
print("[DEBUG] Workspace service initialized")
local Lighting = game:GetService('Lighting')
print("[DEBUG] Lighting service initialized")
local Players = game:GetService('Players')
print("[DEBUG] Players service initialized")
local Terrain = Workspace:FindFirstChild('Terrain')
print("[DEBUG] Terrain found: " .. tostring(Terrain))
local RenderSettings = settings():GetService("RenderSettings")
print("[DEBUG] RenderSettings service initialized")
local RunService = game:GetService("RunService")
print("[DEBUG] RunService initialized")
--Services
local HttpService = game:GetService("HttpService")
print("[DEBUG] HttpService initialized")
local request = http_request or request or HttpPost or syn.request
print("[DEBUG] HTTP request function set")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
print("[DEBUG] ReplicatedStorage initialized")
local GroupService = game:GetService("GroupService")
print("[DEBUG] GroupService initialized")
local Stats = game:GetService("Stats")
print("[DEBUG] Stats service initialized")
local TweenService = game:GetService("TweenService")
print("[DEBUG] TweenService initialized")
local VirtualUser = game:GetService("VirtualUser")
print("[DEBUG] VirtualUser initialized")
local VirtualInputManager = game:GetService("VirtualInputManager")
print("[DEBUG] VirtualInputManager initialized")
local UserInputService = game:GetService("UserInputService")
print("[DEBUG] UserInputService initialized")

--Module scripts
local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))
print("[DEBUG] MainModule loaded from ReplicatedStorage")

--Consts
local PLAYER = Players.LocalPlayer
print("[DEBUG] LocalPlayer: " .. tostring(PLAYER.Name))
local MOUSE = PLAYER:GetMouse()
print("[DEBUG] Mouse initialized for player")
local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
print("[DEBUG] DataFolder found for player")
local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
print("[DEBUG] Inventory found in DataFolder")
local PLAYER_CASH = DATA_FOLDER:WaitForChild("Currency")
print("[DEBUG] Player cash initialized: " .. tostring(PLAYER_CASH.Value))
local INFORMATION = DATA_FOLDER:WaitForChild("Information")
print("[DEBUG] Information folder found in DataFolder")
local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
print("[DEBUG] Original cash amount: " .. tostring(ORIGINAL_CASH_AMOUNT))
local IGNORED = workspace:WaitForChild("Ignored")
print("[DEBUG] Ignored folder found in workspace")
local ATMS = workspace:WaitForChild("Cashiers")
print("[DEBUG] Cashiers folder found in workspace")
local PLAYERS_FOLDER = workspace:WaitForChild("Players")
print("[DEBUG] Players folder found in workspace")
local SHOP = IGNORED:WaitForChild("Shop")
print("[DEBUG] Shop found in Ignored folder")
local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
print("[DEBUG] ItemsDrop found in Ignored folder")
local CASH_DROP = IGNORED:WaitForChild("Drop")
print("[DEBUG] Drop found in Ignored folder")
local SHOPS = SHOP:GetChildren()
print("[DEBUG] Shops found: " .. tostring(#SHOPS))
local SPAWN = IGNORED:WaitForChild("Spawn")
print("[DEBUG] Spawn found in Ignored folder")
local LIGHTS = workspace:WaitForChild("Lights")
print("[DEBUG] Lights found in workspace")
local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
print("[DEBUG] MainEvent found in ReplicatedStorage")

local REQUIRED_ITEMS = {
	["[Knife] - $159"] = 2,
	["[Revolver] - $1379"] = 1,
	["12 [Revolver Ammo] - $80"] = 1,
	["[Key] - $133"] = 1,
}
print("[DEBUG] Required items table initialized")

local REQUIRED_CHAR_PARTS = {
    ["Humanoid"] = true,
    ["HumanoidRootPart"] = true,
    ["UpperTorso"] = true,
    ["LowerTorso"] = true,
    ["Head"] = true,
}
print("[DEBUG] Required character parts table initialized")

Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
print("[DEBUG] Terrain water properties set to 0")
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0
print("[DEBUG] Lighting properties set: GlobalShadows=false, FogEnd=9e9, Brightness=0")

for _, v in ipairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        print("[DEBUG] Set material to Plastic and Reflectance to 0 for: " .. v.Name)
    elseif v:IsA("Decal") or v:IsA("Texture") and v.Parent.Name ~= "Spill" then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
       
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
      
    elseif v:IsA("Explosion") then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
        print("[DEBUG] Removed Explosion: " .. v.Name)
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
        print("[DEBUG] Removed Fire/SpotLight/Smoke: " .. v.Name)
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 0
        v.MeshId = 'rbxassetid://0'
        print("[DEBUG] Set MeshPart properties for: " .. v.Name)
    elseif v:IsA('Model') then
        sethiddenproperty(v, "LevelOfDetail", "Automatic")
        print("[DEBUG] Set LevelOfDetail to Automatic for Model: " .. v.Name)
    end
end

local decalsyeeted = true
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
print("[DEBUG] Secondary terrain and lighting settings applied")

for i, v in ipairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        print("[DEBUG] Secondary check: Set material to Plastic for: " .. v.Name)
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
        print("[DEBUG] Secondary check: Set Transparency to 1 for Decal/Texture: " .. v.Name)
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
        print("[DEBUG] Secondary check: Set Lifetime to 0 for ParticleEmitter/Trail: " .. v.Name)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
        print("[DEBUG] Secondary check: Set Explosion properties for: " .. v.Name)
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
        print("[DEBUG] Secondary check: Disabled Fire/SpotLight/Smoke: " .. v.Name)
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
        print("[DEBUG] Secondary check: Set MeshPart properties for: " .. v.Name)
    end
end

for i, e in ipairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e:remove()
        print("[DEBUG] Removed Lighting effect: " .. e.Name)
    else
        e:remove()
        print("[DEBUG] Removed other Lighting child: " .. e.Name)
    end
end

for _, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA('Seat') or string.lower(v.Name):match('seat') then
        v:remove()
      
    end
end

local player_1234_id = game.Players.LocalPlayer.UserId
print("[DEBUG] Local player UserId: " .. tostring(player_1234_id))

function getAltNumber2(userId)
    local alts = getgenv().alts
    print("[DEBUG] getAltNumber2 called with userId: " .. tostring(userId))
    for i, id in ipairs(alts) do
        if userId == id then
            print("[DEBUG] getAltNumber2 found alt number: " .. i)
            return i
        end
    end
    print("[DEBUG] getAltNumber2: No alt found for userId")
    return false
end

local result = getAltNumber2(player_1234_id)
print("[DEBUG] getAltNumber2 result: " .. tostring(result))

if result == 1 then
    local function makeEverythingInvisible()
        local allParts = game.Workspace:GetDescendants()
      
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
              
            end
        end
    end

    makeEverythingInvisible()
    print("[DEBUG] makeEverythingInvisible executed")

    local feetPlatform = Instance.new("Part")
    feetPlatform.Anchored = true
    feetPlatform.Position = Vector3.new(0, 0, 0)
    feetPlatform.Size = Vector3.new(5, 2, 5)
    feetPlatform.Color = Color3.fromRGB(255, 255, 255)
    feetPlatform.Transparency = 1
    print("[DEBUG] Created feetPlatform at position: " .. tostring(feetPlatform.Position))

    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace
    print("[DEBUG] Created FloorParts folder in workspace")

    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 33, -338)
    newPart.Size = Vector3.new(5, 5, 5)
    newPart.Color = Color3.fromRGB(255, 0, 0)
    newPart.Parent = workspace
    newPart.Transparency = 1
    print("[DEBUG] Created newPart at position: " .. tostring(newPart.Position))

    local spawnedParts = {newPart}
    print("[DEBUG] Added newPart to spawnedParts table")

    print("Platform and new part created successfully.")

    local HttpService = game:GetService("HttpService")
    print("[DEBUG] HttpService reinitialized for main alt")
    local lastReceivedMessage = ""
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local GroupService = game:GetService("GroupService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local TweenService = game:GetService("TweenService")
    local Stats = game:GetService("Stats")
    print("[DEBUG] Services reinitialized for main alt")

    local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))
    print("[DEBUG] MainModule reloaded for main alt")
    local PLAYER = Players.LocalPlayer
    local MOUSE = PLAYER:GetMouse()
    local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
    local INFORMATION = DATA_FOLDER:WaitForChild("Information")
    local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
    local PLAYER_CREW = INFORMATION:FindFirstChild("Crew")
    print("[DEBUG] Player crew: " .. tostring(PLAYER_CREW))
    local PLAYER_CASH = PLAYER.DataFolder:WaitForChild("Currency")
    local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
    local CASHIERS = workspace:WaitForChild("Cashiers")
    local IGNORED = workspace:WaitForChild("Ignored")
    local PLAYERS_FOLDER = workspace:WaitForChild("Players")
    local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
    local SHOP = IGNORED:WaitForChild("Shop")
    local SHOPS = SHOP:GetChildren()
    local SPAWN = IGNORED:WaitForChild("Spawn")
    local LIGHTS = workspace:WaitForChild("Lights")
    local MAP = workspace:WaitForChild("MAP")
    local LOW_GFX_PARTS = {}
    local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
    print("[DEBUG] Workspace objects reinitialized for main alt")

    local TextChatService = game:GetService("TextChatService")
    print("TextChatService loaded")

    local function Chat(text)
        print("[DEBUG] Chat function called with text: " .. tostring(text))
        pcall(function()
            local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel then
                channel:SendAsync(tostring(text))
                print("[DEBUG] Chat message sent to RBXGeneral: " .. text)
            else
                warn("[Chat] RBXGeneral channel not found.")
            end
        end)
    end

    if TextChatService and TextChatService.OnIncomingMessage then
        TextChatService.OnIncomingMessage = function(message)
            print("[DEBUG] OnIncomingMessage triggered")
            if not message or not message.TextSource then
                print("[DEBUG] Invalid message or TextSource")
                return
            end
            local userId = message.TextSource.UserId
            local text = message.Text or ""
            print("[DEBUG] Received message from UserId: " .. tostring(userId) .. ", Text: " .. text)
            if getgenv().mainId and userId == getgenv().mainId then
                local parts = string.split(text, " ")
                if #parts == 0 then
                    print("[DEBUG] Empty message parts")
                    return
                end
                local prefix = parts[1]:sub(1,1)
                if prefix == "/" or prefix == "." then
                    local cmdName = parts[1]:sub(2):lower()
                    local args = {}
                    for i = 2, #parts do
                        table.insert(args, parts[i])
                    end
                    print("[DEBUG] Command received: " .. cmdName .. ", Args: " .. table.concat(args, ", "))
                    if altCommands and altCommands[cmdName] then
                        pcall(function()
                            altCommands[cmdName](Players.LocalPlayer, args)
                            print("[DEBUG] Executed command: " .. cmdName)
                        end)
                    else
                        warn("[Chat] Unknown command: " .. cmdName)
                    end
                end
            end
        end
    else
        warn("[Chat] TextChatService.OnIncomingMessage not available.")
    end

    local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
    local messageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
    print("[DEBUG] DefaultChatSystemChatEvents initialized")

    local PLAYER_GUI = PLAYER:WaitForChild("PlayerGui")
    local CORE_GUI = game.CoreGui
    print("[DEBUG] PlayerGui and CoreGui initialized")

    if CORE_GUI then
        local LowGfxScreenGui = CORE_GUI:FindFirstChild("LowGfxScreenGui")
        if not LowGfxScreenGui then
            LowGfxScreenGui = Instance.new("ScreenGui")
            LowGfxScreenGui.Name = "LowGfxScreenGui"
            LowGfxScreenGui.Enabled = true
            LowGfxScreenGui.IgnoreGuiInset = true
            LowGfxScreenGui.Parent = CORE_GUI
            print("[DEBUG] Created LowGfxScreenGui")

            local LowGfxBackground = Instance.new("Frame")
            LowGfxBackground.Name = "LowGfxBackground"
            LowGfxBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
            LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0)
            LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
            LowGfxBackground.Parent = LowGfxScreenGui
            print("[DEBUG] Created LowGfxBackground")

            local LGFXUIGradient = Instance.new("UIGradient")
            LGFXUIGradient.Name = "LGFXUIGradient"
            LGFXUIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471))
            }
            LGFXUIGradient.Rotation = 290
            LGFXUIGradient.Parent = LowGfxBackground
            print("[DEBUG] Created LGFXUIGradient")

            local LowGfxTitle = Instance.new("TextLabel")
            LowGfxTitle.Name = "LowGfxTitle"
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
            LowGfxTitle.TextColor3 = Color3.new(1, 1, 1)
            LowGfxTitle.BackgroundTransparency = 1
            LowGfxTitle.Size = UDim2.new(0.2, 0, 0.1, 0)
            LowGfxTitle.Position = UDim2.new(0.4, 0, 0.05, 0)
            LowGfxTitle.Font = Enum.Font.SourceSans
            LowGfxTitle.TextScaled = true
            LowGfxTitle.Parent = LowGfxBackground
            print("[DEBUG] Created LowGfxTitle with cash: " .. tostring(PLAYER_CASH.Value))

            PLAYER_CASH.Changed:Connect(function()
                if LowGfxTitle then
                    LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
                    print("[DEBUG] Updated LowGfxTitle to cash: " .. tostring(PLAYER_CASH.Value))
                else
                    print("LowGfxTitle not found")
                end
            end)

            local UsernameLabel = Instance.new("TextLabel")
            UsernameLabel.Name = "UsernameLabel"
            UsernameLabel.Text = PLAYER.Name
            UsernameLabel.TextColor3 = Color3.new(1, 1, 1)
            UsernameLabel.BackgroundTransparency = 1
            UsernameLabel.Size = UDim2.new(0.3, 0, 0.05, 0)
            UsernameLabel.Position = UDim2.new(0.35, 0, 0.12, 0)
            UsernameLabel.Font = Enum.Font.SourceSans
            UsernameLabel.TextScaled = true
            UsernameLabel.Parent = LowGfxBackground
            print("[DEBUG] Created UsernameLabel with text: " .. PLAYER.Name)

            local ProfilePicture = Instance.new("ImageLabel")
            ProfilePicture.Name = "ProfilePicture"
            ProfilePicture.Size = UDim2.new(0.1, 0, 0.1, 0)
            ProfilePicture.Position = UDim2.new(0.45, 0, 0.01, 0)
            ProfilePicture.BackgroundTransparency = 1
            ProfilePicture.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=png&userId="..PLAYER.UserId
            ProfilePicture.Parent = LowGfxBackground
            print("[DEBUG] Created ProfilePicture for UserId: " .. PLAYER.UserId)
        end
        print("LowGfxScreenGui created and enabled")
    else
        print("CORE_GUI not found")
    end

    local function findPlayer(name)
        print("[DEBUG] findPlayer called with name: " .. tostring(name))
        if name then
            if Players:FindFirstChild(name) then
                print("[DEBUG] findPlayer: Found exact match: " .. name)
                return Players[name]
            end
            name = name:lower()
            for _, player in ipairs(Players:GetPlayers()) do
                if name == player.Name:lower():sub(1, #name) then
                    print("[DEBUG] findPlayer: Found partial match: " .. player.Name)
                    return player
                end
            end
        end
        print("[DEBUG] findPlayer: No player found")
        return nil
    end

    local function onPlayerAdded(player)
        print("Player joined: " .. player.Name)
        print("Welcome to the game!")
        local ohString1 = "VIP_CMD"
        local ohString2 = "Summon"
        local ohInstance3 = player
        ReplicatedStorage.MainEvent:FireServer(ohString1, ohString2, ohInstance3)
        print("[DEBUG] Fired MainEvent for player join: " .. player.Name)
    end

    Players.PlayerAdded:Connect(onPlayerAdded)
    print("[DEBUG] Connected onPlayerAdded event")

    local count = 0
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("Decal") and v.Name ~= "face" then
            v:Destroy()
            print("[DEBUG] Destroyed Decal: " .. v.Name)
        end
        if count < 1200 then
            count += 1
        else
            count = 0
            task.wait()
            print("[DEBUG] Task wait triggered after 1200 iterations")
        end
    end

    for part, originalMaterial in pairs(LOW_GFX_PARTS) do
        part.Material = Enum.Material.SmoothPlastic
        print("[DEBUG] Set material to SmoothPlastic for part: " .. part.Name)
        if count < 1200 then
            count += 1
        else
            count = 0
            task.wait()
            print("[DEBUG] Task wait triggered in LOW_GFX_PARTS loop")
        end
    end

    local firstMessage = nil
    local lastReceivedMessage = nil

    local function listenForResponse()
        print("[DEBUG] listenForResponse called")
        local request = http_request or request or HttpPost or syn.request
        local abc123 = "http://" .. server1
        local success, response = pcall(function()
            return request({
                Url = abc123,
                Method = "GET"
            })
        end)

        if success then
            print("[DEBUG] HTTP GET request to " .. abc123 .. " successful")
            if response and response.Success and response.Body then
                print("success")
                local responseData = HttpService:JSONDecode(response.Body)
                local flaskMessage = responseData.reply
                local stopthingy = responseData.stop or false
                print("[DEBUG] Flask message: " .. tostring(flaskMessage) .. ", Stop: " .. tostring(stopthingy))

                if not firstMessage then
                    firstMessage = flaskMessage
                    print("[DEBUG] Set firstMessage: " .. tostring(firstMessage))
                else
                    if flaskMessage ~= lastReceivedMessage then
                        print("flaskMessage: " .. flaskMessage)
                        local firstWord = flaskMessage:match("^%S+")
                        local middleWord = flaskMessage:match("%S+%s*(%S+)%s+%S+$")
                        local lastWord = flaskMessage:match("%S+$")
                        print("[DEBUG] Parsed message - First: " .. tostring(firstWord) .. ", Middle: " .. tostring(middleWord) .. ", Last: " .. tostring(lastWord))
                        lastReceivedMessage = flaskMessage

                        if firstWord ~= "setting" and lastWord ~= "up" then
                            if flaskMessage ~= firstMessage then
                                print("Starting dropmoney")
                                dropMoney(firstWord, middleWord)
                            end
                        end
                    end
                end
            end
        else
            print("Error occurred while making the request to Flask.")
        end
    end

    local function isProtectedPlayer(userId)
        print("[DEBUG] isProtectedPlayer called with userId: " .. tostring(userId))
        for _, id in ipairs(getgenv().alts) do
            if userId == id then
                print("[DEBUG] isProtectedPlayer: User is an alt")
                return true
            end
        end
        for _, id in ipairs(getgenv().dont_kick) do
            if userId == id then
                print("[DEBUG] isProtectedPlayer: User is in dont_kick list")
                return true
            end
        end
        print("[DEBUG] isProtectedPlayer: User is not protected")
        return false
    end

    local currencyPostFixes = {
        ["k"] = 1000,
        ["m"] = 1000000,
        ["b"] = 1000000000,
    }
    local MAX_DURATION = 30
    print("[DEBUG] Currency postfixes and MAX_DURATION initialized")

    local function vipKick(player)
        print("[DEBUG] vipKick called for player: " .. player.Name)
        if player.Parent and not isProtectedPlayer(player.UserId) then
            ReplicatedStorage.MainEvent:FireServer("VIP_CMD", "Kick", player)
            print("[DEBUG] Fired VIP_CMD Kick for player: " .. player.Name)
        end
    end

    function dropMoney(money, name)
        print("[DEBUG] dropMoney called with money: " .. tostring(money) .. ", name: " .. tostring(name))
        local amountString = money
        local limit = tonumber(amountString)
        print("[DEBUG] Initial limit: " .. tostring(limit))

        if not limit then
            for postFix, value in pairs(currencyPostFixes) do
                if string.find(amountString, postFix) then
                    local rawNumberString = string.gsub(amountString, postFix, "")
                    local amountNumber = tonumber(rawNumberString)
                    limit = amountNumber * value
                    print("[DEBUG] Converted amount with postfix " .. postFix .. ": " .. tostring(limit))
                    break
                end
            end
        end

        if limit then
            local playerStartingCash = {}
            for _, player in ipairs(Players:GetPlayers()) do
                playerStartingCash[player.UserId] = player:WaitForChild("DataFolder"):WaitForChild("Currency").Value
                print("[DEBUG] Stored starting cash for player " .. player.Name .. ": " .. tostring(playerStartingCash[player.UserId]))
            end

            local numberOfAltsInGame = countAltsInGame()
            local targetdrop = limit / numberOfAltsInGame
            local timestodrop = targetdrop / 8500
            local roundedTimestoDrop = math.ceil(timestodrop)
            print("[DEBUG] Drop parameters - Alts: " .. numberOfAltsInGame .. ", Target drop: " .. targetdrop .. ", Times to drop: " .. roundedTimestoDrop)

            Chat("Started dropping " .. tostring(money) .. ", for " .. tostring(name), "All")

            local currentValue = 0
            for i = 1, roundedTimestoDrop do
                print("[DEBUG] Drop iteration: " .. i)
                local request = http_request or request or HttpPost or syn.request
                local abc123 = "http://" .. server1
                local success, response = pcall(function()
                    return request({
                        Url = abc123,
                        Method = "GET"
                    })
                end)

                local responseData = HttpService:JSONDecode(response.Body)
                local stopthingy = responseData.stop or false
                print("[DEBUG] Stop condition: " .. tostring(stopthingy))

                if stopthingy then
                    Chat("Stopped dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
                    print("[DEBUG] Stopped money drop due to stop condition")
                    break
                end

                MAIN_EVENT:FireServer("DropMoney", 10000)
                print("[DEBUG] Fired DropMoney event with 10000")
                currentValue = currentValue + 8500
                amountleft(currentValue, numberOfAltsInGame, limit)
                altscash()

                for _, player in ipairs(Players:GetPlayers()) do
                    if not playerStartingCash[player.UserId] then
                        playerStartingCash[player.UserId] = player:WaitForChild("DataFolder"):WaitForChild("Currency").Value
                        print("[DEBUG] Updated starting cash for new player " .. player.Name)
                    end
                end

                local playersWithIncreasedCash = {}
                for _, player in ipairs(Players:GetPlayers()) do
                    if player and player.Parent then
                        local startCash = playerStartingCash[player.UserId]
                        local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                        if currentCash > startCash + 16000 then
                            table.insert(playersWithIncreasedCash, {
                                userId = player.UserId,
                                startCash = startCash,
                                endCash = currentCash
                            })
                            print("[DEBUG] Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                        end
                    end
                end
                writePickingUpToFile(playersWithIncreasedCash)
                wait(16.5)
            end

            local request = http_request or request or HttpPost or syn.request
            local abc123 = "http://" .. server1
            local success, response = pcall(function()
                return request({
                    Url = abc123,
                    Method = "GET"
                })
            end)

            local responseData = HttpService:JSONDecode(response.Body)
            local stopthingy = responseData.stop or false

            if stopthingy then
                local playersWithIncreasedCash = {}
                for _, player in ipairs(Players:GetPlayers()) do
                    if player and player.Parent then
                        local startCash = playerStartingCash[player.UserId]
                        local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                        if currentCash > startCash + 16000 then
                            table.insert(playersWithIncreasedCash, {
                                userId = player.UserId,
                                startCash = startCash,
                                endCash = currentCash
                            })
                            print("[DEBUG] Final check: Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                        end
                    end
                end
                writePickingUpToFile(playersWithIncreasedCash)
                final()
                return
            end

            Chat("Finished dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
            print("[DEBUG] Money drop completed")

            local shoutMessage = "Kindly take a wallet-screenshot with our bots and vouch in the #vouches channel. Thank you for being a valued customer."
            for _ = 1, 15 do
                local playersWithIncreasedCash = {}
                for _, player in ipairs(Players:GetPlayers()) do
                    if player and player.Parent then
                        local startCash = playerStartingCash[player.UserId]
                        local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                        if currentCash > startCash + 16000 then
                            table.insert(playersWithIncreasedCash, {
                                userId = player.UserId,
                                startCash = startCash,
                                endCash = currentCash
                            })
                            print("[DEBUG] Shout loop: Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                        end
                    end
                end
                writePickingUpToFile(playersWithIncreasedCash)

                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", shoutMessage)
                print("[DEBUG] Fired Shout event with message: " .. shoutMessage)

                local request = http_request or request or HttpPost or syn.request
                local abc123 = "http://" .. server1
                local success, response = pcall(function()
                    return request({
                        Url = abc123,
                        Method = "GET"
                    })
                end)

                local responseData = HttpService:JSONDecode(response.Body)
                local stopthingy = responseData.stop or false

                if stopthingy then
                    local playersWithIncreasedCash = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player and player.Parent then
                            local startCash = playerStartingCash[player.UserId]
                            local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                            if currentCash > startCash + 16000 then
                                table.insert(playersWithIncreasedCash, {
                                    userId = player.UserId,
                                    startCash = startCash,
                                    endCash = currentCash
                                })
                                print("[DEBUG] Stop shout loop: Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                            end
                        end
                    end
                    writePickingUpToFile(playersWithIncreasedCash)
                    final()
                    return
                end
                wait(2)
            end

            wait(time_to_wait)

            local countdownTimes = {60, 50, 40, 30, 20, 10, 5}
            for _, timeLeft in ipairs(countdownTimes) do
                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", "Leave the game or you will be kicked in " .. timeLeft .. " seconds")
                print("[DEBUG] Fired Shout event for countdown: " .. timeLeft .. " seconds")

                local playersWithIncreasedCash = {}
                for _, player in ipairs(Players:GetPlayers()) do
                    if player and player.Parent then
                        local startCash = playerStartingCash[player.UserId]
                        local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                        if currentCash > startCash + 16000 then
                            table.insert(playersWithIncreasedCash, {
                                userId = player.UserId,
                                startCash = startCash,
                                endCash = currentCash
                            })
                            print("[DEBUG] Countdown loop: Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                        end
                    end
                end
                writePickingUpToFile(playersWithIncreasedCash)

                local request = http_request or request or HttpPost or syn.request
                local abc123 = "http://" .. server1
                local success, response = pcall(function()
                    return request({
                        Url = abc123,
                        Method = "GET"
                    })
                end)

                local responseData = HttpService:JSONDecode(response.Body)
                local stopthingy = responseData.stop or false

                if stopthingy then
                    local playersWithIncreasedCash = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player and player.Parent then
                            local startCash = playerStartingCash[player.UserId]
                            local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                            if currentCash > startCash + 16000 then
                                table.insert(playersWithIncreasedCash, {
                                    userId = player.UserId,
                                    startCash = startCash,
                                    endCash = currentCash
                                })
                                print("[DEBUG] Stop countdown loop: Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                            end
                        end
                    end
                    writePickingUpToFile(playersWithIncreasedCash)
                    final()
                    return
                end
                wait(10)
            end
            writePickingUpToFile(playersWithIncreasedCash)
            final()

            for _, player in ipairs(Players:GetPlayers()) do
                vipKick(player)
            end
        end
    end

    function countAltsInGame()
        local alts = getgenv().alts
        local count = 0
        print("[DEBUG] countAltsInGame: Checking alts")
        for _, altID in ipairs(alts) do
            local player = game.Players:GetPlayerByUserId(altID)
            if player then
                count = count + 1
                print("[DEBUG] countAltsInGame: Found alt player " .. player.Name)
            end
        end
        print("[DEBUG] countAltsInGame: Total alts found: " .. count)
        return count
    end

    function amountleft(amount, alts, limit)
        print("[DEBUG] amountleft called with amount: " .. amount .. ", alts: " .. alts .. ", limit: " .. limit)
        local ServerURL = "http://" .. server2 .. "/write-amountleft"
        local total = amount * alts
        local data = {
            total = total,
            limit = limit,
            alts = alts
        }
        local json_data = game:GetService("HttpService"):JSONEncode(data)
        local success, response = pcall(function()
            return http_request({
                Url = ServerURL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Content-Length"] = tostring(#json_data)
                },
                Body = json_data
            })
        end)
        if success then
            print("Amount left data sent successfully.")
        else
            print("Error: " .. tostring(response))
        end
    end

    local function isAlt(player)
        print("[DEBUG] isAlt called for player: " .. player.Name)
        local result = table.find(alts, player.UserId)
        print("[DEBUG] isAlt result: " .. tostring(result))
        return result
    end

    local function getCombinedCashOfAltsInGame()
        local totalCash = ORIGINAL_CASH_AMOUNT
        print("[DEBUG] getCombinedCashOfAltsInGame: Starting cash: " .. totalCash)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= PLAYER and isAlt(player) then
                local cash = player:WaitForChild("DataFolder"):WaitForChild("Currency").Value
                totalCash = totalCash + cash
                print("[DEBUG] Added cash for alt " .. player.Name .. ": " .. cash)
            end
        end
        print("[DEBUG] Total combined cash: " .. totalCash)
        return totalCash
    end

    function altscash()
        print("[DEBUG] altscash called")
        local ServerURL = "http://" .. server2 .. "/write-cash"
        local total = getCombinedCashOfAltsInGame()
        local data = {
            cash = total,
        }
        local json_data = game:GetService("HttpService"):JSONEncode(data)
        local success, response = pcall(function()
            return http_request({
                Url = ServerURL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Content-Length"] = #json_data
                },
                Body = json_data
            })
        end)
        if success then
            print("cash data sent successfully.")
        else
            print("Error: " .. tostring(response))
        end
    end

    function final()
        print("[DEBUG] final function called")
        local flaskServerURL = "http://" .. server2 .. "/123-123-false"
        local success, response = pcall(function()
            return request({
                Url = flaskServerURL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({status = "False"})
            })
        end)
        if success then
            if response and response.Success then
                print("Successfully wrote 'False' to pickingup file.")
            else
                print("Error: Failed to write 'False' to pickingup file.")
            end
        else
            print("Error occurred while making the request to Flask server.")
        end
    end

    function writePickingUpToFile(playerData)
        print("[DEBUG] writePickingUpToFile called with playerData: " .. tostring(#playerData) .. " entries")
        local flaskServerURL = "http://" .. server2 .. "/write-pickingup"
        local success, response = pcall(function()
            return request({
                Url = flaskServerURL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode(playerData)
            })
        end)
        if success then
            if response and response.Success then
                print("Successfully sent player data to Flask server.")
            else
                print("Error: Failed to send player data to Flask server.")
            end
        else
            print("Error occurred while making the request to Flask server.")
        end
    end

    function starttimer()
        print("[DEBUG] starttimer called")
        local flaskServerURL = "http://" .. server2 .. "/write-timer"
        local success, response = pcall(function()
            return request({
                Url = flaskServerURL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({status = "False"})
            })
        end)
        if success then
            if response and response.Success then
                print("Successfully started timer.")
            else
                print("Error: Failed to start timer.")
            end
        else
            print("Error occurred while making the request to Flask server.")
        end
    end

    PLAYER.Idled:Connect(function()
        print("[DEBUG] Anti-AFK triggered")
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)

    local function teleport(targetPosition)
        print("[DEBUG] teleport called with position: " .. tostring(targetPosition))
        local character = PLAYER.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
                print("[DEBUG] Teleported to: " .. tostring(targetPosition))
            end
        end
    end

    IGNORED.Drop.ChildAdded:Connect(function(child)
        print("[DEBUG] Drop.ChildAdded triggered for child: " .. child.Name)
        if child:IsA("Part") then
            task.wait(5)
            child.Transparency = 1
            child:WaitForChild("Decal"):Destroy()
            child:WaitForChild("Decal"):Destroy()
            child:WaitForChild("BillboardGui").Enabled = false
            child:Destroy()
            print("[DEBUG] Processed and destroyed dropped part: " .. child.Name)
        end
    end)

    IGNORED.Drop.ChildAdded:Connect(function(v)
        print("[DEBUG] Drop.ChildAdded (hideCash) triggered for: " .. v.Name)
        if hideCash == true and v:IsA("Part") and v.Parent ~= nil then
            v:WaitForChild("Decal"):Destroy()
            v:WaitForChild("Decal"):Destroy()
            v.Transparency = 1
            v:WaitForChild("BillboardGui").Enabled = false
            print("[DEBUG] Hid cash for part: " .. v.Name)
        else
            v:WaitForChild("Decal"):Destroy()
            v:WaitForChild("Decal"):Destroy()
            print("[DEBUG] Removed decals for part: " .. v.Name)
        end
    end)

    function getAltNumber(userId)
        local alts = getgenv().alts
        print("[DEBUG] getAltNumber called with userId: " .. tostring(userId))
        for i, id in ipairs(alts) do
            if userId == id then
                print("[DEBUG] getAltNumber: Found alt number " .. i)
                return i
            end
        end
        print("[DEBUG] getAltNumber: No alt found")
        return false
    end

    game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("RoleplayModeChange")
    print("[DEBUG] Fired RoleplayModeChange event")

    teleport(Vector3.new(-393.01, 35.75, -338))

    setfpscap(2)
    settings().Rendering.QualityLevel = 1
    UserSettings().GameSettings.MasterVolume = 0
    RunService:Set3dRenderingEnabled(false)
    print("[DEBUG] Set low graphics settings: FPS=2, QualityLevel=1, Volume=0, 3D Rendering disabled")

    while true do
        listenForResponse()
        wait(10)
    end
else
    local function makeEverythingInvisible()
        local allParts = game.Workspace:GetDescendants()
        
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
              
            end
        end
    end

    makeEverythingInvisible()
    print("[DEBUG] makeEverythingInvisible executed for alt")

    local feetPlatform = Instance.new("Part")
    feetPlatform.Anchored = true
    feetPlatform.Position = Vector3.new(0, 0, 0)
    feetPlatform.Size = Vector3.new(5, 2, 5)
    feetPlatform.Color = Color3.fromRGB(255, 255, 255)
    feetPlatform.Transparency = 1
    print("[DEBUG] Created feetPlatform for alt at position: " .. tostring(feetPlatform.Position))

    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace
    print("[DEBUG] Created FloorParts folder for alt")

    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 31.75, -338)
    newPart.Size = Vector3.new(5, 5, 5)
    newPart.Color = Color3.fromRGB(255, 0, 0)
    newPart.Parent = workspace
    newPart.Transparency = 1
    print("[DEBUG] Created newPart for alt at position: " .. tostring(newPart.Position))

    local spawnedParts = {newPart}
    print("[DEBUG] Added newPart to spawnedParts for alt")

    print("Platform and new part created successfully.")

    local HttpService = game:GetService("HttpService")
    local lastReceivedMessage = ""
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local GroupService = game:GetService("GroupService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local TweenService = game:GetService("TweenService")
    local Stats = game:GetService("Stats")
    local ChatService = game:GetService("Chat")
    print("[DEBUG] Services initialized for alt")

    local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))
    local PLAYER = Players.LocalPlayer
    local MOUSE = PLAYER:GetMouse()
    local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
    local INFORMATION = DATA_FOLDER:WaitForChild("Information")
    local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
    local PLAYER_CREW = INFORMATION:FindFirstChild("Crew")
    local PLAYER_CASH = PLAYER.DataFolder:WaitForChild("Currency")
    local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
    local CASHIERS = workspace:WaitForChild("Cashiers")
    local IGNORED = workspace:WaitForChild("Ignored")
    local PLAYERS_FOLDER = workspace:WaitForChild("Players")
    local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
    local SHOP = IGNORED:WaitForChild("Shop")
    local SHOPS = SHOP:GetChildren()
    local SPAWN = IGNORED:WaitForChild("Spawn")
    local LIGHTS = workspace:WaitForChild("Lights")
    local MAP = workspace:WaitForChild("MAP")
    local LOW_GFX_PARTS = {}
    local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
    local CHAT_EVENT = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
    local messageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
    local PLAYER_GUI = PLAYER:WaitForChild("PlayerGui")
    local CORE_GUI = game.CoreGui
    print("[DEBUG] Workspace objects and GUI initialized for alt")

    if CORE_GUI then
        local LowGfxScreenGui = CORE_GUI:FindFirstChild("LowGfxScreenGui")
        if not LowGfxScreenGui then
            LowGfxScreenGui = Instance.new("ScreenGui")
            LowGfxScreenGui.Name = "LowGfxScreenGui"
            LowGfxScreenGui.Enabled = true
            LowGfxScreenGui.IgnoreGuiInset = true
            LowGfxScreenGui.Parent = CORE_GUI
            print("[DEBUG] Created LowGfxScreenGui for alt")

            local LowGfxBackground = Instance.new("Frame")
            LowGfxBackground.Name = "LowGfxBackground"
            LowGfxBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
            LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0)
            LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
            LowGfxBackground.Parent = LowGfxScreenGui
            print("[DEBUG] Created LowGfxBackground for alt")

            local LGFXUIGradient = Instance.new("UIGradient")
            LGFXUIGradient.Name = "LGFXUIGradient"
            LGFXUIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471))
            }
            LGFXUIGradient.Rotation = 290
            LGFXUIGradient.Parent = LowGfxBackground
            print("[DEBUG] Created LGFXUIGradient for alt")

            local LowGfxTitle = Instance.new("TextLabel")
            LowGfxTitle.Name = "LowGfxTitle"
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
            LowGfxTitle.TextColor3 = Color3.new(1, 1, 1)
            LowGfxTitle.BackgroundTransparency = 1
            LowGfxTitle.Size = UDim2.new(0.2, 0, 0.1, 0)
            LowGfxTitle.Position = UDim2.new(0.4, 0, 0.05, 0)
            LowGfxTitle.Font = Enum.Font.SourceSans
            LowGfxTitle.TextScaled = true
            LowGfxTitle.Parent = LowGfxBackground
            print("[DEBUG] Created LowGfxTitle for alt with cash: " .. tostring(PLAYER_CASH.Value))

            PLAYER_CASH.Changed:Connect(function()
                if LowGfxTitle then
                    LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
                    print("[DEBUG] Updated LowGfxTitle for alt to cash: " .. tostring(PLAYER_CASH.Value))
                else
                    print("LowGfxTitle not found")
                end
            end)

            local UsernameLabel = Instance.new("TextLabel")
            UsernameLabel.Name = "UsernameLabel"
            UsernameLabel.Text = PLAYER.Name
            UsernameLabel.TextColor3 = Color3.new(1, 1, 1)
            UsernameLabel.BackgroundTransparency = 1
            UsernameLabel.Size = UDim2.new(0.3, 0, 0.05, 0)
            UsernameLabel.Position = UDim2.new(0.35, 0, 0.12, 0)
            UsernameLabel.Font = Enum.Font.SourceSans
            UsernameLabel.TextScaled = true
            UsernameLabel.Parent = LowGfxBackground
            print("[DEBUG] Created UsernameLabel for alt with text: " .. PLAYER.Name)

            local ProfilePicture = Instance.new("ImageLabel")
            ProfilePicture.Name = "ProfilePicture"
            ProfilePicture.Size = UDim2.new(0.1, 0, 0.1, 0)
            ProfilePicture.Position = UDim2.new(0.45, 0, 0.01, 0)
            ProfilePicture.BackgroundTransparency = 1
            ProfilePicture.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=png&userId="..PLAYER.UserId
            ProfilePicture.Parent = LowGfxBackground
            print("[DEBUG] Created ProfilePicture for alt with UserId: " .. PLAYER.UserId)
        end
        print("LowGfxScreenGui created and enabled")
    else
        print("CORE_GUI not found")
    end

    local function findPlayer(name)
        print("[DEBUG] findPlayer (alt) called with name: " .. tostring(name))
        if name then
            if Players:FindFirstChild(name) then
                print("[DEBUG] findPlayer (alt): Found exact match: " .. name)
                return Players[name]
            end
            name = name:lower()
            for _, player in ipairs(Players:GetPlayers()) do
                if name == player.Name:lower():sub(1, #name) then
                    print("[DEBUG] findPlayer (alt): Found partial match: " .. player.Name)
                    return player
                end
            end
        end
        print("[DEBUG] findPlayer (alt): No player found")
        return nil
    end

    local firstMessage = nil

    local function listenForResponse()
        print("[DEBUG] listenForResponse (alt) called")
        local request = http_request or request or HttpPost or syn.request
        local abc123 = "http://" .. server1
        local success, response = pcall(function()
            return request({
                Url = abc123,
                Method = "GET"
            })
        end)
        if success then
            print("[DEBUG] HTTP GET request (alt) successful")
            if response and response.Success and response.Body then
                local responseData = HttpService:JSONDecode(response.Body)
                local flaskMessage = responseData.reply
                print("[DEBUG] Flask message (alt): " .. tostring(flaskMessage))
                if not firstMessage then
                    firstMessage = flaskMessage
                    print("[DEBUG] Set firstMessage (alt): " .. tostring(firstMessage))
                else
                    if flaskMessage ~= lastReceivedMessage then
                        print("flaskMessage: " .. flaskMessage)
                        local firstWord = flaskMessage:match("^%S+")
                        local middleWord = flaskMessage:match("%S+%s*(%S+)%s+%S+$")
                        local lastWord = flaskMessage:match("%S+$")
                        print("[DEBUG] Parsed message (alt) - First: " .. tostring(firstWord) .. ", Middle: " .. tostring(middleWord) .. ", Last: " .. tostring(lastWord))
                        lastReceivedMessage = flaskMessage
                        if firstWord ~= "setting" and lastWord ~= "up" then
                            if flaskMessage ~= firstMessage then
                                dropMoney(firstWord, middleWord)
                            end
                        end
                    end
                end
            end
        else
            print("Error occurred while making the request to Flask.")
        end
    end

    local function spawnPartsAtPositions(positions)
        print("[DEBUG] spawnPartsAtPositions called with " .. #positions .. " positions")
        local spawnedParts = {}
        for _, position in ipairs(positions) do
            local newPart = Instance.new("Part")
            newPart.Anchored = true
            newPart.Position = position
            newPart.Size = Vector3.new(5, 5, 5)
            newPart.Color = Color3.fromRGB(255, 0, 0)
            newPart.Parent = workspace
            table.insert(spawnedParts, newPart)
            print("[DEBUG] Spawned part at position: " .. tostring(position))
        end
        print("[DEBUG] spawnPartsAtPositions: Created " .. #spawnedParts .. " parts")
        return spawnedParts
    end

    local spawnPositions = {
        Vector3.new(-393.01, 33, -338),
        Vector3.new(-381.01, 33, -338),
        Vector3.new(-369.01, 33, -338),
        Vector3.new(-357.01, 33, -338),
        Vector3.new(-393.01, 33, -325),
        Vector3.new(-381.01, 33, -325),
        Vector3.new(-369.01, 33, -325),
        Vector3.new(-357.01, 33, -325),
        Vector3.new(-393.01, 33, -312),
        Vector3.new(-381.01, 33, -312),
        Vector3.new(-369.01, 33, -312),
        Vector3.new(-357.01, 33, -312),
        Vector3.new(-393.01, 33, -299),
        Vector3.new(-381.01, 33, -299),
        Vector3.new(-369.01, 33, -299),
        Vector3.new(-357.01, 33, -299),
        Vector3.new(-393.01, 33, -286),
        Vector3.new(-381.01, 33, -286),
        Vector3.new(-369.01, 33, -286),
        Vector3.new(-357.01, 33, -286),
        Vector3.new(-393.01, 33, -273),
        Vector3.new(-381.01, 33, -273),
        Vector3.new(-369.01, 33, -273),
        Vector3.new(-357.01, 33, -273),
        Vector3.new(-393.01, 33, -260),
        Vector3.new(-381.01, 33, -260),
        Vector3.new(-369.01, 33, -260),
        Vector3.new(-357.01, 33, -260),
        Vector3.new(-393.01, 33, -247),
        Vector3.new(-381.01, 33, -247),
        Vector3.new(-369.01, 33, -247),
        Vector3.new(-357.01, 33, -247),
        Vector3.new(-393.01, 33, -233),
        Vector3.new(-381.01, 33, -233),
        Vector3.new(-369.01, 33, -233),
        Vector3.new(-357.01, 33, -233),
        Vector3.new(-405.01, 33, -299),
        Vector3.new(-405.01, 33, -286),
        Vector3.new(-405.01, 33, -273),
    }
    local spawnedParts = spawnPartsAtPositions(spawnPositions)

    for i, part in ipairs(spawnedParts) do
        print("Spawned part " .. i .. " position: " .. tostring(part.Position))
    end

    local currencyPostFixes = {
        ["k"] = 1000,
        ["m"] = 1000000,
        ["b"] = 1000000000,
    }

    function dropMoney(money, name)
        print("[DEBUG] dropMoney (alt) called with money: " .. tostring(money) .. ", name: " .. tostring(name))
        local amountString = money
        local limit = tonumber(amountString)
        print("[DEBUG] Initial limit (alt): " .. tostring(limit))
        if not limit then
            for postFix, value in pairs(currencyPostFixes) do
                if string.find(amountString, postFix) then
                    local rawNumberString = string.gsub(amountString, postFix, "")
                    local amountNumber = tonumber(rawNumberString)
                    limit = amountNumber * value
                    print("[DEBUG] Converted amount with postfix " .. postFix .. ": " .. tostring(limit))
                    break
                end
            end
        end

        if limit then
            numberOfAltsInGame = countAltsInGame()
            targetdrop = limit / numberOfAltsInGame
            timestodrop = targetdrop / 8500
            roundedTimestoDrop = math.ceil(timestodrop)
            print("[DEBUG] Drop parameters (alt) - Alts: " .. numberOfAltsInGame .. ", Target drop: " .. targetdrop .. ", Times to drop: " .. roundedTimestoDrop)
            Chat("Started dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
            for i = 1, roundedTimestoDrop do
                print("[DEBUG] Drop iteration (alt): " .. i)
                MAIN_EVENT:FireServer("DropMoney", 10000)
                print("[DEBUG] Fired DropMoney event (alt) with 10000")
                local request = http_request or request or HttpPost or syn.request
                local abc123 = "http://" .. server1
                local success, response = pcall(function()
                    return request({
                        Url = abc123,
                        Method = "GET"
                    })
                end)

                local responseData = HttpService:JSONDecode(response.Body)
                local stopthingy = responseData.stop or false
                print("[DEBUG] Stop condition (alt): " .. tostring(stopthingy))

                if stopthingy then
                    break
                end
                wait(16.5)
            end

            dropToggle = false
            local request = http_request or request or HttpPost or syn.request
            local abc123 = "http://" .. server1
            local success, response = pcall(function()
                return request({
                    Url = abc123,
                    Method = "GET"
                })
            end)

            local responseData = HttpService:JSONDecode(response.Body)
            local stopthingy = responseData.stop or false

            if stopthingy then
                Chat("Stopped dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
                print("[DEBUG] Stopped money drop (alt) due to stop condition")
                return
            end
            Chat("Finished dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
            print("[DEBUG] Money drop completed (alt)")
            wait(30)
        end
    end

    function countAltsInGame()
        local alts = getgenv().alts
        local count = 0
        print("[DEBUG] countAltsInGame (alt): Checking alts")
        for _, altID in ipairs(alts) do
            local player = game.Players:GetPlayerByUserId(altID)
            if player then
                count = count + 1
                print("[DEBUG] countAltsInGame (alt): Found alt player " .. player.Name)
            end
        end
        print("[DEBUG] countAltsInGame (alt): Total alts found: " .. count)
        return count
    end

    PLAYER.Idled:Connect(function()
        print("[DEBUG] Anti-AFK (alt) triggered")
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)

    local function teleport(targetPosition)
        print("[DEBUG] teleport (alt) called with position: " .. tostring(targetPosition))
        local character = PLAYER.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
                print("[DEBUG] Teleported (alt) to: " .. tostring(targetPosition))
            end
        end
    end

    function getAltNumber(userId)
        local alts = getgenv().alts
        print("[DEBUG] getAltNumber (alt) called with userId: " .. tostring(userId))
        for i, id in ipairs(alts) do
            if userId == id then
                print("[DEBUG] getAltNumber (alt): Found alt number " .. i)
                return i
            end
        end
        print("[DEBUG] getAltNumber (alt): No alt found")
        return false
    end

    local teleportPositions = {
        [1] = Vector3.new(-393.01, 36, -338),
        [2] = Vector3.new(-381.01, 36, -338),
        [3] = Vector3.new(-369.01, 36, -338),
        [4] = Vector3.new(-357.01, 36, -338),
        [5] = Vector3.new(-393.01, 36, -325),
        [6] = Vector3.new(-381.01, 36, -325),
        [7] = Vector3.new(-369.01, 36, -325),
        [8] = Vector3.new(-357.01, 36, -325),
        [9] = Vector3.new(-393.01, 36, -312),
        [10] = Vector3.new(-381.01, 36, -312),
        [11] = Vector3.new(-369.01, 36, -312),
        [12] = Vector3.new(-357.01, 36, -312),
        [13] = Vector3.new(-393.01, 36, -299),
        [14] = Vector3.new(-381.01, 36, -299),
        [15] = Vector3.new(-369.01, 36, -299),
        [16] = Vector3.new(-357.01, 36, -299),
        [17] = Vector3.new(-393.01, 36, -286),
        [18] = Vector3.new(-381.01, 36, -286),
        [19] = Vector3.new(-369.01, 36, -286),
        [20] = Vector3.new(-357.01, 36, -286),
        [21] = Vector3.new(-393.01, 36, -273),
        [22] = Vector3.new(-381.01, 36, -273),
        [23] = Vector3.new(-369.01, 36, -273),
        [24] = Vector3.new(-357.01, 36, -273),
        [25] = Vector3.new(-393.01, 36, -260),
        [26] = Vector3.new(-381.01, 36, -260),
        [27] = Vector3.new(-369.01, 36, -260),
        [28] = Vector3.new(-357.01, 36, -260),
        [29] = Vector3.new(-393.01, 36, -247),
        [30] = Vector3.new(-381.01, 36, -247),
        [31] = Vector3.new(-369.01, 36, -247),
        [32] = Vector3.new(-357.01, 36, -247),
        [33] = Vector3.new(-393.01, 36, -233),
        [34] = Vector3.new(-381.01, 36, -233),
        [35] = Vector3.new(-369.01, 36, -233),
        [36] = Vector3.new(-357.01, 36, -233),
        [37] = Vector3.new(-405.01, 36, -299),
        [38] = Vector3.new(-405.01, 36, -286),
        [39] = Vector3.new(-405.01, 36, -273),
    }

    function teleportBasedOnAltNumber(player)
        print("[DEBUG] teleportBasedOnAltNumber called for player: " .. player.Name)
        local userId = PLAYER.UserId
        local altNumber = getAltNumber(userId)
        local position = teleportPositions[altNumber] or Vector3.new(-381.01, 35.75, -286)
        print("[DEBUG] Selected teleport position: " .. tostring(position))
        teleport(position)
    end

    teleportBasedOnAltNumber(PLAYER)
    print("[DEBUG] Executed teleportBasedOnAltNumber")

    setfpscap(2)
    settings().Rendering.QualityLevel = 1
    UserSettings().GameSettings.MasterVolume = 0
    print("[DEBUG] Set low graphics settings for alt: FPS=2, QualityLevel=1, Volume=0")

    while true do
        listenForResponse()
        wait(10)
    end
end
