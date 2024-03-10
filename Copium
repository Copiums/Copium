-- Copium Config Installer

local ScreenGui = Instance.new("ScreenGui")
local BackgroundFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local UIGradient2 = Instance.new("UIGradient")
local TextButton = Instance.new("TextButton")
local ConfigTextButton = Instance.new("TextButton")
local UpdatesTextButton = Instance.new("TextButton")
local ConfigTextsButton = Instance.new("TextButton")
local ConfigTextssButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local X = Instance.new("ImageButton")
local UICorner_3 = Instance.new("UICorner")
local Logo = Instance.new("ImageButton")
local TextBox = Instance.new("TextButton")
local Updates = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local ProgressBar = Instance.new("Frame")
local ProgressBarFill = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local blurEffect = Instance.new("BlurEffect")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
blurEffect.Size = 50

local UserInputService = game:GetService("UserInputService")
local httpService = game:GetService('HttpService')
local lplr = game.Players.LocalPlayer
local executor = (identifyexecutor or getexecutorname or function() return 'your executor' end)()
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() end)
local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end 
local mooo = 'Installer'
print(mooo)
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
blurEffect.Parent = game.Lighting

BackgroundFrame.Name = "BackgroundFrame"
BackgroundFrame.Parent = ScreenGui
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(106, 109, 109)
BackgroundFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackgroundFrame.BorderSizePixel = 0
BackgroundFrame.Position = UDim2.new(0.161472648, 0, 0.34363988, 0)
BackgroundFrame.Size = UDim2.new(0.676823139, 0, 0.435001612, 0)
BackgroundFrame.Active = true

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = BackgroundFrame

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 4.300000190734863
UIStroke.Transparency = 1
UIStroke.Parent = BackgroundFrame

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(27, 15, 62)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(37, 21, 83)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 11, 136))}
UIGradient.Rotation = 35
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.79, 0.05), NumberSequenceKeypoint.new(1.00, 0.00)}
UIGradient.Parent = BackgroundFrame

TextButton.Parent = BackgroundFrame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 0.950
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.463985831, 0, 0.53652221, 0)
TextButton.Size = UDim2.new(0.387690693, 0, 0.182094902, 0)
TextButton.Font = Enum.Font.Jura
TextButton.Text = "Install"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 25.000
UICorner_2.Parent = TextButton

ConfigTextButton.Parent = BackgroundFrame
ConfigTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ConfigTextButton.BackgroundTransparency = 0.950
ConfigTextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfigTextButton.BorderSizePixel = 0
ConfigTextButton.Position = UDim2.new(0.463985831, 0, 0.73652221, 0)
ConfigTextButton.Size = UDim2.new(0.387690693, 0, 0.182094902, 0)
ConfigTextButton.Font = Enum.Font.Jura
ConfigTextButton.Text = "Configs"
ConfigTextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigTextButton.TextSize = 25.000

UICorner_7.Parent = ConfigTextButton
X.Name = "X"
X.Parent = BackgroundFrame
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 0.950
X.BorderColor3 = Color3.fromRGB(0, 0, 0)
X.BorderSizePixel = 0
X.Position = UDim2.new(0.937627316, 0, 0.0332252383, 0)
X.Size = UDim2.new(0.0341279395, 7, 0.0908513665, 7)
X.Image = "rbxassetid://14219436180"
X.ImageTransparency = 0.330

UICorner_3.Parent = X

Logo.Name = "Logo"
Logo.Parent = BackgroundFrame
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.0998339728, 0, 0.0167164337, 0)
Logo.Size = UDim2.new(0.316528112, 0, 0.963727891, 0)
Logo.Image = "http://www.roblox.com/asset/?id=16689235246"

TextBox.Parent = BackgroundFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.606403351, 0, 0.305411696, 0)
TextBox.Size = UDim2.new(0.100000001, 0, 0.100000001, 0)
TextBox.Font = Enum.Font.Gotham
TextBox.Text = "Copium"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 55

