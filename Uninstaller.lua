--[[ Copium Uninstaller

     [VELOCITY]
     Created By Copium

]]
local copium: table = {};
local cloneref: (obj: any) -> any = cloneref or function(obj)
    return obj;
end;
local playersService: Players = cloneref(game:GetService('Players'));
local lplr: Player = playersService.LocalPlayer;
if isfolder("newvape") then
     delfolder("newvape");
else
     lplr:Kick("Are you that dumb?");
end;
lplr:Kick("Velocity: \n Uninstall success!");
