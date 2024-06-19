local server1 = ipv4 .. ":5000"
local server2 = ipv4 .. ":6000"
local Workspace = game:GetService('Workspace')
local Lighting = game:GetService('Lighting')
local Players = game:GetService('Players')
local Terrain = Workspace:FindFirstChild('Terrain')
local RenderSettings = settings():GetService("RenderSettings")
local RunService = game:GetService("RunService")
--Services
local HttpService = game:GetService("HttpService")
local request = http_request or request or HttpPost or syn.request
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local GroupService = game:GetService("GroupService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")



--Module scripts
local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))

--Consts
local PLAYER = Players.LocalPlayer
local MOUSE = PLAYER:GetMouse()
local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
local PLAYER_CASH = DATA_FOLDER:WaitForChild("Currency")
local INFORMATION = DATA_FOLDER:WaitForChild("Information")
local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
local IGNORED = workspace:WaitForChild("Ignored")
local ATMS = workspace:WaitForChild("Cashiers")
local PLAYERS_FOLDER = workspace:WaitForChild("Players")
local SHOP = IGNORED:WaitForChild("Shop")
local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
local CASH_DROP = IGNORED:WaitForChild("Drop")
local SHOPS = SHOP:GetChildren()
local SPAWN = IGNORED:WaitForChild("Spawn")
local LIGHTS = workspace:WaitForChild("Lights")
local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
local PLAYER_CASH = PLAYER.DataFolder:WaitForChild("Currency")
local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
local REQUIRED_ITEMS = {
	["[Knife] - $159"] = 2,
	["[Revolver] - $1379"] = 1,
	["12 [Revolver Ammo] - $80"] = 1,
	["[Key] - $133"] = 1,
}
local REQUIRED_CHAR_PARTS = {
    ["Humanoid"] = true,
    ["HumanoidRootPart"] = true,
    ["UpperTorso"] = true,
    ["LowerTorso"] = true,
    ["Head"] = true,
}


Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0

for _, v in ipairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and v.Parent.Name ~= "Spill" then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
    elseif v:IsA("Explosion") then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Parent = game:GetService('Workspace').Terrain
        v:remove()
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 0
        v.MeshId = 'rbxassetid://0'
    elseif v:IsA('Model') then
        sethiddenproperty(v, "LevelOfDetail", "Automatic")
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
for i, v in ipairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in ipairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e:remove()
    else
        e:remove()
    end
end
for _,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA('Seat') or string.lower(v.Name):match('seat') then v:remove() end -- removes all seating in the game (prevents bugs)
end


local player_1234_id = game.Players.LocalPlayer.UserId
function getAltNumber2(userId)
    local alts = getgenv().alts
    for i, id in ipairs(alts) do
        if userId == id then
            return i
        end
    end
    return false
end

local result = getAltNumber2(player_1234_id)
    -- Check if the result is 1 and print "true" if it is
