
local server1 = ipv4 .. ":5000"
local server2 = ipv4 .. ":6000"
local Workspace = game:GetService('Workspace')
local Lighting = game:GetService('Lighting')
local Players = game:GetService('Players')
local Terrain = Workspace:FindFirstChild('Terrain')
local RenderSettings = settings():GetService("RenderSettings")
local RunService = game:GetService("RunService")

-- Services
local HttpService = game:GetService("HttpService")
local request = http_request or request or HttpPost or syn.request
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GroupService = game:GetService("GroupService")
local Stats = game:GetService("Stats")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

-- Module scripts
local mainModule = require(ReplicatedStorage:WaitForChild("MainModule"))

-- Consts
local PLAYER = Players.LocalPlayer
local PS_Owner = getgenv().alts[1] -- Designate the first alt as the PS_Owner
local MOUSE = PLAYER:GetMouse()
local DATA_FOLDER = PLAYER:WaitForChild("DataFolder", 10)
local PLAYER_CASH = DATA_FOLDER and DATA_FOLDER:WaitForChild("Currency", 10)
local INVENTORY = DATA_FOLDER:WaitForChild("Inventory")
local INFORMATION = DATA_FOLDER:WaitForChild("Information")
local ORIGINAL_CASH_AMOUNT = PLAYER_CASH and PLAYER_CASH.Value or 0
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

local CHAT_CHANNEL
local success, err = pcall(function()
    CHAT_CHANNEL = TextChatService.TextChannels.RBXGeneral
end)
if not success or not CHAT_CHANNEL then
    CHAT_CHANNEL = { SendAsync = function(message) end } -- Fallback: Skip chat
end

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

-- Graphics optimization
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
for _, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA('Seat') or string.lower(v.Name):match('seat') then
        v:remove()
    end
end

-- GUI Setup (same as previous)
local Converted = {
    ["_ScreenGui"] = Instance.new("ScreenGui"),
    ["_Frame"] = Instance.new("Frame"),
    ["_UIGradient"] = Instance.new("UIGradient"),
    ["_UsernameFrame"] = Instance.new("Frame"),
    ["_UICorner"] = Instance.new("UICorner"),
    ["_UIGradient1"] = Instance.new("UIGradient"),
    ["_TextLabel"] = Instance.new("TextLabel"),
    ["_UserInfoFrame"] = Instance.new("Frame"),
    ["_UICorner1"] = Instance.new("UICorner"),
    ["_UIGradient2"] = Instance.new("UIGradient"),
    ["_Titles"] = Instance.new("Frame"),
    ["_UICorner2"] = Instance.new("UICorner"),
    ["_TextLabel1"] = Instance.new("TextLabel"),
    ["_TextLabel2"] = Instance.new("TextLabel"),
    ["_MainInfo"] = Instance.new("TextLabel"),
    ["_userid"] = Instance.new("TextLabel"),
    ["_Display Name"] = Instance.new("TextLabel"),
    ["_Username"] = Instance.new("TextLabel"),
    ["_ExtraInfo"] = Instance.new("TextLabel"),
    ["_AccountAge"] = Instance.new("TextLabel"),
    ["_BackDrop"] = Instance.new("Frame"),
    ["_UICorner3"] = Instance.new("UICorner"),
    ["_StatisticsFrame"] = Instance.new("Frame"),
    ["_UICorner4"] = Instance.new("UICorner"),
    ["_UIGradient3"] = Instance.new("UIGradient"),
    ["_Titles1"] = Instance.new("Frame"),
    ["_UICorner5"] = Instance.new("UICorner"),
    ["_TextLabel3"] = Instance.new("TextLabel"),
    ["_TextLabel4"] = Instance.new("TextLabel"),
    ["_Statistics"] = Instance.new("Frame"),
    ["_TextLabel5"] = Instance.new("TextLabel"),
    ["_TextLabel6"] = Instance.new("TextLabel"),
    ["_BeforeCash"] = Instance.new("TextLabel"),
    ["_AfterCash"] = Instance.new("TextLabel"),
    ["_Bounty"] = Instance.new("TextLabel"),
    ["_Time in server"] = Instance.new("TextLabel"),
    ["_BountyText"] = Instance.new("TextLabel"),
    ["_StatusFrame"] = Instance.new("Frame"),
    ["_UICorner6"] = Instance.new("UICorner"),
    ["_UIGradient4"] = Instance.new("UIGradient"),
    ["_TextLabel7"] = Instance.new("TextLabel"),
    ["_Frame1"] = Instance.new("Frame"),
    ["_UICorner7"] = Instance.new("UICorner"),
    ["_LogFrame"] = Instance.new("Frame"),
    ["_UICorner8"] = Instance.new("UICorner"),
    ["_UIGradient5"] = Instance.new("UIGradient"),
    ["_TextLabel8"] = Instance.new("TextLabel"),
    ["_BackDrop2"] = Instance.new("Frame"),
    ["_UICorner9"] = Instance.new("UICorner"),
}

