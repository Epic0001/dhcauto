
if getgenv().scriptinject then
    error("Alt control script is already executed")
end
getgenv().scriptinject = true

-- Access externally defined variables
local alts = getgenv().alts
local dont_kick = getgenv().dont_kick 
local ipv4 = getgenv().ipv4 
local server1 = ipv4 .. ":5000"
local server2 = ipv4 .. ":6000"

-- Set PS_Owner to the first alt
local PS_Owner = alts[1]

-- GUI Construction
local Converted = {
    _ScreenGui = Instance.new("ScreenGui"),
    _Frame = Instance.new("Frame"),
    _UIGradient = Instance.new("UIGradient"),
    _UsernameFrame = Instance.new("Frame"),
    _UICorner = Instance.new("UICorner"),
    _UIGradient1 = Instance.new("UIGradient"),
    _TextLabel = Instance.new("TextLabel"),
    _UserInfoFrame = Instance.new("Frame"),
    _UICorner1 = Instance.new("UICorner"),
    _UIGradient2 = Instance.new("UIGradient"),
    _Titles = Instance.new("Frame"),
    _UICorner2 = Instance.new("UICorner"),
    _TextLabel1 = Instance.new("TextLabel"),
    _TextLabel2 = Instance.new("TextLabel"),
    _MainInfo = Instance.new("TextLabel"),
    _userid = Instance.new("TextLabel"),
    _DisplayName = Instance.new("TextLabel"),
    _Username = Instance.new("TextLabel"),
    _ExtraInfo = Instance.new("TextLabel"),
    _AccountAge = Instance.new("TextLabel"),
    _BackDrop = Instance.new("Frame"),
    _UICorner3 = Instance.new("UICorner"),
    _StatisticsFrame = Instance.new("Frame"),
    _UICorner4 = Instance.new("UICorner"),
    _UIGradient3 = Instance.new("UIGradient"),
    _Titles1 = Instance.new("Frame"),
    _UICorner5 = Instance.new("UICorner"),
    _TextLabel3 = Instance.new("TextLabel"),
    _TextLabel4 = Instance.new("TextLabel"),
    _Statistics = Instance.new("Frame"),
    _TextLabel5 = Instance.new("TextLabel"),
    _TextLabel6 = Instance.new("TextLabel"),
    _BeforeCash = Instance.new("TextLabel"),
    _AfterCash = Instance.new("TextLabel"),
    _Bounty = Instance.new("TextLabel"),
    _TimeInServer = Instance.new("TextLabel"),
    _BountyText = Instance.new("TextLabel"),
    _StatusFrame = Instance.new("Frame"),
    _UICorner6 = Instance.new("UICorner"),
    _UIGradient4 = Instance.new("UIGradient"),
    _TextLabel7 = Instance.new("TextLabel"),
    _Frame1 = Instance.new("Frame"),
    _UICorner7 = Instance.new("UICorner"),
    _LogFrame = Instance.new("Frame"),
    _UICorner8 = Instance.new("UICorner"),
    _UIGradient5 = Instance.new("UIGradient"),
    _TextLabel8 = Instance.new("TextLabel"),
    _BackDrop2 = Instance.new("Frame"),
    _UICorner9 = Instance.new("UICorner"),
}

