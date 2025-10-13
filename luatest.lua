
local server1 = ipv4 .. ":5000"
local server2 = ipv4 .. ":6000"

if getgenv().scriptinject == true then error("Alt control Script is already executed") end
getgenv().scriptinject = true

-- Set PS_Owner to the first alt
local PS_Owner = getgenv().alts[1] -- 6177522902 is the owner

-- GUI Construction
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
    ["_LocalScript"] = Instance.new("LocalScript"),
}

-- Properties
Converted["_ScreenGui"].Parent = game.CoreGui
Converted["_ScreenGui"].IgnoreGuiInset = true
Converted["_ScreenGui"].Enabled = true
Converted["_ScreenGui"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_ScreenGui"].Name = "Gui"
Converted["_ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Converted["_Frame"].Parent = Converted["_ScreenGui"]
Converted["_Frame"].Size = UDim2.new(1, 0, 1, 0)

Converted["_UIGradient"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))
}
Converted["_UIGradient"].Rotation = -29
Converted["_UIGradient"].Parent = Converted["_Frame"]

Converted["_UsernameFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UsernameFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_UsernameFrame"].BorderSizePixel = 0
Converted["_UsernameFrame"].Position = UDim2.new(0.320396513, 0, 0.130647853, 0)
Converted["_UsernameFrame"].Size = UDim2.new(0.358956933, 0, 0.0980766341, 0)
Converted["_UsernameFrame"].ZIndex = 2
Converted["_UsernameFrame"].Name = "UsernameFrame"
Converted["_UsernameFrame"].Parent = Converted["_Frame"]

Converted["_UICorner"].CornerRadius = UDim.new(0.3, 0)
Converted["_UICorner"].Parent = Converted["_UsernameFrame"]

Converted["_UIGradient1"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 29, 29)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
}
Converted["_UIGradient1"].Rotation = 81
Converted["_UIGradient1"].Parent = Converted["_UsernameFrame"]

Converted["_TextLabel"].Font = Enum.Font.SourceSans
Converted["_TextLabel"].Text = "loading..."
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel"].Parent = Converted["_UsernameFrame"]

Converted["_UserInfoFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_UserInfoFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_UserInfoFrame"].BorderSizePixel = 0
Converted["_UserInfoFrame"].Position = UDim2.new(0.224984616, 0, 0.288347304, 0)
Converted["_UserInfoFrame"].Size = UDim2.new(0.26285246, 0, 0.420175701, 0)
Converted["_UserInfoFrame"].ZIndex = 2
Converted["_UserInfoFrame"].Name = "UserInfoFrame"
Converted["_UserInfoFrame"].Parent = Converted["_Frame"]

Converted["_UICorner1"].CornerRadius = UDim.new(0.1, 0)
Converted["_UICorner1"].Parent = Converted["_UserInfoFrame"]

Converted["_UIGradient2"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))
}
Converted["_UIGradient2"].Rotation = 81
Converted["_UIGradient2"].Parent = Converted["_UserInfoFrame"]