Updates.Name = "Updates"
Updates.Parent = BackgroundFrame
Updates.BackgroundColor3 = BackgroundFrame.BackgroundColor3
Updates.BackgroundTransparency = 0.950
Updates.BorderColor3 = Color3.fromRGB(0, 0, 0)
Updates.BorderSizePixel = 0
Updates.Position = UDim2.new(0.877627316, 0, 0.0332252383, 0)
Updates.Size = UDim2.new(0.0501857921, 0, 0.119741611, 0)
Updates.Image = "rbxassetid://11401835376"
UICorner_4.Parent = Updates

ProgressBar.BackgroundTransparency = 0.990
ProgressBar.BorderSizePixel = 0
ProgressBar.Position = UDim2.new(TextBox.Position.X.Scale - 0.05, TextBox.Position.X.Offset, TextBox.Position.Y.Scale, TextBox.Position.Y.Offset + TextBox.TextSize + 25)
ProgressBar.Size = UDim2.new(0, 270, 0, 20) -- Adjusted size

ProgressBarFill.Name = "ProgressBarFill"
ProgressBarFill.Parent = ProgressBar
ProgressBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White
ProgressBarFill.BorderSizePixel = 0
ProgressBarFill.Size = UDim2.new(0, 0, 1, 0) -- Start with zero progress

UICorner_5 = Instance.new("UICorner")
UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = ProgressBar

local function toggleBlurEffect(enabled)
    if enabled then
        blurEffect.Parent = game.Lighting
    else
        blurEffect:Destroy()
    end
end

local function updateProgressBar(progress)
    ProgressBarFill.Size = UDim2.new(progress, 0, 1, 0)
end

local function showProgressBar()
    ProgressBar.Parent = BackgroundFrame
    ProgressBar.Position = UDim2.new(TextBox.Position.X.Scale - 0.05, TextBox.Position.X.Offset, TextBox.Position.Y.Scale, TextBox.Position.Y.Offset + TextBox.TextSize + 35)
end

local function hideProgressBar()
    ProgressBar.Parent = nil
end

X.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    toggleBlurEffect(false)
end)

function changeText(txt)
	text = txt
end

-- am sorry for skidding this 1 part cuz im lazy. THE ONLY PART THAT IS SKIDDED TILL THE NEXT: --
function Executor() 
	if not isfile then
		lplr:Kick("Executor does not support isfile, Fluxus, Delta, Vega X or Evon.")
	end
	if not readfile then
		lplr:Kick("Executor does not support readfile, Fluxus, Delta, Vega X or Evon.")
	end
	if not makefolder then
		lplr:Kick("Executor does not support makefolder, use Fluxus, Delta, Vega X or Evon.")
	end
	if not writefile then
		lplr:Kick("Executor does not support writefile, use Fluxus, Delta, Vega X or Evon.")
	end
	if not delfile then
		lplr:Kick("Executor does not support delfile, use Fluxus, Delta, Vega X or Evon.")
	end
end
Executor()

function ResetProfiles()
    if not isfolder('vape/Profiles') then
        makefolder('vape/Profiles')
    else
        delfolder('vape/Profiles')
        wait(.1)
        makefolder('vape/Profiles')
    end
end
local complete = false
function Etruia()
    ResetProfiles()
    local File1 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/6872265039.vapeprofile.txt', Method ='GET'}).Body
    local File2 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/6872265039GUIPositions.vapeprofile.txt', Method = 'GET'}).Body
    local File3 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/6872265039Voidware%20PinkGUIPositions.vapeprofile.txt', Method = 'GET'}).Body
    local File4 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/6872274481.vapeprofile.txt', Method ='GET'}).Body
    local File5 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/6872274481.vapeprofiles.txt', Method ='GET'}).Body
    local File6 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/Voidware%20Pink6872265039.vapeprofile.txt', Method ='GET'}).Body
    local File7 = httprequest({Url = 'https://raw.githubusercontent.com/Sail100/EtruiaConfigStorage/main/EtruiaDevelopment/updatefilenew/Voidware%20Pink6872274481.vapeprofile.txt', Method ='GET'}).Body
    writefile('vape/Profiles/6872265039.vapeprofile.txt', File1)
    writefile('vape/Profiles/6872265039GUIPositions.vapeprofile.txt', File2)
    writefile('vape/Profiles/6872265039Voidware PinkGUIPositions.vapeprofile.txt', File3)
    writefile('vape/Profiles/6872274481.vapeprofile.txt', File4)
    writefile('vape/Profiles/6872274481.vapeprofiles.txt', File5)
    writefile('vape/Profiles/Voidware Pink6872265039.vapeprofile.txt', File6)
    writefile('vape/Profiles/Voidware Pink6872274481.vapeprofile.txt', File7)
    loadfile('vape/NewMainScript.lua')()