-- GUI Properties
local function setupGUI()
    local success, err = pcall(function()
        local CoreGui = game:GetService("CoreGui")
        Converted._ScreenGui.Parent = CoreGui
        Converted._ScreenGui.IgnoreGuiInset = true
        Converted._ScreenGui.Enabled = true
        Converted._ScreenGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
        Converted._ScreenGui.Name = "Gui"
        Converted._ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        Converted._Frame.Parent = Converted._ScreenGui
        Converted._Frame.Size = UDim2.new(1, 0, 1, 0)

        Converted._UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))
        }
        Converted._UIGradient.Rotation = -29
        Converted._UIGradient.Parent = Converted._Frame

        Converted._UsernameFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._UsernameFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._UsernameFrame.BorderSizePixel = 0
        Converted._UsernameFrame.Position = UDim2.new(0.320396513, 0, 0.130647853, 0)
        Converted._UsernameFrame.Size = UDim2.new(0.358956933, 0, 0.0980766341, 0)
        Converted._UsernameFrame.ZIndex = 2
        Converted._UsernameFrame.Name = "UsernameFrame"
        Converted._UsernameFrame.Parent = Converted._Frame

        Converted._UICorner.CornerRadius = UDim.new(0.3, 0)
        Converted._UICorner.Parent = Converted._UsernameFrame

        Converted._UIGradient1.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 29, 29)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))
        }
        Converted._UIGradient1.Rotation = 81
        Converted._UIGradient1.Parent = Converted._UsernameFrame

        Converted._TextLabel.Font = Enum.Font.SourceSans
        Converted._TextLabel.Text = "loading..."
        Converted._TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel.TextScaled = true
        Converted._TextLabel.TextSize = 14
        Converted._TextLabel.TextWrapped = true
        Converted._TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel.BackgroundTransparency = 1
        Converted._TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel.BorderSizePixel = 0
        Converted._TextLabel.Size = UDim2.new(1, 0, 1, 0)
        Converted._TextLabel.Parent = Converted._UsernameFrame

        Converted._UserInfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._UserInfoFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._UserInfoFrame.BorderSizePixel = 0
        Converted._UserInfoFrame.Position = UDim2.new(0.224984616, 0, 0.288347304, 0)
        Converted._UserInfoFrame.Size = UDim2.new(0.26285246, 0, 0.420175701, 0)
        Converted._UserInfoFrame.ZIndex = 2
        Converted._UserInfoFrame.Name = "UserInfoFrame"
        Converted._UserInfoFrame.Parent = Converted._Frame

        Converted._UICorner1.CornerRadius = UDim.new(0.1, 0)
        Converted._UICorner1.Parent = Converted._UserInfoFrame

        Converted._UIGradient2.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))
        }
        Converted._UIGradient2.Rotation = 81
        Converted._UIGradient2.Parent = Converted._UserInfoFrame

        Converted._Titles.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        Converted._Titles.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Titles.BorderSizePixel = 0
        Converted._Titles.Position = UDim2.new(0, 0, 0, 0)
        Converted._Titles.Size = UDim2.new(1, 0, 0.22862184, 0)
        Converted._Titles.ZIndex = 2
        Converted._Titles.Name = "Titles"
        Converted._Titles.Parent = Converted._UserInfoFrame

        Converted._UICorner2.CornerRadius = UDim.new(0.2, 0)
        Converted._UICorner2.Parent = Converted._Titles

        Converted._TextLabel1.Font = Enum.Font.SourceSansBold
        Converted._TextLabel1.Text = "User Info"
        Converted._TextLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel1.TextScaled = true
        Converted._TextLabel1.TextSize = 14
        Converted._TextLabel1.TextWrapped = true
        Converted._TextLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel1.BackgroundTransparency = 1
        Converted._TextLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel1.BorderSizePixel = 0
        Converted._TextLabel1.Position = UDim2.new(0.0178518556, 0, 0.0580206998, 0)
        Converted._TextLabel1.Size = UDim2.new(0.305774331, 0, 0.509256303, 0)
        Converted._TextLabel1.Parent = Converted._Titles

        Converted._TextLabel2.Font = Enum.Font.SourceSansBold
        Converted._TextLabel2.Text = "Accounts Info"
        Converted._TextLabel2.TextColor3 = Color3.fromRGB(115, 115, 115)
        Converted._TextLabel2.TextScaled = true
        Converted._TextLabel2.TextSize = 14
        Converted._TextLabel2.TextWrapped = true
        Converted._TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel2.BackgroundTransparency = 1
        Converted._TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel2.BorderSizePixel = 0
        Converted._TextLabel2.Position = UDim2.new(0.015868444, 0, 0.571381271, 0)
        Converted._TextLabel2.Size = UDim2.new(0.373804033, 0, 0.364196956, 0)
        Converted._TextLabel2.Parent = Converted._Titles

        Converted._MainInfo.Font = Enum.Font.SourceSansBold
        Converted._MainInfo.Text = "Main Info:"
        Converted._MainInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._MainInfo.TextScaled = true
        Converted._MainInfo.TextSize = 14
        Converted._MainInfo.TextWrapped = true
        Converted._MainInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._MainInfo.BackgroundTransparency = 1
        Converted._MainInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._MainInfo.BorderSizePixel = 0
        Converted._MainInfo.Position = UDim2.new(0.0147080319, 0, 0.230908513, 0)
        Converted._MainInfo.Size = UDim2.new(0.362676412, 0, 0.14310436, 0)
        Converted._MainInfo.Name = "MainInfo"
        Converted._MainInfo.Parent = Converted._UserInfoFrame

        Converted._userid.Font = Enum.Font.SourceSansBold
        Converted._userid.Text = "User ID:"
        Converted._userid.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._userid.TextScaled = true
        Converted._userid.TextSize = 14
        Converted._userid.TextWrapped = true
        Converted._userid.TextXAlignment = Enum.TextXAlignment.Left
        Converted._userid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._userid.BackgroundTransparency = 1
        Converted._userid.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._userid.BorderSizePixel = 0
        Converted._userid.Position = UDim2.new(0.0436378382, 0, 0.362490952, 0)
        Converted._userid.Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
        Converted._userid.Name = "userid"
        Converted._userid.Parent = Converted._UserInfoFrame

        Converted._DisplayName.Font = Enum.Font.SourceSansBold
        Converted._DisplayName.Text = "Display Name:"
        Converted._DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._DisplayName.TextScaled = true
        Converted._DisplayName.TextSize = 14
        Converted._DisplayName.TextWrapped = true
        Converted._DisplayName.TextXAlignment = Enum.TextXAlignment.Left
        Converted._DisplayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._DisplayName.BackgroundTransparency = 1
        Converted._DisplayName.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._DisplayName.BorderSizePixel = 0
        Converted._DisplayName.Position = UDim2.new(0.0436378382, 0, 0.44197005, 0)
        Converted._DisplayName.Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
        Converted._DisplayName.Name = "DisplayName"
        Converted._DisplayName.Parent = Converted._UserInfoFrame

        Converted._Username.Font = Enum.Font.SourceSansBold
        Converted._Username.Text = "Username:"
        Converted._Username.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._Username.TextScaled = true
        Converted._Username.TextSize = 14
        Converted._Username.TextWrapped = true
        Converted._Username.TextXAlignment = Enum.TextXAlignment.Left
        Converted._Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._Username.BackgroundTransparency = 1
        Converted._Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Username.BorderSizePixel = 0
        Converted._Username.Position = UDim2.new(0.0436378382, 0, 0.519241273, 0)
        Converted._Username.Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
        Converted._Username.Name = "Username"
        Converted._Username.Parent = Converted._UserInfoFrame

        Converted._ExtraInfo.Font = Enum.Font.SourceSansBold
        Converted._ExtraInfo.Text = "Extra Info:"
        Converted._ExtraInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._ExtraInfo.TextScaled = true
        Converted._ExtraInfo.TextSize = 14
        Converted._ExtraInfo.TextWrapped = true
        Converted._ExtraInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._ExtraInfo.BackgroundTransparency = 1
        Converted._ExtraInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._ExtraInfo.BorderSizePixel = 0
        Converted._ExtraInfo.Position = UDim2.new(0.0166915655, 0, 0.597395241, 0)
        Converted._ExtraInfo.Size = UDim2.new(0.362676412, 0, 0.14310436, 0)
        Converted._ExtraInfo.Name = "ExtraInfo"
        Converted._ExtraInfo.Parent = Converted._UserInfoFrame

        Converted._AccountAge.Font = Enum.Font.SourceSansBold
        Converted._AccountAge.Text = "Age: 0"
        Converted._AccountAge.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._AccountAge.TextScaled = true
        Converted._AccountAge.TextSize = 14
        Converted._AccountAge.TextWrapped = true
        Converted._AccountAge.TextXAlignment = Enum.TextXAlignment.Left
        Converted._AccountAge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._AccountAge.BackgroundTransparency = 1
        Converted._AccountAge.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._AccountAge.BorderSizePixel = 0
        Converted._AccountAge.Position = UDim2.new(0.0436378382, 0, 0.74001652, 0)
        Converted._AccountAge.Size = UDim2.new(0.912724257, 0, 0.0787154138, 0)
        Converted._AccountAge.Name = "AccountAge"
        Converted._AccountAge.Parent = Converted._UserInfoFrame

        Converted._BackDrop.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        Converted._BackDrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._BackDrop.BorderSizePixel = 0
        Converted._BackDrop.Position = UDim2.new(0.203336805, 0, 0.256957352, 0)
        Converted._BackDrop.Size = UDim2.new(0.592387259, 0, 0.483644336, 0)
        Converted._BackDrop.Name = "BackDrop"
        Converted._BackDrop.Parent = Converted._Frame

        Converted._UICorner3.CornerRadius = UDim.new(0.07, 0)
        Converted._UICorner3.Parent = Converted._BackDrop

        Converted._StatisticsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._StatisticsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._StatisticsFrame.BorderSizePixel = 0
        Converted._StatisticsFrame.Position = UDim2.new(0.511220336, 0, 0.289274961, 0)
        Converted._StatisticsFrame.Size = UDim2.new(0.26285246, 0, 0.420175701, 0)
        Converted._StatisticsFrame.ZIndex = 2
        Converted._StatisticsFrame.Name = "StatisticsFrame"
        Converted._StatisticsFrame.Parent = Converted._Frame

        Converted._UICorner4.CornerRadius = UDim.new(0.1, 0)
        Converted._UICorner4.Parent = Converted._StatisticsFrame

        Converted._UIGradient3.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))
        }
        Converted._UIGradient3.Rotation = 81
        Converted._UIGradient3.Parent = Converted._StatisticsFrame

        Converted._Titles1.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        Converted._Titles1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Titles1.BorderSizePixel = 0
        Converted._Titles1.Position = UDim2.new(0, 0, 0, 0)
        Converted._Titles1.Size = UDim2.new(1, 0, 0.22862184, 0)
        Converted._Titles1.ZIndex = 2
        Converted._Titles1.Name = "Titles"
        Converted._Titles1.Parent = Converted._StatisticsFrame

        Converted._UICorner5.CornerRadius = UDim.new(0.2, 0)
        Converted._UICorner5.Parent = Converted._Titles1

        Converted._TextLabel3.Font = Enum.Font.SourceSansBold
        Converted._TextLabel3.Text = "Statistics"
        Converted._TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel3.TextScaled = true
        Converted._TextLabel3.TextSize = 14
        Converted._TextLabel3.TextWrapped = true
        Converted._TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel3.BackgroundTransparency = 1
        Converted._TextLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel3.BorderSizePixel = 0
        Converted._TextLabel3.Position = UDim2.new(0.0178518556, 0, 0.0580206998, 0)
        Converted._TextLabel3.Size = UDim2.new(0.305774331, 0, 0.509256303, 0)
        Converted._TextLabel3.Parent = Converted._Titles1

        Converted._TextLabel4.Font = Enum.Font.SourceSansBold
        Converted._TextLabel4.Text = "View alts statistics"
        Converted._TextLabel4.TextColor3 = Color3.fromRGB(115, 115, 115)
        Converted._TextLabel4.TextScaled = true
        Converted._TextLabel4.TextSize = 14
        Converted._TextLabel4.TextWrapped = true
        Converted._TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel4.BackgroundTransparency = 1
        Converted._TextLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel4.BorderSizePixel = 0
        Converted._TextLabel4.Position = UDim2.new(0.0158685036, 0, 0.571381211, 0)
        Converted._TextLabel4.Size = UDim2.new(0.431602597, 0, 0.364196926, 0)
        Converted._TextLabel4.Parent = Converted._Titles1

        Converted._Statistics.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._Statistics.BackgroundTransparency = 1
        Converted._Statistics.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Statistics.BorderSizePixel = 0
        Converted._Statistics.Position = UDim2.new(0, 0, 0.228621662, 0)
        Converted._Statistics.Size = UDim2.new(1, 0, 0.771378338, 0)
        Converted._Statistics.Name = "Statistics"
        Converted._Statistics.Parent = Converted._StatisticsFrame

        Converted._TextLabel5.Font = Enum.Font.SourceSansBold
        Converted._TextLabel5.Text = "Stock: (Before/After tax)"
        Converted._TextLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel5.TextScaled = true
        Converted._TextLabel5.TextSize = 14
        Converted._TextLabel5.TextWrapped = true
        Converted._TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel5.BackgroundTransparency = 1
        Converted._TextLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel5.BorderSizePixel = 0
        Converted._TextLabel5.Position = UDim2.new(0.0158683825, 0, 0.0228966977, 0)
        Converted._TextLabel5.Size = UDim2.new(0.84034276, 0, 0.14310436, 0)
        Converted._TextLabel5.Parent = Converted._Statistics

        Converted._TextLabel6.Font = Enum.Font.SourceSansBold
        Converted._TextLabel6.Text = "Extra Info:"
        Converted._TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel6.TextScaled = true
        Converted._TextLabel6.TextSize = 14
        Converted._TextLabel6.TextWrapped = true
        Converted._TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel6.BackgroundTransparency = 1
        Converted._TextLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel6.BorderSizePixel = 0
        Converted._TextLabel6.Position = UDim2.new(0.0158686247, 0, 0.420726836, 0)
        Converted._TextLabel6.Size = UDim2.new(0.431602418, 0, 0.161935195, 0)
        Converted._TextLabel6.Parent = Converted._Statistics

        Converted._BeforeCash.Font = Enum.Font.SourceSansBold
        Converted._BeforeCash.Text = "Before Tax: $0"
        Converted._BeforeCash.TextColor3 = Color3.fromRGB(23, 193, 0)
        Converted._BeforeCash.TextScaled = true
        Converted._BeforeCash.TextSize = 14
        Converted._BeforeCash.TextWrapped = true
        Converted._BeforeCash.TextXAlignment = Enum.TextXAlignment.Left
        Converted._BeforeCash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._BeforeCash.BackgroundTransparency = 1
        Converted._BeforeCash.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._BeforeCash.BorderSizePixel = 0
        Converted._BeforeCash.Position = UDim2.new(0.0872755572, 0, 0.166001067, 0)
        Converted._BeforeCash.Size = UDim2.new(0.912724257, 0, 0.108759314, 0)
        Converted._BeforeCash.Name = "BeforeCash"
        Converted._BeforeCash.Parent = Converted._Statistics

        Converted._AfterCash.Font = Enum.Font.SourceSansBold
        Converted._AfterCash.Text = "After Tax: $0"
        Converted._AfterCash.TextColor3 = Color3.fromRGB(125, 125, 125)
        Converted._AfterCash.TextScaled = true
        Converted._AfterCash.TextSize = 14
        Converted._AfterCash.TextWrapped = true
        Converted._AfterCash.TextXAlignment = Enum.TextXAlignment.Left
        Converted._AfterCash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._AfterCash.BackgroundTransparency = 1
        Converted._AfterCash.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._AfterCash.BorderSizePixel = 0
        Converted._AfterCash.Position = UDim2.new(0.0872755572, 0, 0.274760365, 0)
        Converted._AfterCash.Size = UDim2.new(0.912724495, 0, 0.108134635, 0)
        Converted._AfterCash.Name = "AfterCash"
        Converted._AfterCash.Parent = Converted._Statistics

        Converted._Bounty.Font = Enum.Font.SourceSansBold
        Converted._Bounty.Text = "Bounty: "
        Converted._Bounty.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._Bounty.TextScaled = true
        Converted._Bounty.TextSize = 14
        Converted._Bounty.TextWrapped = true
        Converted._Bounty.TextXAlignment = Enum.TextXAlignment.Left
        Converted._Bounty.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._Bounty.BackgroundTransparency = 1
        Converted._Bounty.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Bounty.BorderSizePixel = 0
        Converted._Bounty.Position = UDim2.new(0.0297531094, 0, 0.581003726, 0)
        Converted._Bounty.Size = UDim2.new(0.912724257, 0, 0.113520786, 0)
        Converted._Bounty.Name = "Bounty"
        Converted._Bounty.Parent = Converted._Statistics

        Converted._TimeInServer.Font = Enum.Font.SourceSansBold
        Converted._TimeInServer.Text = "Time in server:"
        Converted._TimeInServer.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TimeInServer.TextScaled = true
        Converted._TimeInServer.TextSize = 14
        Converted._TimeInServer.TextWrapped = true
        Converted._TimeInServer.TextXAlignment = Enum.TextXAlignment.Left
        Converted._TimeInServer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TimeInServer.BackgroundTransparency = 1
        Converted._TimeInServer.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TimeInServer.BorderSizePixel = 0
        Converted._TimeInServer.Position = UDim2.new(0.0436378382, 0, 0.801384449, 0)
        Converted._TimeInServer.Size = UDim2.new(0.912724257, 0, 0.108759314, 0)
        Converted._TimeInServer.Name = "TimeInServer"
        Converted._TimeInServer.Parent = Converted._Statistics

        Converted._BountyText.Font = Enum.Font.SourceSansBold
        Converted._BountyText.Text = "BountyText"
        Converted._BountyText.TextColor3 = Color3.fromRGB(193, 193, 193)
        Converted._BountyText.TextScaled = true
        Converted._BountyText.TextSize = 14
        Converted._BountyText.TextWrapped = true
        Converted._BountyText.TextXAlignment = Enum.TextXAlignment.Left
        Converted._BountyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._BountyText.BackgroundTransparency = 1
        Converted._BountyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._BountyText.BorderSizePixel = 0
        Converted._BountyText.Position = UDim2.new(0.0694237649, 0, 0.692625105, 0)
        Converted._BountyText.Size = UDim2.new(0.912724257, 0, 0.108759314, 0)
        Converted._BountyText.Name = "BountyText"
        Converted._BountyText.Parent = Converted._Statistics

        Converted._StatusFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._StatusFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._StatusFrame.BorderSizePixel = 0
        Converted._StatusFrame.Position = UDim2.new(0.326131701, 0, 0.762373269, 0)
        Converted._StatusFrame.Size = UDim2.new(0.0814162493, 0, 0.0605340637, 0)
        Converted._StatusFrame.ZIndex = 2
        Converted._StatusFrame.Name = "StatusFrame"
        Converted._StatusFrame.Parent = Converted._Frame

        Converted._UICorner6.CornerRadius = UDim.new(0.3, 0)
        Converted._UICorner6.Parent = Converted._StatusFrame

        Converted._UIGradient4.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 0))
        }
        Converted._UIGradient4.Rotation = 81
        Converted._UIGradient4.Parent = Converted._StatusFrame

        Converted._TextLabel7.Font = Enum.Font.SourceSansBold
        Converted._TextLabel7.Text = "Connected"
        Converted._TextLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel7.TextScaled = true
        Converted._TextLabel7.TextSize = 14
        Converted._TextLabel7.TextWrapped = true
        Converted._TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel7.BackgroundTransparency = 1
        Converted._TextLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel7.BorderSizePixel = 0
        Converted._TextLabel7.Size = UDim2.new(1, 0, 1, 0)
        Converted._TextLabel7.Parent = Converted._StatusFrame

        Converted._Frame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._Frame1.BorderSizePixel = 0
        Converted._Frame1.Position = UDim2.new(0.326131701, 0, 0.821907341, 0)
        Converted._Frame1.Size = UDim2.new(0.0814162493, 0, 0.00301870318, 0)
        Converted._Frame1.ZIndex = 2
        Converted._Frame1.Parent = Converted._Frame

        Converted._UICorner7.CornerRadius = UDim.new(0.3, 0)
        Converted._UICorner7.Parent = Converted._Frame1

        Converted._LogFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._LogFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._LogFrame.BorderSizePixel = 0
        Converted._LogFrame.Position = UDim2.new(0.326131701, 0, 0.828944385, 0)
        Converted._LogFrame.Size = UDim2.new(0.0814162493, 0, 0.0605340637, 0)
        Converted._LogFrame.ZIndex = 2
        Converted._LogFrame.Name = "LogFrame"
        Converted._LogFrame.Parent = Converted._Frame

        Converted._UICorner8.CornerRadius = UDim.new(0.3, 0)
        Converted._UICorner8.Parent = Converted._LogFrame

        Converted._UIGradient5.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(43, 43, 43)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))
        }
        Converted._UIGradient5.Rotation = 81
        Converted._UIGradient5.Parent = Converted._LogFrame

        Converted._TextLabel8.Font = Enum.Font.SourceSansBold
        Converted._TextLabel8.Text = "Log: "
        Converted._TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel8.TextScaled = true
        Converted._TextLabel8.TextSize = 14
        Converted._TextLabel8.TextWrapped = true
        Converted._TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Converted._TextLabel8.BackgroundTransparency = 1
        Converted._TextLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._TextLabel8.BorderSizePixel = 0
        Converted._TextLabel8.Size = UDim2.new(1, 0, 1, 0)
        Converted._TextLabel8.Parent = Converted._LogFrame

        Converted._BackDrop2.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        Converted._BackDrop2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Converted._BackDrop2.BorderSizePixel = 0
        Converted._BackDrop2.Position = UDim2.new(0.304483891, 0, 0.7976017, 0)
        Converted._BackDrop2.Size = UDim2.new(0.124711983, 0, 0.0939341336, 0)
        Converted._BackDrop2.Name = "BackDrop2"
        Converted._BackDrop2.Parent = Converted._Frame

        Converted._UICorner9.CornerRadius = UDim.new(0.3, 0)
        Converted._UICorner9.Parent = Converted._BackDrop2
    end)
    if not success then
        warn("[DEBUG] setupGUI Error: " .. tostring(err))
    end