-- GUI Properties (unchanged)
Converted["_ScreenGui"].Parent = game.CoreGui
Converted["_ScreenGui"].IgnoreGuiInset = true
Converted["_ScreenGui"].Enabled = true
Converted["_ScreenGui"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_ScreenGui"].Name = "Gui"
Converted["_ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Converted["_Frame"].Parent = Converted["_ScreenGui"]
Converted["_Frame"].Size = UDim2.new(1, 0, 1, 0)

Converted["_UIGradient"].Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))}
Converted["_UIGradient"].Rotation = -29
Converted["_UIGradient"].Parent = Converted["_Frame"]

Converted["_UsernameFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UsernameFrame"].Position = UDim2.new(0.320, 0, 0.130, 0)
Converted["_UsernameFrame"].Size = UDim2.new(0.358, 0, 0.098, 0)
Converted["_UsernameFrame"].ZIndex = 2
Converted["_UsernameFrame"].Name = "UsernameFrame"
Converted["_UsernameFrame"].Parent = Converted["_Frame"]

Converted["_UICorner"].CornerRadius = UDim.new(0.3, 0)
Converted["_UICorner"].Parent = Converted["_UsernameFrame"]

Converted["_UIGradient1"].Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 29, 29)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))}
Converted["_UIGradient1"].Rotation = 81
Converted["_UIGradient1"].Parent = Converted["_UsernameFrame"]

Converted["_TextLabel"].Font = Enum.Font.SourceSans
Converted["_TextLabel"].Text = "loading..."
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].Parent = Converted["_UsernameFrame"]

Converted["_UserInfoFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UserInfoFrame"].Position = UDim2.new(0.224, 0, 0.288, 0)
Converted["_UserInfoFrame"].Size = UDim2.new(0.262, 0, 0.420, 0)
Converted["_UserInfoFrame"].ZIndex = 2
Converted["_UserInfoFrame"].Name = "UserInfoFrame"
Converted["_UserInfoFrame"].Parent = Converted["_Frame"]

Converted["_UICorner1"].CornerRadius = UDim.new(0.1, 0)
Converted["_UICorner1"].Parent = Converted["_UserInfoFrame"]

Converted["_UIGradient2"].Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)), ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))}
Converted["_UIGradient2"].Rotation = 81
Converted["_UIGradient2"].Parent = Converted["_UserInfoFrame"]

Converted["_Titles"].BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Converted["_Titles"].Size = UDim2.new(1, 0, 0.228, 0)
Converted["_Titles"].ZIndex = 2
Converted["_Titles"].Name = "Titles"
Converted["_Titles"].Parent = Converted["_UserInfoFrame"]

Converted["_UICorner2"].CornerRadius = UDim.new(0.2, 0)
Converted["_UICorner2"].Parent = Converted["_Titles"]

Converted["_TextLabel1"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel1"].Text = "User Info"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].TextScaled = true
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].Position = UDim2.new(0.017, 0, 0.058, 0)
Converted["_TextLabel1"].Size = UDim2.new(0.305, 0, 0.509, 0)
Converted["_TextLabel1"].Parent = Converted["_Titles"]