end

-- dont skid pls. the rest is nonskidded
local hasLoaded = false
function RenderRed()
    if not hasLoaded then
        ResetProfiles()
        delfile('vape/CustomModules/6872274481.lua')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxlaserTechAlt/RenderRed/main/Installer.lua", true))()
        hasLoaded = true
    else
        print("Render Red has already been loaded once.")
    end
end

Updates.MouseButton1Click:Connect(function()
    local UpdateWindow = Instance.new("Frame")
    UpdateWindow.Name = "UpdateWindow"
    UpdateWindow.Parent = ScreenGui
    UpdateWindow.BackgroundColor3 = Color3.fromRGB(106, 109, 109)
    UpdateWindow.BorderColor3 = BackgroundFrame.BorderColor3
    UpdateWindow.BorderSizePixel = 0
    UpdateWindow.Position = BackgroundFrame.Position
    UpdateWindow.Size = BackgroundFrame.Size
    local UpdateText = Instance.new("TextLabel")
    UpdateText.Name = "UpdateText"
    UpdateText.Parent = UpdateWindow
    UpdateText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UpdateText.BackgroundTransparency = 1
    UpdateText.BorderSizePixel = 0
    UpdateText.Position = UDim2.new(0.05, 0, 0.05, 0)
    UpdateText.Size = UDim2.new(0.9, 0, 0.1, 0)
    UpdateText.Font = Enum.Font.Gotham
    UpdateText.Text = "Updates"
    UpdateText.TextColor3 = Color3.fromRGB(255, 255, 255)
    UpdateText.TextSize = 38
    UpdatesTextButton.Parent = UpdateWindow
    UpdatesTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UpdatesTextButton.BackgroundTransparency = 0.950
    UpdatesTextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    UpdatesTextButton.BorderSizePixel = 0
    UpdatesTextButton.Position = UDim2.new(0.05, 0, 0.2, 0)
    UpdatesTextButton.Size = UDim2.new(0.387690693, 0, 0.182094902, 0)
    UpdatesTextButton.Font = Enum.Font.Gotham
    UpdatesTextButton.Text = "Update 1 - Added MoonAura"
    UpdatesTextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    UpdatesTextButton.TextSize = 25.000
    local X_UpdateWindow = X:Clone()
    X_UpdateWindow.Parent = UpdateWindow
    X_UpdateWindow.Position = UDim2.new(0.937627316, 0, 0.0332252383, 0)
    X_UpdateWindow.MouseButton1Click:Connect(function()
        UpdateWindow:Destroy()
        toggleBlurEffect(true)
        showProgressBar()
    end)

    hideProgressBar()
    UIGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(27, 15, 62)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(37, 21, 83)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 11, 136))}
    UIGradient2.Rotation = 35
    UIGradient2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.0, 0.0), NumberSequenceKeypoint.new(1.00, 0.00)}
    UIGradient2.Parent = UpdateWindow  

    UICorner_6.CornerRadius = UDim.new(0.100000001, 0)
    UICorner_6.Parent = UpdateWindow
end)