if result == 1 then
    local function makeEverythingInvisible()
        -- Get all parts in the workspace
        local allParts = game.Workspace:GetDescendants()

        -- Iterate through all parts and make them invisible
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end

    makeEverythingInvisible()


    -- Create the platform
    local feetPlatform = Instance.new("Part")
    feetPlatform.Anchored = true
    feetPlatform.Position = Vector3.new(0, 0, 0)
    feetPlatform.Size = Vector3.new(5, 2, 5)
    feetPlatform.Color = Color3.fromRGB(255, 255, 255) -- Set platform color (adjust as needed)
    feetPlatform.Transparency = 1
    -- Create a folder to hold the floor parts
    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace

    -- Create a new part at the specified position
    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 33, -338)
    newPart.Size = Vector3.new(5, 5, 5) -- Adjust the size as needed
    newPart.Color = Color3.fromRGB(255, 0, 0) -- Red color (adjust as needed)
    newPart.Parent = workspace
    newPart.Transparency = 1
    -- Add the new part to a table (if needed)
    local spawnedParts = {newPart} -- Add the new part to a table for further manipulation

    print("Platform and new part created successfully.")









    local HttpService = game:GetService("HttpService")
    local lastReceivedMessage = ""  -- Variable to store the last received message
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local StarterGui = game:GetService("StarterGui")
    local GroupService = game:GetService("GroupService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local TweenService = game:GetService("TweenService")
    local Stats = game:GetService("Stats")
    local ChatService = game:GetService("Chat")
    local HttpService = game:GetService("HttpService")
    local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))
    local PLAYER = Players.LocalPlayer
    local MOUSE = PLAYER:GetMouse()
    local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
    local INFORMATION = DATA_FOLDER:WaitForChild("Information")
    local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
    local PLAYER_CREW = INFORMATION:FindFirstChild("Crew")
    local PLAYER_CASH = PLAYER.DataFolder:WaitForChild("Currency")
    local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
    local REQUIRED_CHAR_PARTS = {
        ["Humanoid"] = true,
        ["HumanoidRootPart"] = true,
        ["UpperTorso"] = true,
        ["LowerTorso"] = true,
        ["Head"] = true,
    }
    local CASHIERS = workspace:WaitForChild("Cashiers")
    local IGNORED = workspace:WaitForChild("Ignored")
    local PLAYERS_FOLDER = workspace:WaitForChild("Players")
    local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
    local SHOP = IGNORED:WaitForChild("Shop")
    local SHOPS = SHOP:GetChildren()
    local SPAWN = IGNORED:WaitForChild("Spawn")
    local LIGHTS = workspace:WaitForChild("Lights")
    local MAP = workspace:WaitForChild("MAP")
    local LOW_GFX_PARTS = {} -- [part] = originalMaterial
    local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
    local CHAT_EVENT = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
    local messageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
    --Gui
    local PLAYER_GUI = PLAYER:WaitForChild("PlayerGui")
    local CORE_GUI = game.CoreGui



    -- Assuming PLAYER is defined and is the current player
    local PLAYER = game.Players.LocalPlayer

    -- Create LowGfxScreenGui (of 'ScreenGui' class) if it doesn't exist
    if CORE_GUI then
        local LowGfxScreenGui = CORE_GUI:FindFirstChild("LowGfxScreenGui")
        if not LowGfxScreenGui then
            LowGfxScreenGui = Instance.new("ScreenGui")
            LowGfxScreenGui.Name = "LowGfxScreenGui"
            LowGfxScreenGui.Enabled = true -- Set to true by default
            LowGfxScreenGui.IgnoreGuiInset = true
            LowGfxScreenGui.Parent = CORE_GUI

            -- Create LowGfxBackground Frame
            local LowGfxBackground = Instance.new("Frame")
            LowGfxBackground.Name = "LowGfxBackground"
            LowGfxBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
            LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0) -- Set background color to black
            LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
            LowGfxBackground.Parent = LowGfxScreenGui

            -- Create LGFXUIGradient UIGradient
            local LGFXUIGradient = Instance.new("UIGradient")
            LGFXUIGradient.Name = "LGFXUIGradient"
            LGFXUIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471))
            }
            LGFXUIGradient.Rotation = 290
            LGFXUIGradient.Parent = LowGfxBackground

            -- Create LowGfxTitle TextLabel
            local LowGfxTitle = Instance.new("TextLabel")
            LowGfxTitle.Name = "LowGfxTitle"
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value) -- Initialize with current cash value
            LowGfxTitle.TextColor3 = Color3.new(1, 1, 1) -- White text color
            LowGfxTitle.BackgroundTransparency = 1 -- No background
            LowGfxTitle.Size = UDim2.new(0.2, 0, 0.1, 0) -- Adjust size as needed
            LowGfxTitle.Position = UDim2.new(0.4, 0, 0.05, 0) -- Centered horizontally, adjust vertically as needed
            LowGfxTitle.Font = Enum.Font.SourceSans
            LowGfxTitle.TextScaled = true
            LowGfxTitle.Parent = LowGfxBackground

            -- Connect the function to update the cash text when it changes
            PLAYER_CASH.Changed:Connect(function()
                if LowGfxTitle then
                    LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
                else
                    print("LowGfxTitle not found")
                end
            end)

            -- Create Username TextLabel
            local UsernameLabel = Instance.new("TextLabel")
            UsernameLabel.Name = "UsernameLabel"
            UsernameLabel.Text = PLAYER.Name -- Set to player's username
            UsernameLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
            UsernameLabel.BackgroundTransparency = 1 -- No background
            UsernameLabel.Size = UDim2.new(0.3, 0, 0.05, 0) -- Adjust size as needed
            UsernameLabel.Position = UDim2.new(0.35, 0, 0.12, 0) -- Centered horizontally below the cash label
            UsernameLabel.Font = Enum.Font.SourceSans
            UsernameLabel.TextScaled = true
            UsernameLabel.Parent = LowGfxBackground

            -- Create ProfilePicture ImageLabel
            local ProfilePicture = Instance.new("ImageLabel")
            ProfilePicture.Name = "ProfilePicture"
            ProfilePicture.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust size as needed
            ProfilePicture.Position = UDim2.new(0.45, 0, 0.01, 0) -- Adjust position as needed
            ProfilePicture.BackgroundTransparency = 1 -- No background
            ProfilePicture.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=png&userId="..PLAYER.UserId -- Get the player's avatar
            ProfilePicture.Parent = LowGfxBackground
        end

        print("LowGfxScreenGui created and enabled")
    else
        print("CORE_GUI not found")
    end




    local function findPlayer(name)
        if name then
            --If they typed the name exactly, then return that
            if Players:FindFirstChild(name) then return Players[name] end

            --Otherwise search for player name match
            name = name:lower()

            for _, player in ipairs(Players:GetPlayers()) do
                if name == player.Name:lower():sub(1, #name) then
                    return player
                end
            end
        end
        return nil
    end


    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Function to handle when a new player joins
    local function onPlayerAdded(player)
        print("Player joined:", player.Name)
        print("Welcome to the game!")
    
        -- Execute provided code for the joined player
        local ohString1 = "VIP_CMD"
        local ohString2 = "Summon"
        local ohInstance3 = player
    
        ReplicatedStorage.MainEvent:FireServer(ohString1, ohString2, ohInstance3)
    
    end
    
    Players.PlayerAdded:Connect(onPlayerAdded)

    -- Assuming PLAYER is defined and is the current player
    local PLAYER = game.Players.LocalPlayer

    -- Create LowGfxScreenGui (of 'ScreenGui' class) if it doesn't exist
    if CORE_GUI then
        local LowGfxScreenGui = CORE_GUI:FindFirstChild("LowGfxScreenGui")
        if not LowGfxScreenGui then
            LowGfxScreenGui = Instance.new("ScreenGui")
            LowGfxScreenGui.Name = "LowGfxScreenGui"
            LowGfxScreenGui.Enabled = true -- Set to true by default
            LowGfxScreenGui.IgnoreGuiInset = true
            LowGfxScreenGui.Parent = CORE_GUI

            -- Create LowGfxBackground Frame
            local LowGfxBackground = Instance.new("Frame")
            LowGfxBackground.Name = "LowGfxBackground"
            LowGfxBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
            LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0) -- Set background color to black
            LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
            LowGfxBackground.Parent = LowGfxScreenGui

            -- Create LGFXUIGradient UIGradient
            local LGFXUIGradient = Instance.new("UIGradient")
            LGFXUIGradient.Name = "LGFXUIGradient"
            LGFXUIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471))
            }
            LGFXUIGradient.Rotation = 290
            LGFXUIGradient.Parent = LowGfxBackground

            -- Create LowGfxTitle TextLabel
            local LowGfxTitle = Instance.new("TextLabel")
            LowGfxTitle.Name = "LowGfxTitle"
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value) -- Initialize with current cash value
            LowGfxTitle.TextColor3 = Color3.new(1, 1, 1) -- White text color
            LowGfxTitle.BackgroundTransparency = 1 -- No background
            LowGfxTitle.Size = UDim2.new(0.2, 0, 0.1, 0) -- Adjust size as needed
            LowGfxTitle.Position = UDim2.new(0.4, 0, 0.05, 0) -- Centered horizontally, adjust vertically as needed
            LowGfxTitle.Font = Enum.Font.SourceSans
            LowGfxTitle.TextScaled = true
            LowGfxTitle.Parent = LowGfxBackground

            -- Connect the function to update the cash text when it changes
            PLAYER_CASH.Changed:Connect(function()
                if LowGfxTitle then
                    LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
                else
                    print("LowGfxTitle not found")
                end
            end)

            -- Create Username TextLabel
            local UsernameLabel = Instance.new("TextLabel")
            UsernameLabel.Name = "UsernameLabel"
            UsernameLabel.Text = PLAYER.Name -- Set to player's username
            UsernameLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
            UsernameLabel.BackgroundTransparency = 1 -- No background
            UsernameLabel.Size = UDim2.new(0.3, 0, 0.05, 0) -- Adjust size as needed
            UsernameLabel.Position = UDim2.new(0.35, 0, 0.12, 0) -- Centered horizontally below the cash label
            UsernameLabel.Font = Enum.Font.SourceSans
            UsernameLabel.TextScaled = true
            UsernameLabel.Parent = LowGfxBackground

            -- Create ProfilePicture ImageLabel
            local ProfilePicture = Instance.new("ImageLabel")
            ProfilePicture.Name = "ProfilePicture"
            ProfilePicture.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust size as needed
            ProfilePicture.Position = UDim2.new(0.45, 0, 0.01, 0) -- Adjust position as needed
            ProfilePicture.BackgroundTransparency = 1 -- No background
            ProfilePicture.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=png&userId="..PLAYER.UserId -- Get the player's avatar
            ProfilePicture.Parent = LowGfxBackground
        end

        print("LowGfxScreenGui created and enabled")
    else
        print("CORE_GUI not found")
    end




    local function makeEverythingInvisible()
        -- Get all parts in the workspace
        local allParts = game.Workspace:GetDescendants()

        -- Iterate through all parts and make them invisible
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end

    makeEverythingInvisible()


    -- Create the platform
    local feetPlatform = Instance.new("Part")
    feetPlatform.Anchored = true
    feetPlatform.Position = Vector3.new(0, 0, 0)
    feetPlatform.Size = Vector3.new(5, 2, 5)
    feetPlatform.Color = Color3.fromRGB(255, 255, 255) -- Set platform color (adjust as needed)
    feetPlatform.Transparency = 1
    -- Create a folder to hold the floor parts
    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace

    -- Create a new part at the specified position
    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 33, -338)
    newPart.Size = Vector3.new(5, 5, 5) -- Adjust the size as needed
    newPart.Color = Color3.fromRGB(255, 0, 0) -- Red color (adjust as needed)
    newPart.Parent = workspace
    newPart.Transparency = 1
    -- Add the new part to a table (if needed)
    local spawnedParts = {newPart} -- Add the new part to a table for further manipulation

    print("Platform and new part created successfully.")













    local count = 0
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("Decal") and v.Name ~= "face" then
            v:Destroy()
        end
        if count < 1200 then
            count += 1
        else
            count = 0
            task.wait()
        end
    end
                    
        
    for part, originalMaterial in pairs(LOW_GFX_PARTS) do
        part.Material = Enum.Material.SmoothPlastic
        if count < 1200 then
            count += 1
        else
            count = 0
            task.wait()
        end
    end




    local firstMessage = nil -- Store the text of the first message received
    local lastReceivedMessage = nil -- Store the text of the last message received
    
    local function listenForResponse()
        local request = http_request or request or HttpPost or syn.request
        local abc123 = "http://" .. server1
        local success, response = pcall(function()
            return request({
                Url = abc123,
                Method = "GET"
            })
        end)
    
        if success then
            if response and response.Success and response.Body then
                print("success") 
                local responseData = HttpService:JSONDecode(response.Body)
                local flaskMessage = responseData.reply
                local stopthingy = responseData.stop or false -- Default value is false if "stop" field is not present
                
 
                
                
    
                if not firstMessage then
                    firstMessage = flaskMessage
                else
                    if flaskMessage ~= lastReceivedMessage then
                        print("flaskMessage", flaskMessage)
                        local firstWord = flaskMessage:match("^%S+") -- Match the first word
                        local middleWord = flaskMessage:match("%S+%s*(%S+)%s+%S+$") -- rock
                        local lastWord = flaskMessage:match("%S+$") -- Match the last word
                        lastReceivedMessage = flaskMessage -- Update the last received message
    
                        -- Check if the first word is not "setting" and the last word is not "up"
                        if firstWord ~= "setting" and lastWord ~= "up" then
                            -- Check if the received message is not equal to the first message
                            if flaskMessage ~= firstMessage then
                                print("Starting dropmoney")
                                dropMoney(firstWord, middleWord)
                            end
                        end
                    end
                end
            end
            -- Do not print anything if the response is empty
        else
            -- Handle the case when there's an error in the request
            print("Error occurred while making the request to Flask.")
        end
    end
    
    
    


    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    local function isProtectedPlayer(userId)
        for _, id in ipairs(getgenv().alts) do
            if userId == id then
                return true
            end
        end
        for _, id in ipairs(getgenv().dont_kick) do
            if userId == id then
                return true
            end
        end
        return false
    end

    -- Define currency postfixes and max duration
    local currencyPostFixes = {
        ["k"] = 1000,
        ["m"] = 1000000,
        ["b"] = 1000000000,
    }
    local MAX_DURATION = 30

    -- Function to handle kicking players with VIP_CMD
    local function vipKick(player)
        if player.Parent and not isProtectedPlayer(player.UserId) then
            ReplicatedStorage.MainEvent:FireServer("VIP_CMD", "Kick", player)
        end
    end

 

    function dropMoney(money, name)
        local amountString = money
        local limit = tonumber(amountString)
        
        -- Check if the money amount is specified with a postfix
        if not limit then
            for postFix, value in pairs(currencyPostFixes) do
                if string.find(amountString, postFix) then
                    local rawNumberString = string.gsub(amountString, postFix, "")
                    local amountNumber = tonumber(rawNumberString)
                    limit = amountNumber * value
                    break
                end
            end
        end

        if limit then
            -- Obtain starting cash for all players
            local playerStartingCash = {}
            for _, player in ipairs(Players:GetPlayers()) do
                playerStartingCash[player.UserId] = player:WaitForChild("DataFolder"):WaitForChild("Currency").Value
            end
        
            -- Calculate drop parameters
            local numberOfAltsInGame = countAltsInGame() -- Number of alts in game
            local targetdrop = limit / numberOfAltsInGame -- 1m divided by number of alts in game
            local timestodrop = targetdrop / 8500 -- You know what it means, right?
            local roundedTimestoDrop = math.ceil(timestodrop)
        
            -- Notify players about the start of the money drop
            CHAT_EVENT:FireServer("Started dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
        
            -- Perform the money drop
            local currentValue = 0  -- Initialize currentValue here
            for i = 1, roundedTimestoDrop do
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
                    CHAT_EVENT:FireServer("Stopped dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
                    break  -- Exit the loop if the stop condition is met
                end
                
                MAIN_EVENT:FireServer("DropMoney", 10000)  -- Fire the server event with a payload of 10000
                currentValue = currentValue + 8500
                amountleft(currentValue, numberOfAltsInGame, limit)
                altscash()

                -- Update playerStartingCash for new players or rejoining players
                for _, player in ipairs(Players:GetPlayers()) do
                    if not playerStartingCash[player.UserId] then
                        playerStartingCash[player.UserId] = player:WaitForChild("DataFolder"):WaitForChild("Currency").Value
                    end
                end

                -- Save cash data during each iteration
                local playersWithIncreasedCash = {}
                for _, player in ipairs(Players:GetPlayers()) do
                    if player and player.Parent then
                        local startCash = playerStartingCash[player.UserId]
                        local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                        if currentCash > startCash + 16000 then  -- Check if cash increase is more than 16,000
                            table.insert(playersWithIncreasedCash, {
                                userId = player.UserId,
                                startCash = startCash,
                                endCash = currentCash
                            })
                        end
                    end
                end
                writePickingUpToFile(playersWithIncreasedCash)
                wait(16.5)  -- Wait for 16.5 seconds before the next iteration
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
                        if currentCash > startCash + 16000 then  -- Check if cash increase is more than 16,000
                            table.insert(playersWithIncreasedCash, {
                                userId = player.UserId,
                                startCash = startCash,
                                endCash = currentCash
                            })
                        end
                    end
                end
                writePickingUpToFile(playersWithIncreasedCash)
                final()
                return
            end


            -- Notify players about the end of the money drop
            CHAT_EVENT:FireServer("Finished dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
            
            -- Final save of cash data
            local playersWithIncreasedCash = {}
            for _, player in ipairs(Players:GetPlayers()) do
                if player and player.Parent then
                    local startCash = playerStartingCash[player.UserId]
                    local currentCash = player:FindFirstChild("DataFolder") and player.DataFolder:FindFirstChild("Currency") and player.DataFolder.Currency.Value or startCash
                    if currentCash > startCash + 16000 then  -- Check if cash increase is more than 16,000
                        table.insert(playersWithIncreasedCash, {
                            userId = player.UserId,
                            startCash = startCash,
                            endCash = currentCash
                        })
                    end
                end
            end
            writePickingUpToFile(playersWithIncreasedCash)
        
            -- Send messages
            local shoutMessage = "Kindly take a wallet-screenshot with our bots and vouch in the #vouches channel. Thank you for being a valued customer."
            for _ = 1, 15 do
                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", shoutMessage)
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
                            if currentCash > startCash + 16000 then  -- Check if cash increase is more than 16,000
                                table.insert(playersWithIncreasedCash, {
                                    userId = player.UserId,
                                    startCash = startCash,
                                    endCash = currentCash
                                })
                            end
                        end
                    end
                    writePickingUpToFile(playersWithIncreasedCash)
                    final()
                    return
                end
                wait(2)
            end
            local amountofalty = countAltsInGame()
            local time_to_wait = 0
            
            if amountofalty >= 18 then
                time_to_wait = 120
            end
            
            wait(time_to_wait)
            
            local countdownTimes = {60, 50, 40, 30, 20, 10, 5}
            for _, timeLeft in ipairs(countdownTimes) do
                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", "Leave the game or you will be kicked in " .. timeLeft .. " seconds")
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
                            if currentCash > startCash + 16000 then  -- Check if cash increase is more than 16,000
                                table.insert(playersWithIncreasedCash, {
                                    userId = player.UserId,
                                    startCash = startCash,
                                    endCash = currentCash
                                })
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

            -- Kick players
            for _, player in ipairs(Players:GetPlayers()) do
                vipKick(player)
            end
        end
    end




        

    




    function countAltsInGame()
        local alts = getgenv().alts
        local count = 0

        -- Iterate through the list of alt IDs
        for _, altID in ipairs(alts) do
            -- Check if the player with the alt ID is in the game
            local player = game.Players:GetPlayerByUserId(altID)
            if player then
                -- If player is found, increment the count
                count = count + 1
            end
        end

        -- Return the count of alts in the game
        return count
    end




    function amountleft(amount, alts, limit)
        local ServerURL = "http://" .. server2 .. "/write-amountleft"
        local total = amount * alts
        
        -- Prepare the data to send in the request body
        local data = {
            total = total,
            limit = limit,
            alts = alts
        }
        
        -- Convert the data to JSON format
        local json_data = game:GetService("HttpService"):JSONEncode(data)
        
        -- Make the HTTP request
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
        
        -- Check if the request was successful
        if success then
            print("Amount left data sent successfully.")
        else
            print("Error:", response)  -- Print the error message if the request failed
        end
    end


    -- Function to check if a player is an alt
    local function isAlt(player)
        return table.find(alts, player.UserId)
    end

    -- Function to calculate and return the combined cash value of alts in the game
    local function getCombinedCashOfAltsInGame()
        local totalCash = ORIGINAL_CASH_AMOUNT
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= PLAYER and isAlt(player) then
            totalCash = totalCash + player:WaitForChild("DataFolder"):WaitForChild("Currency").Value
            end
        end
        return totalCash
    end

    

    function altscash(numberOfAltsInGame)
        local PLAYER_CASH = PLAYER.DataFolder:WaitForChild("Currency")
        local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
        local ServerURL = "http://" .. server2 .. "/write-cash"
        local total = getCombinedCashOfAltsInGame()
        
        -- Prepare the data to send in the request body
        local data = {
            cash = total,
        }
        
        -- Convert the data to JSON format
        local json_data = game:GetService("HttpService"):JSONEncode(data)
        
        -- Make the HTTP request
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
        
        -- Check if the request was successful
        if success then
            print("cash data sent successfully.")
        else
            print("Error:", response)  -- Print the error message if the request failed
        end
    end


    function final()
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

    --Anti-afk
    PLAYER.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)


    local function teleport(targetPosition)
        local character = PLAYER.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
            end
        end
    end


    IGNORED.Drop.ChildAdded:Connect(function(child)
        if child:IsA("Part") then
            task.wait(5)
            child.Transparency = 1
            child:WaitForChild("Decal"):Destroy()
            child:WaitForChild("Decal"):Destroy()
            child:WaitForChild("BillboardGui").Enabled = false
            child:Destroy()
        end
    end)

    --Hide cash
    IGNORED.Drop.ChildAdded:Connect(function(v)
        if hideCash == true and v:IsA("Part") and v.Parent ~= nil then
            v:WaitForChild("Decal"):Destroy()
            v:WaitForChild("Decal"):Destroy()
            v.Transparency = 1
            v:WaitForChild("BillboardGui").Enabled = false
        else
            v:WaitForChild("Decal"):Destroy()
            v:WaitForChild("Decal"):Destroy()
        end
    end)


    function getAltNumber(userId)
        local alts = getgenv().alts
        for i, id in ipairs(alts) do
            if userId == id then
                return i
            end
        end
        return false
    end

    game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("RoleplayModeChange")

    teleport(Vector3.new(-393.01, 35.75, -338))

    setfpscap(2)
    settings().Rendering.QualityLevel = 1
    UserSettings().GameSettings.MasterVolume = 0
    RunService:Set3dRenderingEnabled(false)
    -- Continuously listen for responses from the Flask server every 5 seconds
    while true do
        listenForResponse()
        wait(10)
    end
else

    
    local function makeEverythingInvisible()
        -- Get all parts in the workspace
        local allParts = game.Workspace:GetDescendants()
    
        -- Iterate through all parts and make them invisible
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
    
    makeEverythingInvisible()
    
    
    -- Create the platform
    local feetPlatform = Instance.new("Part")
    feetPlatform.Anchored = true
    feetPlatform.Position = Vector3.new(0, 0, 0)
    feetPlatform.Size = Vector3.new(5, 2, 5)
    feetPlatform.Color = Color3.fromRGB(255, 255, 255) -- Set platform color (adjust as needed)
    feetPlatform.Transparency = 1
    -- Create a folder to hold the floor parts
    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace
    
    -- Create a new part at the specified position
    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 31.75, -338)
    newPart.Size = Vector3.new(5, 5, 5) -- Adjust the size as needed
    newPart.Color = Color3.fromRGB(255, 0, 0) -- Red color (adjust as needed)
    newPart.Parent = workspace
    newPart.Transparency = 1
    -- Add the new part to a table (if needed)
    local spawnedParts = {newPart} -- Add the new part to a table for further manipulation
    
    print("Platform and new part created successfully.")
    
    
    
    
    
    
    
    
    
    local HttpService = game:GetService("HttpService")
    local lastReceivedMessage = ""  -- Variable to store the last received message
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")
    local StarterGui = game:GetService("StarterGui")
    local GroupService = game:GetService("GroupService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local TweenService = game:GetService("TweenService")
    local Stats = game:GetService("Stats")
    local ChatService = game:GetService("Chat")
    local HttpService = game:GetService("HttpService")
    local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))
    local PLAYER = Players.LocalPlayer
    local MOUSE = PLAYER:GetMouse()
    local DATA_FOLDER = PLAYER:WaitForChild("DataFolder")
    local INFORMATION = DATA_FOLDER:WaitForChild("Information")
    local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
    local PLAYER_CREW = INFORMATION:FindFirstChild("Crew")
    local PLAYER_CASH = PLAYER.DataFolder:WaitForChild("Currency")
    local ORIGINAL_CASH_AMOUNT = PLAYER_CASH.Value
    local REQUIRED_CHAR_PARTS = {
        ["Humanoid"] = true,
        ["HumanoidRootPart"] = true,
        ["UpperTorso"] = true,
        ["LowerTorso"] = true,
        ["Head"] = true,
    }
    local CASHIERS = workspace:WaitForChild("Cashiers")
    local IGNORED = workspace:WaitForChild("Ignored")
    local PLAYERS_FOLDER = workspace:WaitForChild("Players")
    local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
    local SHOP = IGNORED:WaitForChild("Shop")
    local SHOPS = SHOP:GetChildren()
    local SPAWN = IGNORED:WaitForChild("Spawn")
    local LIGHTS = workspace:WaitForChild("Lights")
    local MAP = workspace:WaitForChild("MAP")
    local LOW_GFX_PARTS = {} -- [part] = originalMaterial
    local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent")
    local CHAT_EVENT = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    local DefaultChatSystemChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
    local messageDoneFiltering = DefaultChatSystemChatEvents:WaitForChild("OnMessageDoneFiltering")
    --Gui
    local PLAYER_GUI = PLAYER:WaitForChild("PlayerGui")
    local CORE_GUI = game.CoreGui
    
        
    -- Assuming PLAYER is defined and is the current player
    local PLAYER = game.Players.LocalPlayer

    -- Create LowGfxScreenGui (of 'ScreenGui' class) if it doesn't exist
    if CORE_GUI then
        local LowGfxScreenGui = CORE_GUI:FindFirstChild("LowGfxScreenGui")
        if not LowGfxScreenGui then
            LowGfxScreenGui = Instance.new("ScreenGui")
            LowGfxScreenGui.Name = "LowGfxScreenGui"
            LowGfxScreenGui.Enabled = true -- Set to true by default
            LowGfxScreenGui.IgnoreGuiInset = true
            LowGfxScreenGui.Parent = CORE_GUI

            -- Create LowGfxBackground Frame
            local LowGfxBackground = Instance.new("Frame")
            LowGfxBackground.Name = "LowGfxBackground"
            LowGfxBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
            LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0) -- Set background color to black
            LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
            LowGfxBackground.Parent = LowGfxScreenGui

            -- Create LGFXUIGradient UIGradient
            local LGFXUIGradient = Instance.new("UIGradient")
            LGFXUIGradient.Name = "LGFXUIGradient"
            LGFXUIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471))
            }
            LGFXUIGradient.Rotation = 290
            LGFXUIGradient.Parent = LowGfxBackground

            -- Create LowGfxTitle TextLabel
            local LowGfxTitle = Instance.new("TextLabel")
            LowGfxTitle.Name = "LowGfxTitle"
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value) -- Initialize with current cash value
            LowGfxTitle.TextColor3 = Color3.new(1, 1, 1) -- White text color
            LowGfxTitle.BackgroundTransparency = 1 -- No background
            LowGfxTitle.Size = UDim2.new(0.2, 0, 0.1, 0) -- Adjust size as needed
            LowGfxTitle.Position = UDim2.new(0.4, 0, 0.05, 0) -- Centered horizontally, adjust vertically as needed
            LowGfxTitle.Font = Enum.Font.SourceSans
            LowGfxTitle.TextScaled = true
            LowGfxTitle.Parent = LowGfxBackground

            -- Connect the function to update the cash text when it changes
            PLAYER_CASH.Changed:Connect(function()
                if LowGfxTitle then
                    LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
                else
                    print("LowGfxTitle not found")
                end
            end)

            -- Create Username TextLabel
            local UsernameLabel = Instance.new("TextLabel")
            UsernameLabel.Name = "UsernameLabel"
            UsernameLabel.Text = PLAYER.Name -- Set to player's username
            UsernameLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
            UsernameLabel.BackgroundTransparency = 1 -- No background
            UsernameLabel.Size = UDim2.new(0.3, 0, 0.05, 0) -- Adjust size as needed
            UsernameLabel.Position = UDim2.new(0.35, 0, 0.12, 0) -- Centered horizontally below the cash label
            UsernameLabel.Font = Enum.Font.SourceSans
            UsernameLabel.TextScaled = true
            UsernameLabel.Parent = LowGfxBackground

            -- Create ProfilePicture ImageLabel
            local ProfilePicture = Instance.new("ImageLabel")
            ProfilePicture.Name = "ProfilePicture"
            ProfilePicture.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust size as needed
            ProfilePicture.Position = UDim2.new(0.45, 0, 0.01, 0) -- Adjust position as needed
            ProfilePicture.BackgroundTransparency = 1 -- No background
            ProfilePicture.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=png&userId="..PLAYER.UserId -- Get the player's avatar
            ProfilePicture.Parent = LowGfxBackground
        end

        print("LowGfxScreenGui created and enabled")
    else
        print("CORE_GUI not found")
    end

    


    
    
    local function findPlayer(name)
        if name then
            --If they typed the name exactly, then return that
            if Players:FindFirstChild(name) then return Players[name] end
    
            --Otherwise search for player name match
            name = name:lower()
    
            for _, player in ipairs(Players:GetPlayers()) do
                if name == player.Name:lower():sub(1, #name) then
                    return player
                end
            end
        end
        return nil
    end
    
    
    
        
    -- Assuming PLAYER is defined and is the current player
    local PLAYER = game.Players.LocalPlayer

    -- Create LowGfxScreenGui (of 'ScreenGui' class) if it doesn't exist
    if CORE_GUI then
        local LowGfxScreenGui = CORE_GUI:FindFirstChild("LowGfxScreenGui")
        if not LowGfxScreenGui then
            LowGfxScreenGui = Instance.new("ScreenGui")
            LowGfxScreenGui.Name = "LowGfxScreenGui"
            LowGfxScreenGui.Enabled = true -- Set to true by default
            LowGfxScreenGui.IgnoreGuiInset = true
            LowGfxScreenGui.Parent = CORE_GUI

            -- Create LowGfxBackground Frame
            local LowGfxBackground = Instance.new("Frame")
            LowGfxBackground.Name = "LowGfxBackground"
            LowGfxBackground.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
            LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0) -- Set background color to black
            LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
            LowGfxBackground.Parent = LowGfxScreenGui

            -- Create LGFXUIGradient UIGradient
            local LGFXUIGradient = Instance.new("UIGradient")
            LGFXUIGradient.Name = "LGFXUIGradient"
            LGFXUIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.new(0.176471, 0.176471, 0.176471))
            }
            LGFXUIGradient.Rotation = 290
            LGFXUIGradient.Parent = LowGfxBackground

            -- Create LowGfxTitle TextLabel
            local LowGfxTitle = Instance.new("TextLabel")
            LowGfxTitle.Name = "LowGfxTitle"
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value) -- Initialize with current cash value
            LowGfxTitle.TextColor3 = Color3.new(1, 1, 1) -- White text color
            LowGfxTitle.BackgroundTransparency = 1 -- No background
            LowGfxTitle.Size = UDim2.new(0.2, 0, 0.1, 0) -- Adjust size as needed
            LowGfxTitle.Position = UDim2.new(0.4, 0, 0.05, 0) -- Centered horizontally, adjust vertically as needed
            LowGfxTitle.Font = Enum.Font.SourceSans
            LowGfxTitle.TextScaled = true
            LowGfxTitle.Parent = LowGfxBackground

            -- Connect the function to update the cash text when it changes
            PLAYER_CASH.Changed:Connect(function()
                if LowGfxTitle then
                    LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
                else
                    print("LowGfxTitle not found")
                end
            end)

            -- Create Username TextLabel
            local UsernameLabel = Instance.new("TextLabel")
            UsernameLabel.Name = "UsernameLabel"
            UsernameLabel.Text = PLAYER.Name -- Set to player's username
            UsernameLabel.TextColor3 = Color3.new(1, 1, 1) -- White text color
            UsernameLabel.BackgroundTransparency = 1 -- No background
            UsernameLabel.Size = UDim2.new(0.3, 0, 0.05, 0) -- Adjust size as needed
            UsernameLabel.Position = UDim2.new(0.35, 0, 0.12, 0) -- Centered horizontally below the cash label
            UsernameLabel.Font = Enum.Font.SourceSans
            UsernameLabel.TextScaled = true
            UsernameLabel.Parent = LowGfxBackground

            -- Create ProfilePicture ImageLabel
            local ProfilePicture = Instance.new("ImageLabel")
            ProfilePicture.Name = "ProfilePicture"
            ProfilePicture.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust size as needed
            ProfilePicture.Position = UDim2.new(0.45, 0, 0.01, 0) -- Adjust position as needed
            ProfilePicture.BackgroundTransparency = 1 -- No background
            ProfilePicture.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=png&userId="..PLAYER.UserId -- Get the player's avatar
            ProfilePicture.Parent = LowGfxBackground
        end

        print("LowGfxScreenGui created and enabled")
    else
        print("CORE_GUI not found")
    end


    
    print("LowGfxScreenGui created and enabled")
    
    
    local function makeEverythingInvisible()
        -- Get all parts in the workspace
        local allParts = game.Workspace:GetDescendants()
    
        -- Iterate through all parts and make them invisible
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
    
    makeEverythingInvisible()
    
    
    
    
    
    local firstMessage = nil -- Store the text of the first message received

    local function listenForResponse()
        local request = http_request or request or HttpPost or syn.request
        local abc123 = "http://" .. server1
        local success, response = pcall(function()
            return request({
                Url = abc123,
                Method = "GET"
            })
        end)
    
        if success then
            -- Check if the response is valid and contains a body
            if response and response.Success and response.Body then
                -- Parse the response JSON to read the message sent by Flask
                local responseData = HttpService:JSONDecode(response.Body)
                local flaskMessage = responseData.reply
    
                if not firstMessage then
                    firstMessage = flaskMessage
                else
                    if flaskMessage ~= lastReceivedMessage then
                        print("flaskMessage", flaskMessage)
                        local firstWord = flaskMessage:match("^%S+") -- Match the first word
                        local middleWord = flaskMessage:match("%S+%s*(%S+)%s+%S+$") -- rock
                        local lastWord = flaskMessage:match("%S+$") -- Match the last word
                        lastReceivedMessage = flaskMessage -- Update the last received message
                    
                        -- Check if the first word is not "setting" and the last word is not "up"
                        if firstWord ~= "setting" and lastWord ~= "up" then
                            -- Check if the received message is not equal to the first message
                            if flaskMessage ~= firstMessage then
                                dropMoney(firstWord, middleWord)
                            end
                        end
                    end
                end
            end
            -- Do not print anything if the response is empty
        else
            -- Handle the case when there's an error in the request
            print("Error occurred while making the request to Flask.")
        end
    end
    
    
    
    

    local function spawnPartsAtPositions(positions)
        local spawnedParts = {}  -- Table to store references to the spawned parts
    
        -- Iterate over each position in the array
        for _, position in ipairs(positions) do
            -- Create a new part at the current position
            local newPart = Instance.new("Part")
            newPart.Anchored = true
            newPart.Position = position
            newPart.Size = Vector3.new(5, 5, 5) -- Adjust the size as needed
            newPart.Color = Color3.fromRGB(255, 0, 0) -- Red color, adjust as needed
            newPart.Parent = workspace
    
            -- Add the spawned part to the table
            table.insert(spawnedParts, newPart)
        end
    
        -- Return the table of spawned parts
        return spawnedParts
    end
    
    -- Example usage:
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
    
    -- Now you can use 'spawnedParts' to manipulate or reference the spawned parts
    for i, part in ipairs(spawnedParts) do
        print("Spawned part", i, "position:", part.Position)
    end
    
    local currencyPostFixes = {
        ["k"] = 1000,
        ["m"] = 1000000,
        ["b"] = 1000000000,
    }
    
    function dropMoney(money, name)
        local amountString = money
        local limit = tonumber(amountString)
        if not limit then
            for postFix, value in pairs(currencyPostFixes) do
                if string.find(amountString, postFix) then
                    local rawNumberString = string.gsub(amountString, postFix, "")
                    local amountNumber = tonumber(rawNumberString)
                    limit = amountNumber * value
                    break
                end
            end
        end
    
        if limit then
            numberOfAltsInGame = countAltsInGame() --number of alts in game
            targetdrop = limit / numberOfAltsInGame -- 1m divided by number of alts in game
            timestodrop = targetdrop / 8500 --you know what i means right
            roundedTimestoDrop = math.ceil(timestodrop)
            CHAT_EVENT:FireServer("Started dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
            for i = 1, roundedTimestoDrop do
                MAIN_EVENT:FireServer("DropMoney", 10000)  -- Fire the server event with a payload of 10000
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
                    break
                end
                wait(16.5)  -- Wait for 15 seconds before the next iteration
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
                CHAT_EVENT:FireServer("Stopped dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
                return
            end
            CHAT_EVENT:FireServer("Finished dropping " .. tostring(money) .. ", for " .. tostring(name), "All")
            wait(30)
        end
    end

    
    
    
    
    function countAltsInGame()
        local alts = getgenv().alts
        local count = 0
    
        -- Iterate through the list of alt IDs
        for _, altID in ipairs(alts) do
            -- Check if the player with the alt ID is in the game
            local player = game.Players:GetPlayerByUserId(altID)
            if player then
                -- If player is found, increment the count
                count = count + 1
            end
        end
    
        -- Return the count of alts in the game
        return count
    end
    
    
    
    --Anti-afk
    PLAYER.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    
    
    local function teleport(targetPosition)
        local character = PLAYER.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
            end
        end
    end
    
    
    
    function getAltNumber(userId)
        local alts = getgenv().alts
        for i, id in ipairs(alts) do
            if userId == id then
                print(i)
                return i
            end
        end
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
        local userId = PLAYER.UserId
        local altNumber = getAltNumber(userId)
        local position = teleportPositions[altNumber] or Vector3.new(-381.01, 35.75, -286) -- Default position
        
        teleport(position)
    end
    
    teleportBasedOnAltNumber(PLAYER)
    
    
    
    --RunService:Set3dRenderingEnabled(false)
    setfpscap(2)
    settings().Rendering.QualityLevel = 1
    UserSettings().GameSettings.MasterVolume = 0
    
    
    while true do
        listenForResponse()
        wait(10)
    end
    
    
    
    
    

end 
