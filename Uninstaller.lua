--[[ Copium Uninstaller

     [VELOCITY]
     Created By Sammz

]]

local lplr = game:GetService("Players").LocalPlayer
local names = {'GuiLibrary.lua', 'MainScript.lua', 'Universal.lua'}
local folder = 'vape'
if not isfolder(folder) then
    lplr:Kick("Are you retarded?")
    return
end
function dfif(folderPath)
    local files = listfiles(folderPath)
    for _, fn in pairs(files) do
        delfile(folderPath .. '/' .. fn)
    end
end
function deleteFiles()
    local ftd = {'commithash.txt', 'assetsversion.txt'}
    for _, fn in pairs(ftd) do
        if isfolder(fn) then
              delfile(folder .. '/' .. fn)
       end
    end
end
for _, name in pairs(names) do
    if isfile(name) then
        delfile(folder .. '/' .. name)
     end
end
deleteFiles()
delfolder(folder .. '/' .. 'assets')
delfolder(folder .. '/' .. 'Libraries')
delfolder(folder .. '/' .. 'Profiles')
delfolder(folder .. '/' .. 'CustomModules')
delfolder(folder)
lplr:Kick("Velocity: \n Uninstall success!")