end

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
local ORIGINAL_CASH_AMOUNT = PLAYER_CASH and PLAYER_CASH.Value or 0
local CASHIERS = workspace:WaitForChild("Cashiers", 10)
local IGNORED = workspace:WaitForChild("Ignored", 10)
local ITEMS_DROP = IGNORED and IGNORED:WaitForChild("ItemsDrop", 10)
local SHOP = IGNORED and IGNORED:WaitForChild("Shop", 10)
local SPAWN = IGNORED and IGNORED:WaitForChild("Spawn", 10)
local LIGHTS = workspace:WaitForChild("Lights", 10)
local MAP = workspace:WaitForChild("MAP", 10)
local MAIN_EVENT = ReplicatedStorage:WaitForChild("MainEvent", 10)

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
        Converted._TextLabel.Text = PLAYER.Name
        Converted._userid.Text = "User ID: " .. PLAYER.UserId
        Converted._DisplayName.Text = "Display Name: " .. PLAYER.DisplayName
        Converted._Username.Text = "Username: " .. PLAYER.Name
        Converted._AccountAge.Text = "Age: " .. math.floor(PLAYER.AccountAge / 365) .. " years"
        if PLAYER_CASH then
            Converted._BeforeCash.Text = "Before Tax: " .. formatCash(PLAYER_CASH.Value)
            Converted._AfterCash.Text = "After Tax: " .. formatCash(math.floor(PLAYER_CASH.Value * 0.85))
        else
            Converted._BeforeCash.Text = "Before Tax: $0"
            Converted._AfterCash.Text = "After Tax: $0"
        end
    end)
    if not success then
        warn("[DEBUG] updateGUI Error: " .. tostring(err))
    end
