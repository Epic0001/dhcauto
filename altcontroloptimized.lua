
getgenv().hideCash = true


-- Services
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Terrain = Workspace:FindFirstChild('Terrain')
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")

-- Variables
local PLAYER = Players.LocalPlayer
local server1 = ipv4 .. ":5000"
local server2 = ipv4 .. ":6000"
local DATA_FOLDER = PLAYER:WaitForChild("DataFolder", 10)
local PLAYER_CASH = DATA_FOLDER and DATA_FOLDER:WaitForChild("Currency", 10)
local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent", 10)
local IGNORED = Workspace:WaitForChild("Ignored", 10)
local DROP = IGNORED and IGNORED:WaitForChild("Drop", 10)
local ITEMS_DROP = IGNORED:WaitForChild("ItemsDrop")
local SHOP = IGNORED:WaitForChild("Shop")
local SPAWN = IGNORED:WaitForChild("Spawn")
local LIGHTS = Workspace:WaitForChild("Lights")
local PLAYERS_FOLDER = Workspace:WaitForChild("Players")

-- Initialize Chat using TextChatService
local CHAT_CHANNEL
local success, err = pcall(function()
    CHAT_CHANNEL = TextChatService.TextChannels.RBXGeneral
end)
if not success or not CHAT_CHANNEL then
    CHAT_CHANNEL = { SendAsync = function(message) end } -- Fallback: Skip chat
end

-- Check critical objects
if not DATA_FOLDER then return end
if not PLAYER_CASH then return end
if not MAIN_EVENT then return end
if not DROP then return end