Converted["_TextLabel2"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel2"].Text = "Accounts Info"
Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(115, 115, 115)
Converted["_TextLabel2"].TextScaled = true
Converted["_TextLabel2"].BackgroundTransparency = 1
Converted["_TextLabel2"].Position = UDim2.new(0.015, 0, 0.571, 0)
Converted["_TextLabel2"].Size = UDim2.new(0.373, 0, 0.364, 0)
Converted["_TextLabel2"].Parent = Converted["_Titles"]

Converted["_userid"].Font = Enum.Font.SourceSansBold
Converted["_userid"].Text = "User ID:"
Converted["_userid"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_userid"].TextScaled = true
Converted["_userid"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_userid"].BackgroundTransparency = 1
Converted["_userid"].Position = UDim2.new(0.043, 0, 0.362, 0)
Converted["_userid"].Size = UDim2.new(0.912, 0, 0.078, 0)
Converted["_userid"].Name = "userid"
Converted["_userid"].Parent = Converted["_UserInfoFrame"]

Converted["_Display Name"].Font = Enum.Font.SourceSansBold
Converted["_Display Name"].Text = "Display Name:"
Converted["_Display Name"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Display Name"].TextScaled = true
Converted["_Display Name"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Display Name"].BackgroundTransparency = 1
Converted["_Display Name"].Position = UDim2.new(0.043, 0, 0.441, 0)
Converted["_Display Name"].Size = UDim2.new(0.912, 0, 0.078, 0)
Converted["_Display Name"].Name = "Display Name"
Converted["_Display Name"].Parent = Converted["_UserInfoFrame"]

Converted["_Username"].Font = Enum.Font.SourceSansBold
Converted["_Username"].Text = "Username:"
Converted["_Username"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Username"].TextScaled = true
Converted["_Username"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Username"].BackgroundTransparency = 1
Converted["_Username"].Position = UDim2.new(0.043, 0, 0.519, 0)
Converted["_Username"].Size = UDim2.new(0.912, 0, 0.078, 0)
Converted["_Username"].Name = "Username"
Converted["_Username"].Parent = Converted["_UserInfoFrame"]

Converted["_AccountAge"].Font = Enum.Font.SourceSansBold
Converted["_AccountAge"].Text = "Age: 15"
Converted["_AccountAge"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AccountAge"].TextScaled = true
Converted["_AccountAge"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_AccountAge"].BackgroundTransparency = 1
Converted["_AccountAge"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AccountAge"].Position = UDim2.new(0.043, 0, 0.740, 0)
Converted["_AccountAge"].Size = UDim2.new(0.912, 0, 0.078, 0)
Converted["_AccountAge"].Name = "AccountAge"
Converted["_AccountAge"].Parent = Converted["_UserInfoFrame"]

Converted["_StatisticsFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_StatisticsFrame"].Position = UDim2.new(0.511, 0, 0.289, 0)
Converted["_StatisticsFrame"].Size = UDim2.new(0.262, 0, 0.420, 0)
Converted["_StatisticsFrame"].ZIndex = 2
Converted["_StatisticsFrame"].Name = "StatisticsFrame"
Converted["_StatisticsFrame"].Parent = Converted["_Frame"]

Converted["_UICorner4"].CornerRadius = UDim.new(0.1, 0)
Converted["_UICorner4"].Parent = Converted["_StatisticsFrame"]

Converted["_UIGradient3"].Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)), ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))}
Converted["_UIGradient3"].Rotation = 81
Converted["_UIGradient3"].Parent = Converted["_StatisticsFrame"]

Converted["_Titles1"].BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Converted["_Titles1"].BorderSizePixel = 0
Converted["_Titles1"].Size = UDim2.new(1, 0, 0.228, 0)
Converted["_Titles1"].ZIndex = 2
Converted["_Titles1"].Name = "Titles"
Converted["_Titles1"].Parent = Converted["_StatisticsFrame"]

Converted["_UICorner5"].CornerRadius = UDim.new(0.2, 0)
Converted["_UICorner5"].Parent = Converted["_Titles1"]

Converted["_TextLabel3"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel3"].Text = "Statistics"
Converted["_TextLabel3"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].TextScaled = true
Converted["_TextLabel3"].BackgroundTransparency = 1
Converted["_TextLabel3"].Position = UDim2.new(0.017, 0, 0.058, 0)
Converted["_TextLabel3"].Size = UDim2.new(0.305, 0, 0.509, 0)
Converted["_TextLabel3"].Parent = Converted["_Titles1"]

Converted["_TextLabel4"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel4"].Text = "View alts statistics"
Converted["_TextLabel4"].TextColor3 = Color3.fromRGB(115, 115, 115)
Converted["_TextLabel4"].TextScaled = true
Converted["_TextLabel4"].BackgroundTransparency = 1
Converted["_TextLabel4"].Position = UDim2.new(0.015, 0, 0.571, 0)
Converted["_TextLabel4"].Size = UDim2.new(0.431, 0, 0.364, 0)
Converted["_TextLabel4"].Parent = Converted["_Titles1"]

Converted["_Statistics"].BackgroundTransparency = 1
Converted["_Statistics"].Position = UDim2.new(0, 0, 0.228, 0)
Converted["_Statistics"].Size = UDim2.new(1, 0, 0.771, 0)
Converted["_Statistics"].Name = "Statistics"
Converted["_Statistics"].Parent = Converted["_StatisticsFrame"]

Converted["_BeforeCash"].Font = Enum.Font.SourceSansBold
Converted["_BeforeCash"].Text = "$0"
Converted["_BeforeCash"].TextColor3 = Color3.fromRGB(23, 193, 0)
Converted["_BeforeCash"].TextScaled = true
Converted["_BeforeCash"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_BeforeCash"].BackgroundTransparency = 1
Converted["_BeforeCash"].Position = UDim2.new(0.087, 0, 0.166, 0)
Converted["_BeforeCash"].Size = UDim2.new(0.912, 0, 0.108, 0)
Converted["_BeforeCash"].Name = "BeforeCash"
Converted["_BeforeCash"].Parent = Converted["_Statistics"]

Converted["_AfterCash"].Font = Enum.Font.SourceSansBold
Converted["_AfterCash"].Text = "$0"
Converted["_AfterCash"].TextColor3 = Color3.fromRGB(125, 125, 125)
Converted["_AfterCash"].TextScaled = true
Converted["_AfterCash"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_AfterCash"].BackgroundTransparency = 1
Converted["_AfterCash"].Position = UDim2.new(0.087, 0, 0.274, 0)
Converted["_AfterCash"].Size = UDim2.new(0.912, 0, 0.108, 0)
Converted["_AfterCash"].Name = "AfterCash"
Converted["_AfterCash"].Parent = Converted["_Statistics"]

Converted["_BountyText"].Font = Enum.Font.SourceSansBold
Converted["_BountyText"].Text = "Bounty: 0"
Converted["_BountyText"].TextColor3 = Color3.fromRGB(193, 193, 193)
Converted["_BountyText"].TextScaled = true
Converted["_BountyText"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_BountyText"].BackgroundTransparency = 1
Converted["_BountyText"].Position = UDim2.new(0.069, 0, 0.692, 0)
Converted["_BountyText"].Size = UDim2.new(0.912, 0, 0.108, 0)
Converted["_BountyText"].Name = "BountyText"
Converted["_BountyText"].Parent = Converted["_Statistics"]

Converted["_Time in server"].Font = Enum.Font.SourceSansBold
Converted["_Time in server"].Text = "Time in server:"
Converted["_Time in server"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Time in server"].TextScaled = true
Converted["_Time in server"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Time in server"].BackgroundTransparency = 1
Converted["_Time in server"].Position = UDim2.new(0.043, 0, 0.801, 0)
Converted["_Time in server"].Size = UDim2.new(0.912, 0, 0.108, 0)
Converted["_Time in server"].Name = "Time in server"
Converted["_Time in server"].Parent = Converted["_Statistics"]

Converted["_StatusFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_StatusFrame"].Position = UDim2.new(0.326, 0, 0.762, 0)
Converted["_StatusFrame"].Size = UDim2.new(0.081, 0, 0.060, 0)
Converted["_StatusFrame"].ZIndex = 2
Converted["_StatusFrame"].Name = "StatusFrame"
Converted["_StatusFrame"].Parent = Converted["_Frame"]

Converted["_UICorner6"].CornerRadius = UDim.new(0.4, 0)
Converted["_UICorner6"].Parent = Converted["_StatusFrame"]

Converted["_UIGradient4"].Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)), ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))}
Converted["_UIGradient4"].Rotation = 81
Converted["_UIGradient4"].Parent = Converted["_StatusFrame"]

Converted["_TextLabel7"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel7"].Text = "Status:"
Converted["_TextLabel7"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel7"].TextScaled = true
Converted["_TextLabel7"].BackgroundTransparency = 1
Converted["_TextLabel7"].Position = UDim2.new(0.087, 0, 0.257, 0)
Converted["_TextLabel7"].Size = UDim2.new(0.512, 0, 0.509, 0)
Converted["_TextLabel7"].Parent = Converted["_StatusFrame"]

Converted["_Frame1"].BackgroundColor3 = Color3.fromRGB(255, 0, 4)
Converted["_Frame1"].Position = UDim2.new(0.640, 0, 0.168, 0)
Converted["_Frame1"].Size = UDim2.new(0.274, 0, 0.676, 0)
Converted["_Frame1"].Name = "Frame1"
Converted["_Frame1"].Parent = Converted["_StatusFrame"]

Converted["_UICorner7"].CornerRadius = UDim.new(0.5, 0)
Converted["_UICorner7"].Parent = Converted["_Frame1"]

Converted["_LogFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_LogFrame"].Position = UDim2.new(0.414, 0, 0.761, 0)
Converted["_LogFrame"].Size = UDim2.new(0.258, 0, 0.060, 0)
Converted["_LogFrame"].ZIndex = 2
Converted["_LogFrame"].Name = "LogFrame"
Converted["_LogFrame"].Parent = Converted["_Frame"]

Converted["_UICorner8"].CornerRadius = UDim.new(0.4, 0)
Converted["_UICorner8"].Parent = Converted["_LogFrame"]

Converted["_UIGradient5"].Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)), ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))}
Converted["_UIGradient5"].Rotation = 81
Converted["_UIGradient5"].Parent = Converted["_LogFrame"]

Converted["_TextLabel8"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel8"].Text = "Loading..."
Converted["_TextLabel8"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel8"].TextScaled = true
Converted["_TextLabel8"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel8"].BackgroundTransparency = 1
Converted["_TextLabel8"].Position = UDim2.new(0.029, 0, 0.241, 0)
Converted["_TextLabel8"].Size = UDim2.new(0.948, 0, 0.509, 0)
Converted["_TextLabel8"].Parent = Converted["_LogFrame"]

-- GUI Update Logic
local function YMCHG_fake_script()
    local function format(number)
        if not number or type(number) ~= "number" or number < 0 then
            return "0"
        end
        number = math.floor(number)
        local str = tostring(number)
        return str:reverse():gsub("...", "%0,", math.floor((#str - 1) / 3)):reverse()
    end

    local function hms_format(Int)
        return string.format("%02i", Int)
    end

    local function convert_to_hms(seconds)
        local minutes = (seconds - seconds % 60) / 60
        seconds = seconds - minutes * 60
        local hours = (minutes - minutes % 60) / 60
        minutes = minutes - hours * 60
        return hms_format(hours) .. ":" .. hms_format(minutes) .. ":" .. hms_format(seconds)
    end

    local timeelapsed = tick()
    local mainframe = Converted["_Frame"]

    mainframe.UsernameFrame.TextLabel.Text = game.Players.LocalPlayer.Name
    mainframe.UserInfoFrame.userid.Text = "User ID: " .. game.Players.LocalPlayer.UserId
    mainframe.UserInfoFrame["Display Name"].Text = "Display Name: " .. game.Players.LocalPlayer.DisplayName
    mainframe.UserInfoFrame.Username.Text = "Username: " .. game.Players.LocalPlayer.Name
    mainframe.UserInfoFrame.AccountAge.Text = "Age: " .. game.Players.LocalPlayer.AccountAge .. " Days Old"

    local stockbeforetext = mainframe.StatisticsFrame.Statistics.BeforeCash
    local stockaftertext = mainframe.StatisticsFrame.Statistics.AfterCash
    local bountytext = mainframe.StatisticsFrame.Statistics.BountyText
    local timeinservertext = mainframe.StatisticsFrame.Statistics["Time in server"]

    task.spawn(function()
        while task.wait(0.1) do
            pcall(function()
                if DATA_FOLDER and DATA_FOLDER.Currency then
                    stockbeforetext.Text = "$" .. format(DATA_FOLDER.Currency.Value)
                else
                    stockbeforetext.Text = "$0"
                end
            end)
        end
    end)

    task.spawn(function()
        while task.wait(0.1) do
            pcall(function()
                if DATA_FOLDER and DATA_FOLDER.Currency and type(DATA_FOLDER.Currency.Value) == "number" and DATA_FOLDER.Currency.Value >= 0 then
                    local taxAmount = DATA_FOLDER.Currency.Value * 0.30
                    local fullamount = math.floor(DATA_FOLDER.Currency.Value - taxAmount) -- Fixed to ensure integer
                    stockaftertext.Text = "$" .. format(fullamount)
                else
                    stockaftertext.Text = "$0"
                end
            end)
        end
    end)

    task.spawn(function()
        while task.wait(0.1) do
            pcall(function()
                timeinservertext.Text = "Time In Server: " .. tostring(convert_to_hms(math.floor(tick() - timeelapsed)))
            end)
        end
    end)

    task.spawn(function()
        while task.wait(0.1) do
            pcall(function()
                bountytext.Text = "Bounty: " .. tostring(PLAYER:WaitForChild("leaderstats").Wanted.Value)
            end)
        end
    end)
end
coroutine.wrap(YMCHG_fake_script)()

local mainframe = Converted["_Frame"]
local function status(status)
    if mainframe.StatusFrame and mainframe.StatusFrame:FindFirstChild("Frame1") then
        if status == true then
            mainframe.StatusFrame.Frame1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            mainframe.StatusFrame.Frame1.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
        end
    else
        print("Error: Frame1 not found in StatusFrame")
    end
end

local function log(msg)
    if mainframe.LogFrame and mainframe.LogFrame.TextLabel then
        mainframe.LogFrame.TextLabel.Text = msg
    else
        print("Log: " .. msg)
    end
end

local function shout(message)
    MAIN_EVENT:FireServer("Shout", message)
end

local function kick(player)
    MAIN_EVENT:FireServer("VIP_CMD", "Kick", player)
    log("Kicked: " .. player.Name)
end

local function Chat(text)
    pcall(function()
        local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if channel then
            channel:SendAsync(tostring(text))
        else
            warn("[Chat] RBXGeneral channel not found.")
        end
    end)
end

local function countAltsInGame()
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

local function amountleft(amount, alts, limit)
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
        return request({
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
    local result = table.find(getgenv().alts, player.UserId)
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

local function altscash()
    print("[DEBUG] altscash called")
    local ServerURL = "http://" .. server2 .. "/write-cash"
    local total = getCombinedCashOfAltsInGame()
    local data = {
        cash = total,
    }
    local json_data = game:GetService("HttpService"):JSONEncode(data)
    local success, response = pcall(function()
        return request({
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
        print("cash data sent successfully.")
    else
        print("Error: " .. tostring(response))
    end
end

local function final()
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

local function writePickingUpToFile(playerData)
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

local function vipKick(player)
        print("[DEBUG] vipKick called for player: " .. player.Name)
        game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("VIP_CMD", "Kick", player)
        print("[DEBUG] Fired VIP_CMD Kick for player: " .. player.Name)
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
    for _, id in ipairs(getgenv().dont_kick or {}) do
        if userId == id then
            print("[DEBUG] isProtectedPlayer: User is in dont_kick list")
            return true
        end
    end
    print("[DEBUG] isProtectedPlayer: User is not protected")
    return false
end

-- Main logic split
if PLAYER.UserId == PS_Owner then
    -- PS_OWNER SECTION
    local function makeEverythingInvisible()
        local allParts = game.Workspace:GetDescendants()
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end

    makeEverythingInvisible()

    local feetPlatform = Instance.new("Part")
    feetPlatform.Anchored = true
    feetPlatform.Position = Vector3.new(0, 0, 0)
    feetPlatform.Size = Vector3.new(5, 2, 5)
    feetPlatform.Color = Color3.fromRGB(255, 255, 255)
    feetPlatform.Transparency = 1

    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace

    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 33, -338)
    newPart.Size = Vector3.new(5, 5, 5)
    newPart.Color = Color3.fromRGB(255, 0, 0)
    newPart.Parent = workspace
    newPart.Transparency = 1

    local spawnedParts = {newPart}

    local function findPlayer(name)
        if name then
            if Players:FindFirstChild(name) then
                return Players[name]
            end
            name = name:lower()
            for _, player in ipairs(Players:GetPlayers()) do
                if name == player.Name:lower():sub(1, #name) then
                    return player
                end
            end
        end
        return nil
    end

    local function onPlayerAdded(player)
        task.wait(15)
        local ohString1 = "VIP_CMD"
        local ohString2 = "Summon"
        local ohInstance3 = player
        game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("VIP_CMD", ohString2, player)
        print("[DEBUG] Fired MainEvent for player join: " .. player.Name)
    end

    Players.PlayerAdded:Connect(onPlayerAdded)

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

    for part, originalMaterial in pairs(LOW_GFX_PARTS or {}) do
        part.Material = Enum.Material.SmoothPlastic
        if count < 1200 then
            count += 1
        else
            count = 0
            task.wait()
        end
    end

    local firstMessage = nil
    local lastReceivedMessage = nil

    local function listenForResponse()
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

    function dropMoney(money, name)
        print("[DEBUG] dropMoney called with money: " .. tostring(money) .. ", name: " .. tostring(name))
        local currencyPostFixes = { -- Moved inside to ensure definition
            ["k"] = 1000,
            ["m"] = 1000000,
            ["b"] = 1000000000,
        }
        if not currencyPostFixes then
            print("[ERROR] currencyPostFixes is nil in dropMoney")
            currencyPostFixes = { -- Fallback
                ["k"] = 1000,
                ["m"] = 1000000,
                ["b"] = 1000000000,
            }
        end
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
            local timestodrop = targetdrop / 12750
            local roundedTimestoDrop = math.ceil(timestodrop)
            print("[DEBUG] Drop parameters - Alts: " .. numberOfAltsInGame .. ", Target drop: " .. targetdrop .. ", Times to drop: " .. roundedTimestoDrop)            
            game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", "Started dropping " .. tostring(money) .. ", for " .. tostring(name))
            log("Started dropping " .. tostring(money) .. " for " .. tostring(name))
            status(true)

            local currentValue = 0
            for i = 1, roundedTimestoDrop do
                print("[DEBUG] Drop iteration: " .. i)
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
                                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", "Stopped dropping " .. tostring(money) .. ", for " .. tostring(name))

                    log("Stopped dropping " .. tostring(money))
                    print("[DEBUG] Stopped money drop due to stop condition")
                    status(false)
                    break
                end

                MAIN_EVENT:FireServer("DropMoney", 15000)
                print("[DEBUG] Fired DropMoney event with 15000")
                currentValue = currentValue + 12750
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
                status(false)
                return
            end

            game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("Shout", "Finished dropping " .. tostring(money) .. ", for " .. tostring(name))

            log("Finished dropping " .. tostring(money))
            print("[DEBUG] Money drop completed")
            status(false)

            local shoutMessage = "Kindly take a wallet-screenshot with our dropers and vouch. Thank you for being a valued customer."
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
                    status(false)
                    return
                end
                wait(2)
            end

            local countdownTimes = {60, 30, 10, 5}
            for _, timeLeft in ipairs(countdownTimes) do
                shout("Leave the game or you will be kicked in " .. timeLeft .. " seconds")
                log("Kicking in " .. timeLeft .. "s")
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
                    status(false)
                    return
                end
                wait(10)
            end

            log("Kicking unprotected players...")
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
                        print("[DEBUG] Kick loop: Player " .. player.Name .. " cash increased: " .. startCash .. " -> " .. currentCash)
                    end
                end
            end
            writePickingUpToFile(playersWithIncreasedCash)
            final()

            for _, player in ipairs(Players:GetPlayers()) do if player ~= PLAYER and not isProtectedPlayer(player.UserId) then vipKick(player) end end
        end
    end

    -- Improved teleport function
    local function teleport(targetPosition)
        local character = PLAYER.Character or PLAYER.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(targetPosition)
            print("[DEBUG] Teleported to: " .. tostring(targetPosition))
        else
            print("[ERROR] Failed to find HumanoidRootPart for teleport")
        end
    end

    -- Setup for PS_Owner
    MAIN_EVENT:FireServer("RoleplayModeChange")
    teleport(Vector3.new(-393.01, 36, -338))
   
    setfpscap(2)
    settings().Rendering.QualityLevel = 1
    UserSettings().GameSettings.MasterVolume = 0
    RunService:Set3dRenderingEnabled(false)
    log("PS Owner Connected.")
    status(false)

    while true do
        listenForResponse()
        wait(10)
    end
else
    -- ALT SECTION
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

    local floorPartFolder = Instance.new("Folder")
    floorPartFolder.Name = "FloorParts"
    floorPartFolder.Parent = workspace

    local newPart = Instance.new("Part")
    newPart.Anchored = true
    newPart.Position = Vector3.new(-393.01, 31.75, -338)
    newPart.Size = Vector3.new(5, 5, 5)
    newPart.Color = Color3.fromRGB(255, 0, 0)
    newPart.Parent = workspace
    newPart.Transparency = 1

    local spawnedParts = {newPart}

    local function findPlayer(name)
        if name then
            if Players:FindFirstChild(name) then
                return Players[name]
            end
            name = name:lower()
            for _, player in ipairs(Players:GetPlayers()) do
                if name == player.Name:lower():sub(1, #name) then
                    return player
                end
            end
        end
        return nil
    end

    local firstMessage = nil
    local lastReceivedMessage = nil

    local function listenForResponse()
        local abc123 = "http://" .. server1
        local success, response = pcall(function()
            return request({
                Url = abc123,
                Method = "GET"
            })
        end)
        if success then
            if response and response.Success and response.Body then
                local responseData = HttpService:JSONDecode(response.Body)
                local flaskMessage = responseData.reply
                if not firstMessage then
                    firstMessage = flaskMessage
                else
                    if flaskMessage ~= lastReceivedMessage then
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

    function dropMoney(money, name)
        print("[DEBUG] dropMoney (alt) called with money: " .. tostring(money) .. ", name: " .. tostring(name))
        local currencyPostFixes = { -- Moved inside to ensure definition
            ["k"] = 1000,
            ["m"] = 1000000,
            ["b"] = 1000000000,
        }
        if not currencyPostFixes then
            print("[ERROR] currencyPostFixes is nil in dropMoney (alt)")
            currencyPostFixes = { -- Fallback
                ["k"] = 1000,
                ["m"] = 1000000,
                ["b"] = 1000000000,
            }
        end
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
            print(numberOfAltsInGame)
            local targetdrop = limit / numberOfAltsInGame
            print(targetdrop)
            local timestodrop = targetdrop / 12750
            print(timestodrop)
            local roundedTimestoDrop = math.ceil(timestodrop)
            print(roundedTimestoDrop)

            pcall(function()
                CHAT_CHANNEL:SendAsync("Started dropping " .. tostring(money) .. ", for " .. tostring(name))
            end)
            for i = 1, roundedTimestoDrop do
                MAIN_EVENT:FireServer("DropMoney", 15000)
                print("[DEBUG] Fired DropMoney event (alt) with 15000")
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

    PLAYER.Idled:Connect(function()
        print("[DEBUG] Anti-AFK (alt) triggered")
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)

    local function teleport(targetPosition)
        local character = PLAYER.Character or PLAYER.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(targetPosition)
            print("[DEBUG] Teleported to: " .. tostring(targetPosition))
        else
            print("[ERROR] Failed to find HumanoidRootPart for teleport")
        end
    end

    local function getAltNumber(userId)
        local alts = getgenv().alts
        for i, id in ipairs(alts) do
            if userId == id then
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

    local function teleportBasedOnAltNumber(player)
        local userId = PLAYER.UserId
        local altNumber = getAltNumber(userId)
        local position = teleportPositions[altNumber] or Vector3.new(-381.01, 35.75, -286)
        teleport(position)
    end

    teleportBasedOnAltNumber(PLAYER)

    setfpscap(2)
    settings().Rendering.QualityLevel = 1
    UserSettings().GameSettings.MasterVolume = 0

    while true do
        listenForResponse()
        wait(10)
    end
end