end

-- Initialize GUI
setupGUI()
updateGUI()
if PLAYER_CASH then
    PLAYER_CASH:GetPropertyChangedSignal("Value"):Connect(updateGUI)
end

-- Low Graphics for Alts
local function makeEverythingInvisible()
    local success, err = pcall(function()
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end)
    if not success then
        warn("[DEBUG] makeEverythingInvisible Error: " .. tostring(err))
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
    for _, instance in ipairs(workspace:GetChildren()) do
        if not table.find(names, instance.Name) then
            instance:Destroy()
        end
    end
    for _, instance in ipairs(workspace.Ignored:GetChildren()) do
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
        for _, v in ipairs(ITEMS_DROP:GetChildren()) do
            if v:IsA("Part") then
                v:WaitForChild("Decal", 2):Destroy()
                v:WaitForChild("BillboardGui", 2).Enabled = false
                v.Transparency = 1
            end
        end
        ITEMS_DROP.ChildAdded:Connect(function(child)
            if child:IsA("Part") then
                task.wait(0.5)
                for _, decal in ipairs(child:GetChildren()) do
                    if decal:IsA("Decal") then
                        decal:Destroy()
                    end
                end
                if child:FindFirstChild("BillboardGui") then
                    child.BillboardGui.Enabled = false
                end
                child.Transparency = 1
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

-- Bank Teleport Positions
local teleportPositions = {
    [1] = Vector3.new(-393.01, 37, -338), -- Owner position
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
}

-- Get Alt Number
local function getAltNumber(userId)
    local success, result = pcall(function()
        for i, id in ipairs(alts) do
            if userId == id then
                print("[DEBUG] getAltNumber: Found alt number " .. i .. " for userId " .. userId)
                return i
            end
        end
        print("[DEBUG] getAltNumber: No alt found for userId " .. userId)
        return false
    end)
    if not success then
        warn("[DEBUG] getAltNumber Error: " .. tostring(result))
        return false
    end
    return result
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

local function dropMoney(money, name)
    local success, err = pcall(function()
        print("[DEBUG] dropMoney called with money: " .. tostring(money) .. ", name: " .. tostring(name))
        local amountString = tostring(money)
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
            local numberOfAltsInGame = 0
            for _, player in ipairs(Players:GetPlayers()) do
                if table.find(alts, player.UserId) then
                    numberOfAltsInGame += 1
                end
            end
            local targetdrop = limit / numberOfAltsInGame
            local timestodrop = targetdrop / 12750
            local roundedTimestoDrop = math.ceil(timestodrop)
            print("[DEBUG] Dropping " .. roundedTimestoDrop .. " times for " .. name)

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

-- Send DHC stock to server (Owner only)
local function sendStockToServer()
    if PLAYER.UserId ~= PS_Owner then return end
    local success, err = pcall(function()
        local request = http_request or request or HttpPost or syn.request
        if not request then
            warn("[DEBUG] No HTTP request function available")
            return
        end
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

-- Listen for server commands
local firstMessage = nil
local lastReceivedMessage = ""

local function listenForResponse()
    local success, err = pcall(function()
        while true do
            task.wait(2)
            local request = http_request or request or HttpPost or syn.request
            if not request then
                warn("[DEBUG] No HTTP request function available")
                return
            end
            local response = request({
                Url = "http://" .. server1,
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

-- Initialize Teleport Based on Alt Number
local function initializeTeleport()
    local success, err = pcall(function()
        local userId = PLAYER.UserId
        local altNumber = getAltNumber(userId)
        if altNumber then
            local position = teleportPositions[altNumber] or Vector3.new(-381.01, 37, -286)
            print("[DEBUG] Teleporting alt " .. userId .. " to position " .. tostring(position))
            teleport(position)
        else
            warn("[DEBUG] No alt number found for userId " .. userId)
        end
    end)
    if not success then
        warn("[DEBUG] initializeTeleport Error: " .. tostring(err))
    end
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
            end)
        end
    end)
    if not success then
        warn("[DEBUG] Respawn Handler Error: " .. tostring(err))
    end
end

-- Main Logic
if PLAYER.UserId == PS_Owner then
    -- Owner Logic
    local success, err = pcall(function()
        MAIN_EVENT:FireServer("RoleplayModeChange")
        print("[DEBUG] Fired RoleplayModeChange event")
        teleport(teleportPositions[1])
        task.spawn(function()
            while true do
                sendStockToServer()
                task.wait(60)
            end
        end)
        task.spawn(listenForResponse)
    end)
    if not success then
        warn("[DEBUG] Owner Logic Error: " .. tostring(err))
    end
else
    -- Alt Logic
    local success, err = pcall(function()
        task.spawn(listenForResponse)
        initializeTeleport()
        handleRespawn()
    end)
    if not success then
        warn("[DEBUG] Alt Logic Error: " .. tostring(err))
    end
end