Converted["_Titles"].BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Converted["_Titles"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Titles"].BorderSizePixel = 0
Converted["_Titles"].Position = UDim2.new(0, 0, 0, 0)
Converted["_Titles"].Size = UDim2.new(1, 0, 0.22862184, 0)
Converted["_Titles"].ZIndex = 2
Converted["_Titles"].Name = "Titles"
Converted["_Titles"].Parent = Converted["_UserInfoFrame"]

Converted["_UICorner2"].CornerRadius = UDim.new(0.2, 0)
Converted["_UICorner2"].Parent = Converted["_Titles"]

Converted["_TextLabel1"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel1"].Text = "User Info"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].TextScaled = true
Converted["_TextLabel1"].TextSize = 14
Converted["_TextLabel1"].TextWrapped = true
Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel1"].BorderSizePixel = 0
Converted["_TextLabel1"].Position = UDim2.new(0.0178518556, 0, 0.0580206998, 0)
Converted["_TextLabel1"].Size = UDim2.new(0.305774331, 0, 0.509256303, 0)
Converted["_TextLabel1"].Parent = Converted["_Titles"]

Converted["_TextLabel2"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel2"].Text = "Accounts Info"
Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(115, 115, 115)
Converted["_TextLabel2"].TextScaled = true
Converted["_TextLabel2"].TextSize = 14
Converted["_TextLabel2"].TextWrapped = true
Converted["_TextLabel2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel2"].BackgroundTransparency = 1
Converted["_TextLabel2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel2"].BorderSizePixel = 0
Converted["_TextLabel2"].Position = UDim2.new(0.015868444, 0, 0.571381271, 0)
Converted["_TextLabel2"].Size = UDim2.new(0.373804033, 0, 0.364196956, 0)
Converted["_TextLabel2"].Parent = Converted["_Titles"]

Converted["_MainInfo"].Font = Enum.Font.SourceSansBold
Converted["_MainInfo"].Text = "Main Info:"
Converted["_MainInfo"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_MainInfo"].TextScaled = true
Converted["_MainInfo"].TextSize = 14
Converted["_MainInfo"].TextWrapped = true
Converted["_MainInfo"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_MainInfo"].BackgroundTransparency = 1
Converted["_MainInfo"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_MainInfo"].BorderSizePixel = 0
Converted["_MainInfo"].Position = UDim2.new(0.0147080319, 0, 0.230908513, 0)
Converted["_MainInfo"].Size = UDim2.new(0.362676412, 0, 0.14310436, 0)
Converted["_MainInfo"].Name = "MainInfo"
Converted["_MainInfo"].Parent = Converted["_UserInfoFrame"]

Converted["_userid"].Font = Enum.Font.SourceSansBold
Converted["_userid"].Text = "User ID:"
Converted["_userid"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_userid"].TextScaled = true
Converted["_userid"].TextSize = 14
Converted["_userid"].TextWrapped = true
Converted["_userid"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_userid"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_userid"].BackgroundTransparency = 1
Converted["_userid"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_userid"].BorderSizePixel = 0
Converted["_userid"].Position = UDim2.new(0.0436378382, 0, 0.362490952, 0)
Converted["_userid"].Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
Converted["_userid"].Name = "userid"
Converted["_userid"].Parent = Converted["_UserInfoFrame"]

Converted["_Display Name"].Font = Enum.Font.SourceSansBold
Converted["_Display Name"].Text = "Display Name:"
Converted["_Display Name"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Display Name"].TextScaled = true
Converted["_Display Name"].TextSize = 14
Converted["_Display Name"].TextWrapped = true
Converted["_Display Name"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Display Name"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Display Name"].BackgroundTransparency = 1
Converted["_Display Name"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Display Name"].BorderSizePixel = 0
Converted["_Display Name"].Position = UDim2.new(0.0436378382, 0, 0.44197005, 0)
Converted["_Display Name"].Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
Converted["_Display Name"].Name = "Display Name"
Converted["_UserInfoFrame"].Parent = Converted["_Frame"]

Converted["_Username"].Font = Enum.Font.SourceSansBold
Converted["_Username"].Text = "Username:"
Converted["_Username"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Username"].TextScaled = true
Converted["_Username"].TextSize = 14
Converted["_Username"].TextWrapped = true
Converted["_Username"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Username"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Username"].BackgroundTransparency = 1
Converted["_Username"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Username"].BorderSizePixel = 0
Converted["_Username"].Position = UDim2.new(0.0436378382, 0, 0.519241273, 0)
Converted["_Username"].Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
Converted["_Username"].Name = "Username"
Converted["_Username"].Parent = Converted["_UserInfoFrame"]

Converted["_ExtraInfo"].Font = Enum.Font.SourceSansBold
Converted["_ExtraInfo"].Text = "Extra Info:"
Converted["_ExtraInfo"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ExtraInfo"].TextScaled = true
Converted["_ExtraInfo"].TextSize = 14
Converted["_ExtraInfo"].TextWrapped = true
Converted["_ExtraInfo"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ExtraInfo"].BackgroundTransparency = 1
Converted["_ExtraInfo"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ExtraInfo"].BorderSizePixel = 0
Converted["_ExtraInfo"].Position = UDim2.new(0.0166915655, 0, 0.597395241, 0)
Converted["_ExtraInfo"].Size = UDim2.new(0.362676412, 0, 0.14310436, 0)
Converted["_ExtraInfo"].Name = "ExtraInfo"
Converted["_ExtraInfo"].Parent = Converted["_UserInfoFrame"]

Converted["_AccountAge"].Font = Enum.Font.SourceSansBold
Converted["_AccountAge"].Text = "Age: 15"
Converted["_AccountAge"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AccountAge"].TextScaled = true
Converted["_AccountAge"].TextSize = 14
Converted["_AccountAge"].TextWrapped = true
Converted["_AccountAge"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_AccountAge"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AccountAge"].BackgroundTransparency = 1
Converted["_AccountAge"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AccountAge"].BorderSizePixel = 0
Converted["_AccountAge"].Position = UDim2.new(0.0436378382, 0, 0.74001652, 0)
Converted["_AccountAge"].Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
Converted["_AccountAge"].Name = "AccountAge"
Converted["_AccountAge"].Parent = Converted["_UserInfoFrame"]

Converted["_BackDrop"].BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Converted["_BackDrop"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_BackDrop"].BorderSizePixel = 0
Converted["_BackDrop"].Position = UDim2.new(0.203336805, 0, 0.256957352, 0)
Converted["_BackDrop"].Size = UDim2.new(0.592387259, 0, 0.483644336, 0)
Converted["_BackDrop"].Name = "BackDrop"
Converted["_BackDrop"].Parent = Converted["_Frame"]

Converted["_UICorner3"].CornerRadius = UDim.new(0.07, 0)
Converted["_UICorner3"].Parent = Converted["_BackDrop"]

Converted["_StatisticsFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_StatisticsFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_StatisticsFrame"].BorderSizePixel = 0
Converted["_StatisticsFrame"].Position = UDim2.new(0.511220336, 0, 0.289274961, 0)
Converted["_StatisticsFrame"].Size = UDim2.new(0.26285246, 0, 0.420175701, 0)
Converted["_StatisticsFrame"].ZIndex = 2
Converted["_StatisticsFrame"].Name = "StatisticsFrame"
Converted["_StatisticsFrame"].Parent = Converted["_Frame"]

Converted["_UICorner4"].CornerRadius = UDim.new(0.1, 0)
Converted["_UICorner4"].Parent = Converted["_StatisticsFrame"]

Converted["_UIGradient3"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))
}
Converted["_UIGradient3"].Rotation = 81
Converted["_UIGradient3"].Parent = Converted["_StatisticsFrame"]

Converted["_Titles1"].BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Converted["_Titles1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Titles1"].BorderSizePixel = 0
Converted["_Titles1"].Position = UDim2.new(0, 0, 0, 0)
Converted["_Titles1"].Size = UDim2.new(1, 0, 0.22862184, 0)
Converted["_Titles1"].ZIndex = 2
Converted["_Titles1"].Name = "Titles"
Converted["_Titles1"].Parent = Converted["_StatisticsFrame"]

Converted["_UICorner5"].CornerRadius = UDim.new(0.2, 0)
Converted["_UICorner5"].Parent = Converted["_Titles1"]

Converted["_TextLabel3"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel3"].Text = "Statistics"
Converted["_TextLabel3"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].TextScaled = true
Converted["_TextLabel3"].TextSize = 14
Converted["_TextLabel3"].TextWrapped = true
Converted["_TextLabel3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel3"].BackgroundTransparency = 1
Converted["_TextLabel3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel3"].BorderSizePixel = 0
Converted["_TextLabel3"].Position = UDim2.new(0.0178518556, 0, 0.0580206998, 0)
Converted["_TextLabel3"].Size = UDim2.new(0.305774331, 0, 0.509256303, 0)
Converted["_TextLabel3"].Parent = Converted["_Titles1"]

Converted["_TextLabel4"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel4"].Text = "View alts statistics"
Converted["_TextLabel4"].TextColor3 = Color3.fromRGB(115, 115, 115)
Converted["_TextLabel4"].TextScaled = true
Converted["_TextLabel4"].TextSize = 14
Converted["_TextLabel4"].TextWrapped = true
Converted["_TextLabel4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel4"].BackgroundTransparency = 1
Converted["_TextLabel4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel4"].BorderSizePixel = 0
Converted["_TextLabel4"].Position = UDim2.new(0.0158685036, 0, 0.571381211, 0)
Converted["_TextLabel4"].Size = UDim2.new(0.431602597, 0, 0.364196926, 0)
Converted["_TextLabel4"].Parent = Converted["_Titles1"]

Converted["_Statistics"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Statistics"].BackgroundTransparency = 1
Converted["_Statistics"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Statistics"].BorderSizePixel = 0
Converted["_Statistics"].Position = UDim2.new(0, 0, 0.228621662, 0)
Converted["_Statistics"].Size = UDim2.new(1, 0, 0.771378338, 0)
Converted["_Statistics"].Name = "Statistics"
Converted["_Statistics"].Parent = Converted["_StatisticsFrame"]

Converted["_TextLabel5"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel5"].Text = "Stock: (Before/After tax)"
Converted["_TextLabel5"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel5"].TextScaled = true
Converted["_TextLabel5"].TextSize = 14
Converted["_TextLabel5"].TextWrapped = true
Converted["_TextLabel5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel5"].BackgroundTransparency = 1
Converted["_TextLabel5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel5"].BorderSizePixel = 0
Converted["_TextLabel5"].Position = UDim2.new(0.0158683825, 0, 0.0228966977, 0)
Converted["_TextLabel5"].Size = UDim2.new(0.84034276, 0, 0.14310436, 0)
Converted["_TextLabel5"].Parent = Converted["_Statistics"]

Converted["_TextLabel6"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel6"].Text = "Extra Info:"
Converted["_TextLabel6"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel6"].TextScaled = true
Converted["_TextLabel6"].TextSize = 14
Converted["_TextLabel6"].TextWrapped = true
Converted["_TextLabel6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel6"].BackgroundTransparency = 1
Converted["_TextLabel6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel6"].BorderSizePixel = 0
Converted["_TextLabel6"].Position = UDim2.new(0.0158686247, 0, 0.420726836, 0)
Converted["_TextLabel6"].Size = UDim2.new(0.431602418, 0, 0.161935195, 0)
Converted["_TextLabel6"].Parent = Converted["_Statistics"]

Converted["_BeforeCash"].Font = Enum.Font.SourceSansBold
Converted["_BeforeCash"].Text = "Loading..."
Converted["_BeforeCash"].TextColor3 = Color3.fromRGB(23, 193, 0)
Converted["_BeforeCash"].TextScaled = true
Converted["_BeforeCash"].TextSize = 14
Converted["_BeforeCash"].TextWrapped = true
Converted["_BeforeCash"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_BeforeCash"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_BeforeCash"].BackgroundTransparency = 1
Converted["_BeforeCash"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_BeforeCash"].BorderSizePixel = 0
Converted["_BeforeCash"].Position = UDim2.new(0.0872755572, 0, 0.166001067, 0)
Converted["_BeforeCash"].Size = UDim2.new(0.912724257, 0, 0.108759314, 0)
Converted["_BeforeCash"].Name = "BeforeCash"
Converted["_BeforeCash"].Parent = Converted["_Statistics"]

Converted["_AfterCash"].Font = Enum.Font.SourceSansBold
Converted["_AfterCash"].Text = "Loading..."
Converted["_AfterCash"].TextColor3 = Color3.fromRGB(125, 125, 125)
Converted["_AfterCash"].TextScaled = true
Converted["_AfterCash"].TextSize = 14
Converted["_AfterCash"].TextWrapped = true
Converted["_AfterCash"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_AfterCash"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_AfterCash"].BackgroundTransparency = 1
Converted["_AfterCash"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_AfterCash"].BorderSizePixel = 0
Converted["_AfterCash"].Position = UDim2.new(0.0872755572, 0, 0.274760365, 0)
Converted["_AfterCash"].Size = UDim2.new(0.912724495, 0, 0.108134635, 0)
Converted["_AfterCash"].Name = "AfterCash"
Converted["_AfterCash"].Parent = Converted["_Statistics"]

Converted["_Bounty"].Font = Enum.Font.SourceSansBold
Converted["_Bounty"].Text = "Bounty: "
Converted["_Bounty"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bounty"].TextScaled = true
Converted["_Bounty"].TextSize = 14
Converted["_Bounty"].TextWrapped = true
Converted["_Bounty"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Bounty"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Bounty"].BackgroundTransparency = 1
Converted["_Bounty"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bounty"].BorderSizePixel = 0
Converted["_Bounty"].Position = UDim2.new(0.0297531094, 0, 0.581003726, 0)
Converted["_Bounty"].Size = UDim2.new(0.912724257, 0, 0.113520786, 0)
Converted["_Bounty"].Name = "Bounty"
Converted["_Bounty"].Parent = Converted["_Statistics"]

Converted["_Time in server"].Font = Enum.Font.SourceSansBold
Converted["_Time in server"].Text = "Time in server:"
Converted["_Time in server"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Time in server"].TextScaled = true
Converted["_Time in server"].TextSize = 14
Converted["_Time in server"].TextWrapped = true
Converted["_Time in server"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Time in server"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Time in server"].BackgroundTransparency = 1
Converted["_Time in server"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Time in server"].BorderSizePixel = 0
Converted["_Time in server"].Position = UDim2.new(0.0436378382, 0, 0.801384449, 0)
Converted["_Time in server"].Size = UDim2.new(0.912724257, 0, 0.108759314, 0)
Converted["_Time in server"].Name = "Time in server"
Converted["_Time in server"].Parent = Converted["_Statistics"]

Converted["_BountyText"].Font = Enum.Font.SourceSansBold
Converted["_BountyText"].Text = "BountyText"
Converted["_BountyText"].TextColor3 = Color3.fromRGB(193, 193, 193)
Converted["_BountyText"].TextScaled = true
Converted["_BountyText"].TextSize = 14
Converted["_BountyText"].TextWrapped = true
Converted["_BountyText"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_BountyText"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_BountyText"].BackgroundTransparency = 1
Converted["_BountyText"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_BountyText"].BorderSizePixel = 0
Converted["_BountyText"].Position = UDim2.new(0.0694237649, 0, 0.692625105, 0)
Converted["_BountyText"].Size = UDim2.new(0.912724257, 0, 0.108759314, 0)
Converted["_BountyText"].Name = "BountyText"
Converted["_BountyText"].Parent = Converted["_Statistics"]

Converted["_StatusFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_StatusFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_StatusFrame"].BorderSizePixel = 0
Converted["_StatusFrame"].Position = UDim2.new(0.326131701, 0, 0.762373269, 0)
Converted["_StatusFrame"].Size = UDim2.new(0.0814162493, 0, 0.0605340637, 0)
Converted["_StatusFrame"].ZIndex = 2
Converted["_StatusFrame"].Name = "StatusFrame"
Converted["_StatusFrame"].Parent = Converted["_Frame"]

Converted["_UICorner6"].CornerRadius = UDim.new(0.3, 0)
Converted["_UICorner6"].Parent = Converted["_StatusFrame"]

Converted["_UIGradient4"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 0))
}
Converted["_UIGradient4"].Rotation = 81
Converted["_UIGradient4"].Parent = Converted["_StatusFrame"]

Converted["_TextLabel7"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel7"].Text = "Connected"
Converted["_TextLabel7"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel7"].TextScaled = true
Converted["_TextLabel7"].TextSize = 14
Converted["_TextLabel7"].TextWrapped = true
Converted["_TextLabel7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel7"].BackgroundTransparency = 1
Converted["_TextLabel7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel7"].BorderSizePixel = 0
Converted["_TextLabel7"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel7"].Parent = Converted["_StatusFrame"]

Converted["_Frame1"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame1"].BorderSizePixel = 0
Converted["_Frame1"].Position = UDim2.new(0.326131701, 0, 0.821907341, 0)
Converted["_Frame1"].Size = UDim2.new(0.0814162493, 0, 0.00301870318, 0)
Converted["_Frame1"].ZIndex = 2
Converted["_Frame1"].Parent = Converted["_Frame"]

Converted["_UICorner7"].CornerRadius = UDim.new(0.3, 0)
Converted["_UICorner7"].Parent = Converted["_Frame1"]

Converted["_LogFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_LogFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_LogFrame"].BorderSizePixel = 0
Converted["_LogFrame"].Position = UDim2.new(0.326131701, 0, 0.828944385, 0)
Converted["_LogFrame"].Size = UDim2.new(0.0814162493, 0, 0.0605340637, 0)
Converted["_LogFrame"].ZIndex = 2
Converted["_LogFrame"].Name = "LogFrame"
Converted["_LogFrame"].Parent = Converted["_Frame"]

Converted["_UICorner8"].CornerRadius = UDim.new(0.3, 0)
Converted["_UICorner8"].Parent = Converted["_LogFrame"]

Converted["_UIGradient5"].Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))
}
Converted["_UIGradient5"].Rotation = 81
Converted["_UIGradient5"].Parent = Converted["_LogFrame"]

Converted["_TextLabel8"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel8"].Text = "Log: "
Converted["_TextLabel8"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel8"].TextScaled = true
Converted["_TextLabel8"].TextSize = 14
Converted["_TextLabel8"].TextWrapped = true
Converted["_TextLabel8"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel8"].BackgroundTransparency = 1
Converted["_TextLabel8"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel8"].BorderSizePixel = 0
Converted["_TextLabel8"].Size = UDim2.new(1, 0, 1, 0)
Converted["_TextLabel8"].Parent = Converted["_LogFrame"]

Converted["_BackDrop2"].BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Converted["_BackDrop2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_BackDrop2"].BorderSizePixel = 0
Converted["_BackDrop2"].Position = UDim2.new(0.304483891, 0, 0.7976017, 0)
Converted["_BackDrop2"].Size = UDim2.new(0.124711983, 0, 0.0939341336, 0)
Converted["_BackDrop2"].Name = "BackDrop2"
Converted["_BackDrop2"].Parent = Converted["_Frame"]

Converted["_UICorner9"].CornerRadius = UDim.new(0.3, 0)
Converted["_UICorner9"].Parent = Converted["_BackDrop2"]

-- Services and Variables
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")

local PLAYER = Players.LocalPlayer
local DATA_FOLDER = PLAYER:WaitForChild("DataFolder", 10)
local PLAYER_CASH = DATA_FOLDER and DATA_FOLDER:WaitForChild("Currency", 10)
local INFORMATION = DATA_FOLDER and DATA_FOLDER:WaitForChild("Information")
local INVENTORY = DATA_FOLDER and DATA_FOLDER:WaitForChild("Inventory")
local PLAYER_CREW = INFORMATION and INFORMATION:FindFirstChild("Crew")
local ORIGINAL_CASH_AMOUNT = PLAYER_CASH and PLAYER_CASH.Value or 0
local CASHIERS = workspace:WaitForChild("Cashiers", 10)
local IGNORED = workspace:WaitForChild("Ignored", 10)
local PLAYERS_FOLDER = workspace:WaitForChild("Players", 10)
local ITEMS_DROP = IGNORED and IGNORED:WaitForChild("ItemsDrop", 10)
local SHOP = IGNORED and IGNORED:WaitForChild("Shop", 10)
local SPAWN = IGNORED and IGNORED:WaitForChild("Spawn", 10)
local LIGHTS = workspace:WaitForChild("Lights", 10)
local MAP = workspace:WaitForChild("MAP", 10)
local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent", 10)

local PLAYER_GUI = PLAYER:WaitForChild("PlayerGui", 10)
local CORE_GUI = game.CoreGui

-- Config variables
local hideCash = true

-- Format cash value for GUI
local function formatCash(value)
    if not value then return "$0" end
    local formatted = string.format("%d", value)
    local k
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return "$" .. formatted
end

-- GUI Updates
local function updateGUI()
    local success, err = pcall(function()
        Converted["_TextLabel"].Text = PLAYER.Name
        Converted["_userid"].Text = "User ID: " .. PLAYER.UserId
        Converted["_Display Name"].Text = "Display Name: " .. PLAYER.DisplayName
        Converted["_Username"].Text = "Username: " .. PLAYER.Name
        Converted["_AccountAge"].Text = "Age: " .. math.floor(PLAYER.AccountAge / 365) .. " years"
        if PLAYER_CASH then
            Converted["_BeforeCash"].Text = "Before Tax: " .. formatCash(PLAYER_CASH.Value)
            Converted["_AfterCash"].Text = "After Tax: " .. formatCash(math.floor(PLAYER_CASH.Value * 0.85))
        else
            Converted["_BeforeCash"].Text = "Before Tax: $0"
            Converted["_AfterCash"].Text = "After Tax: $0"
        end
    end)
    if not success then
        warn("[DEBUG] GUI Update Error: " .. tostring(err))
    end
end
Converted["_LocalScript"].Parent = Converted["_ScreenGui"]
Converted["_LocalScript"].Enabled = true
updateGUI()

if PLAYER_CASH then
    PLAYER_CASH:GetPropertyChangedSignal("Value"):Connect(updateGUI)
end

-- Low Graphics for Alts
local function makeEverythingInvisible()
    local success, err = pcall(function()
        local allParts = game.Workspace:GetDescendants()
        for _, part in ipairs(allParts) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end)
    if not success then
        warn("[DEBUG] Low Graphics Error: " .. tostring(err))
    end
end

if PLAYER.UserId ~= PS_Owner then
    makeEverythingInvisible()
    setfpscap(2)
else
    setfpscap(2)
end

settings().Rendering.QualityLevel = 1
UserSettings().GameSettings.MasterVolume = 0
RunService:Set3dRenderingEnabled(PLAYER.UserId == PS_Owner)

-- Remove sky and atmosphere
local success, err = pcall(function()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then sky:Destroy() end
    local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
    if atmosphere then atmosphere:Destroy() end
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 0
    Lighting.ExposureCompensation = -100

    local emptySky = Instance.new("Sky")
    emptySky.SkyboxBk = "rbxassetid://1"
    emptySky.SkyboxDn = "rbxassetid://1"
    emptySky.SkyboxFt = "rbxassetid://1"
    emptySky.SkyboxLf = "rbxassetid://1"
    emptySky.SkyboxRt = "rbxassetid://1"
    emptySky.SkyboxUp = "rbxassetid://1"
    emptySky.Parent = Lighting
end)
if not success then
    warn("[DEBUG] Sky/Atmosphere Error: " .. tostring(err))
end

-- Clean up workspace
local names = {"SafePlatform", "Ignored", "Players", "Camera", "Terrain", PLAYER.Name}
local success, err = pcall(function()
    for _, instance in workspace:GetChildren() do
        if not table.find(names, instance.Name) then
            instance:Destroy()
        end
    end
    for _, instance in workspace.Ignored:GetChildren() do
        if not table.find(names, instance.Name) then
            instance:Destroy()
        end
    end
end)
if not success then
    warn("[DEBUG] Workspace Cleanup Error: " .. tostring(err))
end

-- Hide Cash
if hideCash and ITEMS_DROP then
    local success, err = pcall(function()
        for _, v in pairs(ITEMS_DROP:GetChildren()) do
            if v:IsA("Part") then
                v:WaitForChild("Decal", 2):Destroy()
                v:WaitForChild("Decal", 2):Destroy()
                v:WaitForChild("BillboardGui", 2).Enabled = false
                v.Transparency = 1
            end
        end
        ITEMS_DROP.ChildAdded:Connect(function(child)
            if child:IsA("Part") then
                if hideCash then
                    task.wait(0.5)
                    for _, decal in pairs(child:GetChildren()) do
                        if decal:IsA("Decal") then
                            decal:Destroy()
                        end
                    end
                    if child:FindFirstChild("BillboardGui") then
                        child.BillboardGui.Enabled = false
                    end
                    child.Transparency = 1
                else
                    child:WaitForChild("Decal", 2):Destroy()
                    child:WaitForChild("Decal", 2):Destroy()
                end
            end
        end)
    end)
    if not success then
        warn("[DEBUG] Hide Cash Error: " .. tostring(err))
    end
end

-- Anti-AFK
local success, err = pcall(function()
    PLAYER.Idled:Connect(function()
        print("[DEBUG] Anti-AFK triggered")
        VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)
if not success then
    warn("[DEBUG] Anti-AFK Error: " .. tostring(err))
end

-- Teleport Functions
local teleportThread
local teleporting = false

local function teleport(position)
    local success, err = pcall(function()
        teleporting = false
        if teleportThread then
            task.cancel(teleportThread)
        end

        teleporting = true
        teleportThread = task.spawn(function()
            while teleporting do
                task.wait()
                local hrp = PLAYER.Character and PLAYER.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(position)
                    hrp.Velocity = Vector3.zero
                end
            end
        end)
    end)
    if not success then
        warn("[DEBUG] Teleport Error: " .. tostring(err))
    end
end

local function stopTeleport()
    teleporting = false
    if teleportThread then
        task.cancel(teleportThread)
    end
end

local function teleport2(position)
    local success, err = pcall(function()
        teleporting = false
        task.wait()

        teleporting = true
        teleportThread = task.spawn(function()
            while teleporting do
                task.wait()
                local root = PLAYER.Character and PLAYER.Character:WaitForChild("HumanoidRootPart", 2)
                if root then
                    root.CFrame = position
                    root.Velocity = Vector3.zero
                end
            end
        end)

        local humanoid = PLAYER.Character and PLAYER.Character:WaitForChild("Humanoid", 2)
        if humanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://13850660986"
            local loadedAnimation = humanoid:LoadAnimation(animation)
            loadedAnimation:Play()
        end
    end)
    if not success then
        warn("[DEBUG] Teleport2 Error: " .. tostring(err))
    end
end

-- Bank TP positions
local teleportPositions = {
    [1] = Vector3.new(-393.01, 37, -338),
    [2] = Vector3.new(-381.01, 37, -338),
    [3] = Vector3.new(-369.01, 37, -338),
    [4] = Vector3.new(-357.01, 37, -338),
    [5] = Vector3.new(-393.01, 37, -325),
    [6] = Vector3.new(-381.01, 37, -325),
    [7] = Vector3.new(-369.01, 37, -325),
    [8] = Vector3.new(-357.01, 37, -325),
    [9] = Vector3.new(-393.01, 37, -312),
    [10] = Vector3.new(-381.01, 37, -312),
    [11] = Vector3.new(-369.01, 37, -312),
    [12] = Vector3.new(-357.01, 37, -312),
    [13] = Vector3.new(-393.01, 37, -299),
    [14] = Vector3.new(-381.01, 37, -299),
    [15] = Vector3.new(-369.01, 37, -299),
    [16] = Vector3.new(-357.01, 37, -299),
    [17] = Vector3.new(-393.01, 37, -286),
    [18] = Vector3.new(-381.01, 37, -286),
    [19] = Vector3.new(-369.01, 37, -286),
    [20] = Vector3.new(-357.01, 37, -286),
    [21] = Vector3.new(-393.01, 37, -273),
    [22] = Vector3.new(-381.01, 37, -273),
    [23] = Vector3.new(-369.01, 37, -273),
    [24] = Vector3.new(-357.01, 37, -273),
    [25] = Vector3.new(-393.01, 37, -260),
    [26] = Vector3.new(-381.01, 37, -260),
    [27] = Vector3.new(-369.01, 37, -260),
    [28] = Vector3.new(-357.01, 37, -260),
    [29] = Vector3.new(-393.01, 37, -247),
    [30] = Vector3.new(-381.01, 37, -247),
    [31] = Vector3.new(-369.01, 37, -247),
    [32] = Vector3.new(-357.01, 37, -247),
    [33] = Vector3.new(-393.01, 37, -233),
    [34] = Vector3.new(-381.01, 37, -233),
    [35] = Vector3.new(-369.01, 37, -233),
    [36] = Vector3.new(-357.01, 37, -233),
    [37] = Vector3.new(-405.01, 37, -299),
    [38] = Vector3.new(-405.01, 37, -286),
    [39] = Vector3.new(-405.01, 37, -273),
}

-- Get Alt Number
function getAltNumber(userId)
    local success, err = pcall(function()
        for i, id in ipairs(getgenv().alts) do
            if userId == id then
                print("[DEBUG] getAltNumber: Found alt number " .. i)
                return i
            end
        end
        print("[DEBUG] getAltNumber: No alt found")
        return false
    end)
    if not success then
        warn("[DEBUG] getAltNumber Error: " .. tostring(err))
        return false
    end
    return success
end

-- VIP Commands
local function kick(player)
    local success, err = pcall(function()
        if table.find(getgenv().dont_kick, player.UserId) then
            print("[DEBUG] Cannot kick player " .. player.Name .. " (in dont_kick list)")
            return
        end
        MAIN_EVENT:FireServer("VIP_CMD", "Kick", player)
        print("[DEBUG] Kicked player " .. player.Name)
    end)
    if not success then
        warn("[DEBUG] Kick Error: " .. tostring(err))
    end
end

local function summon(player)
    local success, err = pcall(function()
        MAIN_EVENT:FireServer("VIP_CMD", "Summon", player)
        print("[DEBUG] Summoned player " .. player.Name)
    end)
    if not success then
        warn("[DEBUG] Summon Error: " .. tostring(err))
    end
end

-- Chats/Shouts
local function shout(message)
    local success, err = pcall(function()
        MAIN_EVENT:FireServer("Shout", message)
        print("[DEBUG] Shouted: " .. message)
    end)
    if not success then
        warn("[DEBUG] Shout Error: " .. tostring(err))
    end
end

-- Cash Functions
local currencyPostFixes = {
    ["k"] = 1000,
    ["m"] = 1000000,
    ["b"] = 1000000000,
}

local function cashToInt(stringValue)
    local success, result = pcall(function()
        local noDollarSign = string.sub(stringValue, 2, #stringValue)
        local noComma = string.gsub(noDollarSign, ",", "")
        return tonumber(noComma)
    end)
    if not success then
        warn("[DEBUG] cashToInt Error: " .. tostring(result))
        return 0
    end
    return result
end

local function countFloorCash()
    local success, totalFloorCashAmount = pcall(function()
        local total = 0
        if ITEMS_DROP then
            for _, v in pairs(ITEMS_DROP:GetChildren()) do
                if v:IsA("Part") and v:FindFirstChild("BillboardGui") and v.BillboardGui:FindFirstChild("TextLabel") then
                    local amount = cashToInt(v.BillboardGui.TextLabel.Text)
                    total += amount
                end
            end
        end
        return total
    end)
    if not success then
        warn("[DEBUG] countFloorCash Error: " .. tostring(totalFloorCashAmount))
        return 0
    end
    return totalFloorCashAmount
end

-- Player Tracking
local trackedPlayers = {}

local function is_bot(userId)
    for _, id in ipairs(getgenv().alts) do
        if id == userId then
            return true
        end
    end
    return false
end

local function is_whitelisted_user(userId)
    for _, id in ipairs(getgenv().dont_kick) do
        if id == userId then
            return true
        end
    end
    return false
end

local function getPlayerData(userId)
    return trackedPlayers[userId]
end

local function updatePlayerData(userId, fields)
    if not trackedPlayers[userId] then
        trackedPlayers[userId] = {}
    end
    for k, v in pairs(fields) do
        trackedPlayers[userId][k] = v
    end
    return true
end

local function isPlayerNearPosition(player, position, maxDistance)
    local success, result = pcall(function()
        if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            return false
        end
        local playerPos = player.Character.HumanoidRootPart.Position
        local distance = (playerPos - position).Magnitude
        return distance <= maxDistance
    end)
    if not success then
        warn("[DEBUG] isPlayerNearPosition Error: " .. tostring(result))
        return false
    end
    return result
end

local function isOwnerInGame()
    for _, player in pairs(Players:GetPlayers()) do
        if player.UserId == PS_Owner then
            return true
        end
    end
    return false
end

-- Code Redeemer
task.spawn(function()
    local success, err = pcall(function()
        local api = loadstring(game:HttpGet('https://raw.githubusercontent.com/furryboy1/dh-code-redeemer/refs/heads/main/codes.lua'))()
        for _, v in pairs(api.codes) do
            task.wait(api.rate)
            MAIN_EVENT:FireServer('EnterPromoCode', v)
            print("[DEBUG] Redeemed code: " .. v)
        end
    end)
    if not success then
        warn("[DEBUG] Code Redeemer Error: " .. tostring(err))
    end
end)

-- Anti-Idle
local success, err = pcall(function()
    local GC = getconnections
    if GC then
        for i, v in pairs(GC(Players.LocalPlayer.Idled)) do
            if v["Disable"] then
                v["Disable"](v)
            elseif v["Disconnect"] then
                v["Disconnect"](v)
            end
        end
    end
end)
if not success then
    warn("[DEBUG] Anti-Idle Error: " .. tostring(err))
end

-- Respawn Handler for Alts
local function handleRespawn()
    local success, err = pcall(function()
        if PLAYER.UserId ~= PS_Owner then
            local humanoid = PLAYER.Character and PLAYER.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health <= 0 then
                print("[DEBUG] Alt died, attempting to respawn")
                PLAYER:LoadCharacter()
            end
            PLAYER.CharacterAdded:Connect(function(character)
                print("[DEBUG] Alt character respawned")
                local userId = PLAYER.UserId
                local altNumber = getAltNumber(userId)
                local position = teleportPositions[altNumber] or Vector3.new(-381.01, 37, -286)
                teleport(position)
            end
        end
    end)
    if not success then
        warn("[DEBUG] Respawn Handler Error: " .. tostring(err))
    end
end
task.spawn(handleRespawn)

-- Main/Alt Logic
local firstMessage = nil
local lastReceivedMessage = ""

local function countAltsInGame()
    local success, count = pcall(function()
        local count = 0
        for _, player in pairs(Players:GetPlayers()) do
            if is_bot(player.UserId) then
                count += 1
            end
        end
        return count
    end)
    if not success then
        warn("[DEBUG] countAltsInGame Error: " .. tostring(count))
        return 1
    end
    return count
end

function dropMoney(money, name)
    local success, err = pcall(function()
        print("[DEBUG] dropMoney called with money: " .. tostring(money) .. ", name: " .. tostring(name))
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
            print("[DEBUG] Number of alts in game: " .. numberOfAltsInGame)
            local targetdrop = limit / numberOfAltsInGame
            print("[DEBUG] Target drop per alt: " .. targetdrop)
            local timestodrop = targetdrop / 12750
            print("[DEBUG] Times to drop: " .. timestodrop)
            local roundedTimestoDrop = math.ceil(timestodrop)
            print("[DEBUG] Rounded times to drop: " .. roundedTimestoDrop)

            for i = 1, roundedTimestoDrop do
                if PLAYER_CASH and PLAYER_CASH.Value >= 12750 then
                    MAIN_EVENT:FireServer("DropMoney", 12750)
                    print("[DEBUG] Dropped 12750 for " .. name)
                    task.wait(0.5)
                else
                    print("[DEBUG] Insufficient cash to drop for " .. name)
                    break
                end
            end
        else
            print("[DEBUG] Invalid amount for dropMoney: " .. tostring(amountString))
        end
    end)
    if not success then
        warn("[DEBUG] dropMoney Error: " .. tostring(err))
    end
end

local function listenForResponse()
    local success, err = pcall(function()
        while true do
            task.wait(2)
            local request = http_request or request or HttpPost or syn.request
            local abc123 = "http://" .. server1
            local response = request({
                Url = abc123,
                Method = "GET"
            })
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
                        print("[DEBUG] Parsed message - First: " .. tostring(firstWord) .. ", Middle: " .. tostring(middleWord) .. ", Last: " .. tostring(lastWord))
                        lastReceivedMessage = flaskMessage
                        if firstWord ~= "setting" and lastWord ~= "up" then
                            if flaskMessage ~= firstMessage then
                                dropMoney(firstWord, middleWord)
                            end
                        end
                    end
                end
            else
                warn("[DEBUG] HTTP request failed or no response body")
            end
        end
    end)
    if not success then
        warn("[DEBUG] listenForResponse Error: " .. tostring(err))
    end
end

-- Send DHC stock to server
local function sendStockToServer()
    local success, err = pcall(function()
        local request = http_request or request or HttpPost or syn.request
        local url = "http://" .. server2
        local cash = PLAYER_CASH and PLAYER_CASH.Value or 0
        local data = {
            userId = PLAYER.UserId,
            cash = cash,
            timestamp = os.time()
        }
        local encodedData = HttpService:JSONEncode(data)
        request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = encodedData
        })
        print("[DEBUG] Sent DHC stock to server: " .. cash)
    end)
    if not success then
        warn("[DEBUG] sendStockToServer Error: " .. tostring(err))
    end
end

-- Initialize Teleport Based on Alt Number
local function initializeTeleport()
    local success, err = pcall(function()
        local userId = PLAYER.UserId
        local altNumber = getAltNumber(userId)
        if altNumber then
            local position = teleportPositions[altNumber] or Vector3.new(-381.01, 37, -286)
            teleport(position)
        end
    end)
    if not success then
        warn("[DEBUG] initializeTeleport Error: " .. tostring(err))
    end
end

if PLAYER.UserId == PS_Owner then
    -- Main (Owner) Logic
    MAIN_EVENT:FireServer("RoleplayModeChange")
    print("[DEBUG] Fired RoleplayModeChange event")

    teleport(Vector3.new(-393.01, 37, -338)) -- Position for owner (alt 1)

    task.spawn(function()
        local success, err = pcall(function()
            while true do
                sendStockToServer()
                task.wait(60) -- Report every 60 seconds
            end
        end)
        if not success then
            warn("[DEBUG] Stock Reporting Loop Error: " .. tostring(err))
        end
    end)

    task.spawn(listenForResponse)

    local centerPosition = CFrame.new(-263.75531005859375, -13.117109298706055, -378.037841796875)
    teleport(centerPosition)

    local function onPlayerAdded(player)
        repeat
            task.wait(0.1)
        until player.Character and player.Character:FindFirstChild("FULLY_LOADED_CHAR") ~= nil

        if is_bot(player.UserId) then
            return
        end

        local playerData = getPlayerData(player.UserId)
        if playerData then
            local DHC_bought = playerData.DHC_bought or 0
            local spentCash = playerData.spentCash or 0
            local startCash = playerData.startCash or 0
            task.spawn(Track, player.Name, DHC_bought, spentCash, startCash)
            task.wait(1)
            summon(player)
            task.wait(1)
        else
            task.wait(3)
            if not is_bot(player.UserId) and not is_whitelisted_user(player.UserId) then
                kick(player)
            else
                summon(player)
            end
        end
    end

    task.spawn(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= PLAYER then
                if player and player.Parent then
                    if not is_bot(player.UserId) then
                        task.spawn(function()
                            onPlayerAdded(player)
                        end)
                        task.wait(10)
                    end
                end
            end
        end
    end)

    Players.PlayerAdded:Connect(onPlayerAdded)
else
    -- Alt Logic
    local function removeCharacter(player)
        if player ~= PLAYER and player.Character and not is_bot(player.UserId) then
            pcall(function()
                player.Character:Destroy()
            end)
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        pcall(function()
            removeCharacter(player)
        end)
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            pcall(function()
                removeCharacter(player)
            end)
        end)
    end)

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= PLAYER then
            player.CharacterAdded:Connect(function()
                pcall(function()
                    removeCharacter(player)
                end)
            end)
        end
    end

    task.spawn(listenForResponse)
    initializeTeleport()
end