ConfigTextButton.MouseButton1Click:Connect(function()
    local ConfigWindow = Instance.new("Frame")
    ConfigWindow.Name = "ConfigWindow"
    ConfigWindow.Parent = ScreenGui
    ConfigWindow.BackgroundColor3 = Color3.fromRGB(106, 109, 109)
    ConfigWindow.BorderColor3 = BackgroundFrame.BorderColor3
    ConfigWindow.BorderSizePixel = 0
    ConfigWindow.Position = BackgroundFrame.Position
    ConfigWindow.Size = BackgroundFrame.Size
    local ConfigText = Instance.new("TextLabel")
    ConfigText.Name = "ConfigText"
    ConfigText.Parent = ConfigWindow
    ConfigText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ConfigText.BackgroundTransparency = 1
    ConfigText.BorderSizePixel = 0
    ConfigText.Position = UDim2.new(0.05, 0, 0.05, 0)
    ConfigText.Size = UDim2.new(0.9, 0, 0.1, 0)
    ConfigText.Font = Enum.Font.Gotham
    ConfigText.Text = "Configs"
    ConfigText.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfigText.TextSize = 38
    ConfigTextsButton.Parent = ConfigWindow
    ConfigTextsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ConfigTextsButton.BackgroundTransparency = 0.950
    ConfigTextsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ConfigTextsButton.BorderSizePixel = 0
    ConfigTextsButton.Position = UDim2.new(0.05, 0, 0.2, 0)
    ConfigTextsButton.Size = UDim2.new(0.387690693, 0, 0.182094902, 0)
    ConfigTextsButton.Font = Enum.Font.Gotham
    ConfigTextsButton.Text = "Etruia"
    ConfigTextsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfigTextsButton.TextSize = 25.000
    ConfigTextsButton.MouseButton1Click:Connect(function()
        ConfigTextButton:Destroy()
        showProgressBar()
        local progressBarTween = game:GetService("TweenService"):Create(ProgressBarFill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)})
        progressBarTween:Play()
        progressBarTween.Completed:Connect(function()
            if isfolder('vape') then
                Etruia()
            else
                lplr:Kick("You Idiot, execute Render First")
            end
        end)
    end)
    ConfigTextssButton.Parent = ConfigWindow
    ConfigTextssButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ConfigTextssButton.BackgroundTransparency = 0.950
    ConfigTextssButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ConfigTextssButton.BorderSizePixel = 0
    ConfigTextssButton.Position = UDim2.new(0.56, 0, 0.2, 0)
    ConfigTextssButton.Size = UDim2.new(0.387690693, 0, 0.182094902, 0)
    ConfigTextssButton.Font = Enum.Font.Gotham
    ConfigTextssButton.Text = "Render Red"
    ConfigTextssButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfigTextssButton.TextSize = 25.000
    ConfigTextssButton.MouseButton1Click:Connect(function()
        ConfigTextButton:Destroy()
        showProgressBar()
        local progressBarTween = game:GetService("TweenService"):Create(ProgressBarFill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)})
        progressBarTween:Play()
        progressBarTween.Completed:Connect(function()
            if isfolder('vape') then
                RenderRed()
            else
                lplr:Kick("You Idiot, execute Render First")
            end
        end)
    end)
    local X_ConfigWindow = X:Clone()
    X_ConfigWindow.Parent = ConfigWindow
    X_ConfigWindow.Position = UDim2.new(0.937627316, 0, 0.0332252383, 0)
    X_ConfigWindow.MouseButton1Click:Connect(function()
        ConfigWindow:Destroy()
        toggleBlurEffect(true)
        showProgressBar()
    end)

    hideProgressBar()
    UIGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(27, 15, 62)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(37, 21, 83)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 11, 136))}
    UIGradient2.Rotation = 35
    UIGradient2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.0, 0.0), NumberSequenceKeypoint.new(1.00, 0.00)}
    UIGradient2.Parent = ConfigWindow  
    UICorner_8.CornerRadius = UDim.new(0.100000001, 0)
    UICorner_8.Parent = ConfigWindow
end)

TextButton.MouseButton1Click:Connect(function()
    TextButton:Destroy()
    showProgressBar()
    local progressBarTween = game:GetService("TweenService"):Create(ProgressBarFill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)})
    progressBarTween:Play()
    progressBarTween.Completed:Connect(function()
        if isfolder('vape') then
            InstallProfiles()
        else
            lplr:Kick("You Idiot, execute Render First")
        end
    end)
end)

local dragging = false

UpdateWindow.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = UpdateWindow.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UpdateWindow.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UpdateWindow.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        UpdateWindow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

ConfigWindow.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ConfigWindow.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

ConfigWindow.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

ConfigWindow.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        ConfigWindow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

BackgroundFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = BackgroundFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

BackgroundFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        BackgroundFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