-- Graphics optimization (new optimizer)
local function makeEverythingInvisible()
    setfpscap(3)
    RunService:Set3dRenderingEnabled(false)
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = 1

    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("WedgePart") then
            v.Material = "SmoothPlastic"
            v.Reflectance = 0
            if v.Name ~= "Radius" and v.Name ~= "Siren" and v.Name ~= "SNOWs_" and not v:IsA("VehicleSeat") and not v:IsDescendantOf(ITEMS_DROP) and not v:IsDescendantOf(PLAYERS_FOLDER) and not v:IsDescendantOf(SHOP) and not v:IsDescendantOf(SPAWN) and not v:IsDescendantOf(LIGHTS) and not v:IsDescendantOf(PLAYER.Character) then
                v:Destroy()
            elseif v.Parent == SPAWN then
                v.CanCollide = true
            elseif v.Parent == ITEMS_DROP then
                local platform = Instance.new("Part")
                platform.Name = "ItemPlatform"
                platform.Anchored = true
                platform.Transparency = 1
                platform.Size = Vector3.new(5, 0.1, 5)
                platform.Position = v.Position - Vector3.new(0, 3, 0)
                platform.Parent = SPAWN
            end
        elseif v:IsA("Decal") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end

    local snowSkippedFlag = false
    for _, v in ipairs(IGNORED:GetChildren()) do
        if v.Name == "SNOWs_" then
            if snowSkippedFlag == false then
                snowSkippedFlag = true
            else
                v:Destroy()
            end
        end
    end

    for _, v in ipairs(Lighting:GetDescendants()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end

    sethiddenproperty(PLAYER, "SimulationRadius", 0)
    UserSettings().GameSettings.MasterVolume = 0
    UserSettings().GameSettings.SavedQualityLevel = 0
end

-- GUI setup
local function setupLowGfxScreenGui()
    local LowGfxScreenGui = CoreGui:FindFirstChild("LowGfxScreenGui")
    if not LowGfxScreenGui then
        LowGfxScreenGui = Instance.new("ScreenGui")
        LowGfxScreenGui.Name = "LowGfxScreenGui"
        LowGfxScreenGui.Enabled = true
        LowGfxScreenGui.IgnoreGuiInset = true
        LowGfxScreenGui.Parent = CoreGui

        local LowGfxBackground = Instance.new("Frame")
        LowGfxBackground.Name = "LowGfxBackground"
        LowGfxBackground.BackgroundColor3 = Color3.new(0, 0, 0)
        LowGfxBackground.Size = UDim2.new(1, 0, 1, 0)
        LowGfxBackground.Parent = LowGfxScreenGui

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

        PLAYER_CASH.Changed:Connect(function()
            LowGfxTitle.Text = tostring(PLAYER_CASH.Value)
        end)
    end
end

-- Teleport function
local function teleport(targetPosition)
    local retryCount = 0
    local maxRetries = 5

    while retryCount < maxRetries do
        local character = PLAYER.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
            return
        else
            task.wait(1)
            retryCount += 1
        end
    end
end

-- Get alt number
local function getAltNumber(userId)
    for i, id in ipairs(alts) do
        if userId == id then
            return i
        end
    end
    return false
end

-- Count alts in game
local function countAltsInGame()
    local count = 0
    for _, altID in ipairs(alts) do
        if Players:GetPlayerByUserId(altID) then
            count += 1
        end
    end
    return count
end

-- Drop money function
local currencyPostFixes = {["k"] = 1000, ["m"] = 1000000, ["b"] = 1000000000}
local function dropMoney(money, name)
    local amountString = money
    local limit = tonumber(amountString)
    if not limit then
        for postFix, value in pairs(currencyPostFixes) do
            if string.find(amountString, postFix) then
                local rawNumberString = string.gsub(amountString, postFix, "")
                limit = tonumber(rawNumberString) * value
                break
            end
        end
    end

    if limit then
        local numberOfAltsInGame = countAltsInGame()
        local targetdrop = limit / numberOfAltsInGame
        local timestodrop = targetdrop / 8500
        local roundedTimestoDrop = math.ceil(timestodrop)

        pcall(function()
            CHAT_CHANNEL:SendAsync("Started dropping " .. tostring(money) .. ", for " .. tostring(name))
        end)

        for i = 1, roundedTimestoDrop do
            local success, response = pcall(function()
                return (http_request or request or HttpPost or syn.request)({
                    Url = "http://" .. server1,
                    Method = "GET"
                })
            end)
            if success and response.Success and response.Body then
                local responseData = HttpService:JSONDecode(response.Body)
                local stopthingy = responseData.stop or false
                if stopthingy then
                    CHAT_CHANNEL:SendAsync("Stopped dropping " .. tostring(money) .. ", for " .. tostring(name))
                    break
                end
            else
                break
            end

            pcall(function()
                MAIN_EVENT:FireServer("DropMoney", 15000)
            end)
            task.wait(16.5)
        end

        pcall(function()
            CHAT_CHANNEL:SendAsync("Finished dropping " .. tostring(money) .. ", for " .. tostring(name))
        end)
    end
end

-- Listen for server responses
local firstMessage = nil
local lastReceivedMessage = nil
local function listenForResponse()
    local request = http_request or request or HttpPost or syn.request
    if not request then return end

    local success, response = pcall(function()
        return request({
            Url = "http://" .. server1,
            Method = "GET"
        })
    end)
    if success and response.Success and response.Body then
        local responseData = HttpService:JSONDecode(response.Body)
        local flaskMessage = responseData.reply

        if not firstMessage then
            firstMessage = flaskMessage
        elseif flaskMessage ~= lastReceivedMessage then
            local firstWord = flaskMessage:match("^%S+")
            local middleWord = flaskMessage:match("%S+%s*(%S+)%s+%S+$")
            local lastWord = flaskMessage:match("%S+$")
            lastReceivedMessage = flaskMessage

            if firstWord ~= "setting" and lastWord ~= "up" and flaskMessage ~= firstMessage then
                pcall(function()
                    dropMoney(firstWord, middleWord)
                end)
            end
        end
    end
end

-- ALT_SETUP_LOCATIONS_V2 (bank only)
local ALT_SETUP_LOCATIONS_V2 = {
    ["bank"] = {
        [1] = Vector3.new(-393.01, 21.75, -338),
        [2] = Vector3.new(-381.01, 21.75, -338),
        [3] = Vector3.new(-369.01, 21.75, -338),
        [4] = Vector3.new(-357.01, 21.75, -338),
        [5] = Vector3.new(-393.01, 21.75, -325),
        [6] = Vector3.new(-381.01, 21.75, -325),
        [7] = Vector3.new(-369.01, 21.75, -325),
        [8] = Vector3.new(-357.01, 21.75, -325),
        [9] = Vector3.new(-393.01, 21.75, -312),
        [10] = Vector3.new(-381.01, 21.75, -312),
        [11] = Vector3.new(-369.01, 21.75, -312),
        [12] = Vector3.new(-357.01, 21.75, -312),
        [13] = Vector3.new(-393.01, 21.75, -299),
        [14] = Vector3.new(-381.01, 21.75, -299),
        [15] = Vector3.new(-369.01, 21.75, -299),
        [16] = Vector3.new(-357.01, 21.75, -299),
        [17] = Vector3.new(-393.01, 21.75, -286),
        [18] = Vector3.new(-381.01, 21.75, -286),
        [19] = Vector3.new(-369.01, 21.75, -286),
        [20] = Vector3.new(-357.01, 21.75, -286),
        [21] = Vector3.new(-393.01, 21.75, -273),
        [22] = Vector3.new(-381.01, 21.75, -273),
        [23] = Vector3.new(-369.01, 21.75, -273),
        [24] = Vector3.new(-357.01, 21.75, -273),
        [25] = Vector3.new(-393.01, 21.75, -260),
        [26] = Vector3.new(-381.01, 21.75, -260),
        [27] = Vector3.new(-369.01, 21.75, -260),
        [28] = Vector3.new(-357.01, 21.75, -260),
        [29] = Vector3.new(-393.01, 21.75, -247),
        [30] = Vector3.new(-381.01, 21.75, -247),
        [31] = Vector3.new(-369.01, 21.75, -247),
        [32] = Vector3.new(-357.01, 21.75, -247),
        [33] = Vector3.new(-393.01, 21.75, -233),
        [34] = Vector3.new(-381.01, 21.75, -233),
        [35] = Vector3.new(-369.01, 21.75, -233),
        [36] = Vector3.new(-357.01, 21.75, -233),
        [37] = Vector3.new(-405.01, 21.75, -299),
        [38] = Vector3.new(-405.01, 21.75, -286),
        [39] = Vector3.new(-405.01, 21.75, -273),
    },
}

-- SETUP_PLATFORMS
local SETUP_PLATFORMS = {
    ["bank"] = {Size = Vector3.new(80, 1, 136), Position = Vector3.new(-380.755, 18.255, -285.5)},
}

-- Create platform
local function createPlatform(location)
    local platData = SETUP_PLATFORMS[location]
    if platData then
        local platform = Instance.new("Part")
        platform.Anchored = true
        platform.Position = platData.Position
        platform.Size = platData.Size
        platform.Color = Color3.fromRGB(255, 255, 255)
        platform.Transparency = 1
        platform.Parent = Workspace
    end
end

-- Main execution
makeEverythingInvisible()
setupLowGfxScreenGui()
createPlatform("bank")

local altNumber = getAltNumber(PLAYER.UserId)
if altNumber then
    local bankPositions = ALT_SETUP_LOCATIONS_V2["bank"]
    local position = bankPositions[altNumber] or Vector3.new(-381.01, 21.75, -286)
    teleport(position)
else
    teleport(Vector3.new(-381.01, 21.75, -286))
end

-- Anti-AFK
local GC = getconnections or get_signal_cons
if GC then
    for i, v in pairs(GC(Players.LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
end

-- Cash drop handling
DROP.ChildAdded:Connect(function(child)
    if child:IsA("Part") then
        task.wait(5)
        child.Transparency = 1
        for _, decal in ipairs(child:GetChildren()) do
            if decal:IsA("Decal") then
                decal:Destroy()
            end
        end
        local billboard = child:FindFirstChild("BillboardGui")
        if billboard then
            billboard.Enabled = false
        end
        if hideCash then
            child:Destroy()
        end
    end
end)

-- Main loop
while true do
    pcall(listenForResponse)
    task.wait(10)
end
