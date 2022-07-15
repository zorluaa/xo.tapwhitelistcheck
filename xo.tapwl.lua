local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Splix"))()

local window = library:new({textsize = 13.5,font = Enum.Font.RobotoMono,name = "Xo.tap (Dahood)",color = Color3.fromRGB(225,58,81)})

local tab = window:page({name = "Main"})
local tab1 = window:page({name = "Main I"})
local tab2 = window:page({name = "Teleports"})

local section = tab:section({name = "Aiming ",side = "left",size = 250})
local section1 = tab:section({name = "Misc",side = "left",size = 250})
local section2 = tab1:section({name = "Gods",side = "left",size = 250})
local section3 = tab1:section({name = "Extra",side = "left",size = 250})
local section4 = tab2:section({name = "Teleports",side = "left",size = 400})



section:toggle({name = "Silent Aim",def = false,callback = function(value)
    local Settings = {
        rewrittenmain = {
            Enabled = true,
            Key = "q",
            DOT = true,
            AIRSHOT = true,
            NOTIF = true,
            AUTOPRED = false,
            FOV = math.huge,
            RESOVLER = false
        }
    }
    
    local SelectedPart = "HumanoidRootPart"
    local Prediction = true
    local PredictionValue = 0.126
    
    
        local AnchorCount = 0
        local MaxAnchor = 50
    
        local CC = game:GetService"Workspace".CurrentCamera
        local Plr;
        local enabled = false
        local accomidationfactor = 0.109542
        local mouse = game.Players.LocalPlayer:GetMouse()
        local placemarker = Instance.new("Part", game.Workspace)
    
        function makemarker(Parent, Adornee, Color, Size, Size2)
            local e = Instance.new("BillboardGui", Parent)
            e.Name = "PP"
            e.Adornee = Adornee
            e.Size = UDim2.new(Size, Size2, Size, Size2)
            e.AlwaysOnTop = Settings.rewrittenmain.DOT
            local a = Instance.new("Frame", e)
            if Settings.rewrittenmain.DOT == true then
            a.Size = UDim2.new(1, 0, 1, 0)
            else
            a.Size = UDim2.new(0, 0, 0, 0)
            end
            if Settings.rewrittenmain.DOT == true then
            a.Transparency = 0
            a.BackgroundTransparency = 0
            else
            a.Transparency = 1
            a.BackgroundTransparency = 1
            end
            a.BackgroundColor3 = Color
            local g = Instance.new("UICorner", a)
            if Settings.rewrittenmain.DOT == false then
            g.CornerRadius = UDim.new(0, 0)
            else
            g.CornerRadius = UDim.new(1, 1) 
            end
            return(e)
        end
    
        
        local data = game.Players:GetPlayers()
        function noob(player)
            local character
            repeat wait() until player.Character
            local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(107, 184, 255), 0.3, 3)
            handler.Name = player.Name
            player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
    
    
            spawn(function()
                while wait() do
                    if player.Character then
                    end
                end
            end)
        end
    
        for i = 1, #data do
            if data[i] ~= game.Players.LocalPlayer then
                noob(data[i])
            end
        end
    
        game.Players.PlayerAdded:connect(function(Player)
            noob(Player)
        end)
    
        spawn(function()
            placemarker.Anchored = true
            placemarker.CanCollide = false
            if Settings.rewrittenmain.DOT == true then
            placemarker.Size = Vector3.new(8, 8, 8)
            else
            placemarker.Size = Vector3.new(0, 0, 0)
            end
            placemarker.Transparency = 0.75
            if Settings.rewrittenmain.DOT then
            makemarker(placemarker, placemarker, Color3.fromRGB(232, 186, 200), 0.40, 0)
            end
        end)
    
        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
            if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
                if enabled == true then
                    enabled = false
                    if Settings.rewrittenmain.NOTIF == true then
                        Plr = getClosestPlayerToCursor()
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Xo.tap REWRITE";
                        Text = "untoggled on penis",
                        Duration = 5
                    })
                end
                else
                    Plr = getClosestPlayerToCursor()
                    enabled = true
                    if Settings.rewrittenmain.NOTIF == true then
    
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "";
                            Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                            Duration = 5
                        })
    
                    end
                end
            end
        end)
    
    
    
        function getClosestPlayerToCursor()
            local closestPlayer
            local shortestDistance = Settings.rewrittenmain.FOV
    
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                    local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                    if magnitude < shortestDistance then
                        closestPlayer = v
                        shortestDistance = magnitude
                    end
                end
            end
            return closestPlayer
        end
    
        local pingvalue = nil;
        local split = nil;
        local ping = nil;
    
        game:GetService"RunService".Stepped:connect(function()
            if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
                placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
            else
                placemarker.CFrame = CFrame.new(0, 9999, 0)
            end
            if Settings.rewrittenmain.AUTOPRED == true then
                 pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                 split = string.split(pingvalue,'(')
                 ping = tonumber(split[1])
                if ping < 130 then
                    PredictionValue = 0.151
                elseif ping < 125 then
                    PredictionValue = 0.149
                elseif ping < 110 then
                    PredictionValue = 0.146
                elseif ping < 105 then
                    PredictionValue = 0.138
                elseif ping < 90 then
                    PredictionValue = 0.136
                elseif ping < 80 then
                    PredictionValue = 0.134
                elseif ping < 70 then
                    PredictionValue = 0.131
                elseif ping < 60 then
                    PredictionValue = 0.1149
                elseif ping < 50 then
                    PredictionValue = 0.1165
                elseif ping < 40 then
                    PredictionValue = 0.1186
                end
            end
        end)
    
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then
    
                -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
                --[[
                if Settings.rewrittenmain.AIRSHOT == true then
                    if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                        
                        --// Airshot
                        args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)
    
                    else
                        args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
    
                    end
                else
                        args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
                end
                ]]
                if Prediction == true then
                    
                args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)
    
                else
    
                args[3] = Plr.Character[SelectedPart].Position
    
                end
    
                return old(unpack(args))
            end
            return old(...)
        end)
    
        game:GetService("RunService").RenderStepped:Connect(function()
            if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
            if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then
                
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
                    
                    --// Airshot
    
                    --// Anchor Check
    
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end
    
                    SelectedPart = "LeftFoot"
    
                else
                    --// Anchor Check
    
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end
    
                    SelectedPart = "HumanoidRootPart"
    
                end
                else
    
                    --// Anchor Check
    
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end
    
                    SelectedPart = "HumanoidRootPart"
                end
    
            else
                    SelectedPart = "HumanoidRootPart"
            end
        end)
  tog = value
  print(tog)
end})

section:toggle({name = "Aimlock",def = false,callback = function(value)
    getgenv().Prediction = 0.1248710929171	
getgenv().AimPart = "HumanoidRootPart"	
getgenv().Key = "Q"	
getgenv().DisableKey = "P"	
	
getgenv().FOV = true	
getgenv().ShowFOV = false	
getgenv().FOVSize = 55	
	
--// Variables (Service)	
	
local Players = game:GetService("Players")	
local RS = game:GetService("RunService")	
local WS = game:GetService("Workspace")	
local GS = game:GetService("GuiService")	
local SG = game:GetService("StarterGui")	
	
--// Variables (regular)	
	
local LP = Players.LocalPlayer	
local Mouse = LP:GetMouse()	
local Camera = WS.CurrentCamera	
local GetGuiInset = GS.GetGuiInset	
	
local AimlockState = true	
local Locked	
local Victim	
	
local SelectedKey = getgenv().Key	
local SelectedDisableKey = getgenv().DisableKey	
	
--// Notification function	
	
function Notify(tx)	
    SG:SetCore("SendNotification", {	
        Title = "Xo.tap Aimlock",	
        Text = tx,	
Duration = 5	
    })	
end	
	
--// Check if aimlock is loaded	
	
if getgenv().Loaded == true then	
    Notify("Aimlock is already loaded!")	
    return	
end	
	
getgenv().Loaded = true	
	
--// FOV Circle	
	
local fov = Drawing.new("Circle")	
fov.Filled = false	
fov.Transparency = 1	
fov.Thickness = 1	
fov.Color = Color3.fromRGB(255, 255, 0)	
fov.NumSides = 1000	
	
--// Functions	
	
function update()	
    if getgenv().FOV == true then	
        if fov then	
fov.Radius = getgenv().FOVSize * 2	
            fov.Visible = getgenv().ShowFOV	
fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)	
	
            return fov	
        end	
    end	
end	
	
function WTVP(arg)	
    return Camera:WorldToViewportPoint(arg)	
end	
	
function WTSP(arg)	
    return Camera.WorldToScreenPoint(Camera, arg)	
end	
	
function getClosest()	
    local closestPlayer	
    local shortestDistance = math.huge	
	
    for i, v in pairs(game.Players:GetPlayers()) do	
        local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true	
        local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil	
        	
if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(getgenv().AimPart) and notKO and notGrabbed then	
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)	
local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude	
            	
            if (getgenv().FOV) then	
                if (fov.Radius > magnitude and magnitude < shortestDistance) then	
                    closestPlayer = v	
                    shortestDistance = magnitude	
                end	
            else	
                if (magnitude < shortestDistance) then	
                    closestPlayer = v	
                    shortestDistance = magnitude	
                end	
            end	
        end	
    end	
    return closestPlayer	
end	
	
--// Checks if key is down	
	
Mouse.KeyDown:Connect(function(k)	
    SelectedKey = SelectedKey:lower()	
    SelectedDisableKey = SelectedDisableKey:lower()	
    if k == SelectedKey then	
        if AimlockState == true then	
            Locked = not Locked	
            if Locked then	
                Victim = getClosest()	
	
                Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))	
            else	
                if Victim ~= nil then	
                    Victim = nil	
	
                    Notify("Unlocked!")	
                end	
            end	
        else	
            Notify("Aimlock is not enabled!")	
        end	
    end	
    if k == SelectedDisableKey then	
        AimlockState = not AimlockState	
    end	
end)	
	
--// Loop update FOV and loop camera lock onto target	
	
RS.RenderStepped:Connect(function()	
    update()	
    if AimlockState == true then	
        if Victim ~= nil then	
            Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity*getgenv().Prediction)	
        end	
    end	
end)	
	while wait() do
        if getgenv().AutoPrediction == true then	
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()	
        local split = string.split(pingvalue,'(')	
local ping = tonumber(split[1])	
if ping < 225 then	
getgenv().Prediction = 1.4	
elseif ping < 215 then	
getgenv().Prediction = 1.2	
	elseif ping < 205 then
getgenv().Prediction = 1.0	
	elseif ping < 190 then
getgenv().Prediction = 0.10	
elseif ping < 180 then	
getgenv().Prediction = 0.12	
	elseif ping < 170 then
getgenv().Prediction = 0.15	
	elseif ping < 160 then
getgenv().Prediction = 0.18	
	elseif ping < 150 then
getgenv().Prediction = 0.110	
elseif ping < 140 then	
getgenv().Prediction = 0.113	
elseif ping < 130 then	
getgenv().Prediction = 0.116	
elseif ping < 120 then	
getgenv().Prediction = 0.120	
elseif ping < 110 then	
getgenv().Prediction = 0.124	
elseif ping < 105 then	
getgenv().Prediction = 0.127	
elseif ping < 90 then	
getgenv().Prediction = 0.130	
elseif ping < 80 then	
getgenv().Prediction = 0.133	
elseif ping < 70 then	
getgenv().Prediction = 0.136	
elseif ping < 60 then	
getgenv().Prediction = 0.140	
elseif ping < 50 then	
getgenv().Prediction = 0.143	
elseif ping < 40 then	
getgenv().Prediction = 0.145	
elseif ping < 30 then	
getgenv().Prediction = 0.155	
elseif ping < 20 then	
getgenv().Prediction = 0.157	
        end	
        end	
	end
    tog = value
    print(tog)
  end})
  section:toggle({name = "Dot Silent",def = false,callback = function(value)
    -- 69+ 0.129145

-- 69- 0.11934
local CC = game:GetService'Workspace'.CurrentCamera
local Plr
local enabled = false
local accomidationfactor = 0.129145
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 0.4
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(30, 30)
    return(e)
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild("LowerTorso"), Color3.fromRGB(0, 76, 153), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("LowerTorso") end)
    
	local TextLabel = Instance.new("TextLabel", handler)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 14
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name
	TextLabel.ZIndex = 10
	
	spawn(function()
        while wait() do
            if player.Character then
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
            end
        end
	end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    guimain[player.Name]:Destroy()
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
    placemarker.Transparency = 10
    makemarker(placemarker, placemarker, Color3.fromRGB(0, 0, 255), 0.55, 0)
end)    

mouse.KeyDown:Connect(function(k)
    if k ~= "q" then return end
    if enabled then
        enabled = false
       -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        enabled = true 
        Plr = getClosestPlayerToCursor()
        --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end    
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer
end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
			placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
			return old(unpack(args))
		end
		return old(...)
	end)
    tog = value
    print(tog)
  end})
  section1:button({name = "Headless Client Sided",callback = function()
	game.Players.LocalPlayer.Character.Head.Transparency = 1
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v.Transparency = 1
end
end
    print('hot ui lib')
 end})
 section1:button({name = "Korblox ClientSided",callback = function()
	local ply = game.Players.LocalPlayer
local chr = ply.Character
chr.RightLowerLeg.MeshId = "902942093"
chr.RightLowerLeg.Transparency = "1"
chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
chr.RightFoot.MeshId = "902942089"
chr.RightFoot.Transparency = "1"
    print('hot ui lib')
 end})
 section1:button({name = "Sweat Animations" ,callback = function()
	while true do
		local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
		game.Players.LocalPlayer.Character.Humanoid.Jump = false
		wait(1)
		end
	print('hot ui lib')
 end})

  section:toggle({name = "Tracer Silent",def = false,callback = function(value)
	local Settings = {
		AimLock = {
			Enabled = true,
			Aimlockkey = "q",
			Prediction = 0.135,
			Aimpart = 'HumanoidRootPart',
			Notifications = false
		},
		Settings = {
			Thickness = 3.5,
			Transparency = 1,
			Color = Color3.fromRGB(52, 50, 204),
			FOV = false
		}
	
	}
	
	local CurrentCamera = game:GetService("Workspace").CurrentCamera
	local Inset = game:GetService("GuiService"):GetGuiInset().Y
	local RunService = game:GetService("RunService")
	
	local Mouse = game.Players.LocalPlayer:GetMouse()
	local LocalPlayer = game.Players.LocalPlayer
	
	local Line = Drawing.new("Line")
	local Circle = Drawing.new("Circle")
	
	local Plr
	
	
	
	
	
	Mouse.KeyDown:Connect(function(KeyPressed)
		if KeyPressed == (Settings.AimLock.Aimlockkey) then
			if Settings.AimLock.Enabled == true then
				Settings.AimLock.Enabled = false
				if Settings.AimLock.Notifications == true then
					Plr = FindClosestPlayer()
					game.StarterGui:SetCore("SendNotification", {
						Title = "xo.tap",
						Text = "Unlocked"
					})
				end
			else
				Plr = FindClosestPlayer()
				Settings.AimLock.Enabled = true
				if Settings.AimLock.Notifications == true then
					game.StarterGui:SetCore("SendNotification", {
						Title = "xo.tap",
						Text = "Locked On :  " .. tostring(Plr.Character.Humanoid.DisplayName)
					})
				end
			end
		end
	end)
	
	function FindClosestPlayer()
		local ClosestDistance, ClosestPlayer = math.huge, nil;
		for _, Player in next, game:GetService("Players"):GetPlayers() do
			local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
			local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil
	
			if Player ~= LocalPlayer then
				local Character = Player.Character
				if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
					local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
																								 .Position)
					if IsVisibleOnViewPort then
						local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
						if Distance < ClosestDistance then
							ClosestPlayer = Player
							ClosestDistance = Distance
						end
					end
				end
			end
		end
		return ClosestPlayer, ClosestDistance
	end
	
	RunService.Heartbeat:connect(function()
		if Settings.AimLock.Enabled == true then
			local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[Settings.AimLock.Aimpart].Position +
																  (Plr.Character[Settings.AimLock.Aimpart].Velocity *
																  Settings.AimLock.Prediction))
			Line.Color = Settings.Settings.Color
			Line.Transparency = Settings.Settings .Transparency
			Line.Thickness = Settings.Settings .Thickness
			Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
			Line.To = Vector2.new(Vector.X, Vector.Y)
			Line.Visible = true
			Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)
			Circle.Visible = Settings.Settings.FOV
			Circle.Thickness = 1.5
			Circle.Thickness = 2
			Circle.Radius = 95
			Circle.Color = Settings.Settings.Color
	
		else
			Line.Visible = false
			Circle.Visible = false
		end
	end)
	
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if Settings.AimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character[Settings.AimLock.Aimpart].Position +
						  (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction)
	
			return old(unpack(args))
		end
		return old(...)
	end)
	tog = value
	print(tog)
  end})
  section:toggle({name = "Dhm Silent Aim",def = false,callback = function(value)
    local CC = game:GetService"Workspace".CurrentCamera
local Plr
local enabled = falseWD
local accomidationfactor = 0.129
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 0
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(50, 50)
    return(e)
end


local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild("HumanoidRootPart"), Color3.fromRGB(107, 184, 255), 0.3, 3)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("HumanoidRootPart") end)


    spawn(function()
        while wait() do
            if player.Character then
                TextLabel.Text = player.Name..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
            end
        end
    end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(16, 16, 16)
    placemarker.Transparency = 1
    makemarker(placemarker, placemarker, Color3.fromRGB(255,255,255), 0.40, 0)
end)    

mouse.KeyDown:Connect(function(k)
    if k ~= "q" then return end
    if enabled then
        enabled = false
        guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        enabled = true 
        Plr = getClosestPlayerToCursor()
        guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end    
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

game:GetService"RunService".Stepped:connect(function()
    if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
        placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
    else
        placemarker.CFrame = CFrame.new(0, 9999, 0)
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if enabled and getnamecallmethod() == "FireServer" and args[2] == "MousePos" then
        args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
        return old(unpack(args))
    end
    return old(...)
end)
    tog = value
    print(tog)
  end})
 
 -- new tab 
 section2:button({name = "God melee",callback = function()
     local localPlayer = game:GetService('Players').LocalPlayer;
				local localCharacter = localPlayer.Character;
				localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
				local newCharacter = localPlayer.CharacterAdded:Wait();
				local spoofFolder = Instance.new('Folder');
				spoofFolder.Name = 'FULLY_LOADED_CHAR';
				spoofFolder.Parent = newCharacter;
				newCharacter:WaitForChild('BodyEffects').Dead:Destroy();
				local spoofValue = Instance.new('BoolValue', newCharacter.BodyEffects);
				spoofValue.Name = 'Dead';
				wait()
				--godblock/godbullet
				local ps = game:GetService("Players")
				local lp = ps.LocalPlayer
				local char = lp.Character

				char.BodyEffects.Armor:Destroy()
				char.BodyEffects.Defense:Destroy()

				local Clone1 = Instance.new("IntValue")
				Clone1.Name = "Armor"
				Clone1.Parent = char.BodyEffects

				local Clone2 = Instance.new("NumberValue")
				Clone2.Name = "Defense"
				Clone2.Parent = char.BodyEffects
				wait()
				--walspeed
				local d = {}
				local e = {}
				local g = {}
				local h = {}
				local j = {}
				local k = {}
				local function l()
					local m = 3
					local n = checkcaller
					local o = getrawmetatable(game)
					setreadonly(o, false)
					local p = o.__index
					local q = o.__newindex
					local r = o.__namecall
					o.__index =
						newcclosure(
							function(s, t)
							if n() then
								return p(s, t)
							end
							if d[s] and d[s][t] then
								local u = d[s][t]
								if u["IsCallback"] == true then
									return u["Value"](s)
								else
									return u["Value"]
								end
							end
							if g[t] then
								local v = g[t]
								if v["IsCallback"] == true then
									return v["Value"](s)
								else
									return v["Value"]
								end
							end
							if j[s] and j[s][t] then
								return k[s][t]
							end
							return p(s, t)
						end
						)
					o.__newindex =
						newcclosure(
							function(w, x, y)
							if n() then
								return q(w, x, y)
							end
							if e[w] and e[w][x] then
								local z = e[w][x]
								if z["Callback"] == nil then
									return
								else
									z["Callback"](w, y)
									return
								end
							end
							if h[x] then
								local A = h[x]
								if A["Callback"] == nil then
									return
								else
									A["Callback"](w, y)
									return
								end
							end
							if j[w] and j[w][x] then
								local B = j[w][x]
								if type(y) ~= B["Type"] then
									error("bad argument #3 to '" .. x .. "' (" .. B["Type"] .. " expected, got " .. type(x) .. ")")
								end
								k[w][x] = y
								return
							end
							return q(w, x, y)
						end
						)
					local D = game.Players.LocalPlayer.Character.Humanoid
					local function A(_)
						local a0 = p(D, _)
						local a1 = type(a0)
						if not j[D] then
							j[D] = {}
						end
						if not k[D] then
							k[D] = {}
						end
						j[D][_] = {Type = a1}
						k[D][_] = p(D, _)
						local a2 = function()
							j[D][_] = nil
							k[D][_] = nil
						end
						return {remove = a2, Remove = a2}
					end
					A("WalkSpeed")
					A("JumpPower")
				end
				l()
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
				wait()
				while wait() do
					game.ReplicatedStorage.MainEvent:FireServer("Block", true)
					wait()
					for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
						if (v.Animation.AnimationId:match("rbxassetid://2788354405")) then
							v:Stop();
						end;
					end;
				end
				wait()
				while wait() do
					pcall(function()
						for i, v in pairs(game.Players:GetPlayers()) do
							if (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude < 1 then
								game.ReplicatedStorage.MainEvent:FireServer("Block", true)
							end
						end
					end)
				end
    print('hot ui lib')
 end})
section2:button({name = "god guns",callback = function()
    local localPlayer = game:GetService('Players').LocalPlayer;
                local localCharacter = localPlayer.Character;
                localCharacter:FindFirstChildOfClass('Humanoid').Health = 0;
                local newCharacter = localPlayer.CharacterAdded:Wait();
                local spoofFolder = Instance.new('Folder');
                spoofFolder.Name = 'FULLY_LOADED_CHAR';
                spoofFolder.Parent = newCharacter;
                newCharacter:WaitForChild('RagdollConstraints'):Destroy();
                local spoofValue = Instance.new('BoolValue', newCharacter);
                spoofValue.Name = 'RagdollConstraints';
                local name = game.Players.LocalPlayer.Name
                local lol =    game.Workspace:WaitForChild(name)
                local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
                lol.Parent = game.Workspace.Players
                game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
                game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
    print('hot ui lib')
 end})
 section3:button({name = "No Jump Cooldown",callback = function()
	if not game.IsLoaded(game) then 
        game.Loaded.Wait(game.Loaded);
    end
    
    local IsA = game.IsA;
    local newindex = nil 
    
    newindex = hookmetamethod(game, "__newindex", function(self, Index, Value)
        if not checkcaller() and IsA(self, "Humanoid") and Index == "JumpPower" then 
            return
        end
        
        return newindex(self, Index, Value);
    end)
    print('hot ui lib')
 end})
 section3:button({name = "low gfx",callback = function()
	for _,v in pairs(workspace:GetDescendants()) do
		if v.ClassName == "Part"
		or v.ClassName == "SpawnLocation"
		or v.ClassName == "WedgePart"
		or v.ClassName == "Terrain"
		or v.ClassName == "MeshPart" then
		v.Material = "Plastic"
		end
		end
    print('hot ui lib')
 end})
 section3:button({name = "Anti Slow",callback = function()
	local mt = getrawmetatable(game)
local backup
backup = hookfunction(mt.__newindex, newcclosure(function(self, key, value)
if key == "WalkSpeed" and value < 16 then
value = 16
end
return backup(self, key, value)
end))
    print('hot ui lib')
 end})
 section3:button({name = "trash talk ",callback = function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Keybind J";
		Text = "Made by zor xo.tap dev";
		Duration = 5
		})
	
	local plr = game.Players.LocalPlayer
	repeat wait() until plr.Character
	local char = plr.Character
	
	local garbage = {
		"seed";
		"focus son";
		"ez";
		"wyd son";
		"log already";
		"bad";
	
	
	}
	
	
	function TrashTalk(inputObject, gameProcessedEvent)
		if inputObject.KeyCode == Enum.KeyCode.J and gameProcessedEvent == false then        
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
			garbage[math.random(1,#garbage)],
			"All"
		)
		end
	end
	 
	game:GetService("UserInputService").InputBegan:connect(TrashTalk)
    print('hot ui lib')
 end})
 section3:button({name = "Marco",callback = function()
	repeat wait() until game:IsLoaded() 

getgenv().Fix = true

getgenv().TeclasWS = {
    ["tecla1"] = "M", -- speed +5
    ["tecla2"] = "N", -- speed -5
    ["tecla3"] = "V" -- toggle  
}



-- // servicios
local MININOS_DOXXEADOS = game:GetService("Players")
local AUDIOS_LOUD_DE_TRAP = game:GetService("StarterGui") or "son una mierda"

-- // objetos
local neonazi = MININOS_DOXXEADOS.LocalPlayer
local esvastica = neonazi:GetMouse()

-- // variables
local lista_de_victimas_de_drizzy = getrenv()._G
local da_hood_rblxm_REAL = getrawmetatable(game)
local CP = da_hood_rblxm_REAL.__newindex
local CP_DE_DRIZZY = da_hood_rblxm_REAL.__index
local velocidad_de_cum = 122
local es_pedofilo = true

-- // funciones para acortar codigo :]
function anunciar_atentado_terrorista(fecha_del_atentado)
    AUDIOS_LOUD_DE_TRAP:SetCore("SendNotification",{
        Title="zor",
        Text=fecha_del_atentado,
        Icon="rbxthumb://type=Asset&id=1332213374&w=150&h=150"
       })
end


getgenv().TECHWAREWALKSPEED_LOADED = true


wait(1.5)


anunciar_atentado_terrorista("Welcome"..TeclasWS.tecla3.."")

-- // conexiÃ³n
esvastica.KeyDown:Connect(function(el_impostor)
    if el_impostor:lower() == TeclasWS.tecla1:lower() then
        velocidad_de_cum = velocidad_de_cum + 1
        anunciar_atentado_terrorista(" (speed =   "..tostring(velocidad_de_cum)..")")
    elseif el_impostor:lower() == TeclasWS.tecla2:lower() then
        velocidad_de_cum = velocidad_de_cum - 1
        anunciar_atentado_terrorista(" (speed =  "..tostring(velocidad_de_cum)..")")
    elseif el_impostor:lower() == TeclasWS.tecla3:lower() then
        if es_pedofilo then
            es_pedofilo = false
            anunciar_atentado_terrorista("speed off")
        else
            es_pedofilo = true
            anunciar_atentado_terrorista("speed on")
        end
    end
end)

-- // mi parte favorita: metametodos
setreadonly(da_hood_rblxm_REAL,false)
da_hood_rblxm_REAL.__index = newcclosure(function(BEST_ON_TOP,IS_GARBAGE)
    local esPedofilo = checkcaller()
    if IS_GARBAGE == "WalkSpeed" and not esPedofilo then
        return lista_de_victimas_de_drizzy.CurrentWS
    end
    return CP_DE_DRIZZY(BEST_ON_TOP,IS_GARBAGE)
end)
da_hood_rblxm_REAL.__newindex = newcclosure(function(kaias,ip,logger)
    local unNeonazi = checkcaller()
    if es_pedofilo then
        if ip == "WalkSpeed" and logger ~= 0 and not unNeonazi then
            return CP(kaias,ip,velocidad_de_cum)
        end
    end
    return CP(kaias,ip,logger)
end)
setreadonly(da_hood_rblxm_REAL,true)

repeat wait() until game:IsLoaded()
local Players = game:service('Players')
local Player = Players.LocalPlayer

repeat wait() until Player.Character

local userInput = game:service('UserInputService')
local runService = game:service('RunService')

local Multiplier = -0.22
local Enabled = false
local whentheflashnoiq

userInput.InputBegan:connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.LeftBracket then
        Multiplier = Multiplier + 0.01
        print(Multiplier)
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.LeftBracket) do
            wait()
            Multiplier = Multiplier + 0.01
            print(Multiplier)
        end
    end

    if Key.KeyCode == Enum.KeyCode.RightBracket then
        Multiplier = Multiplier - 0.01
        print(Multiplier)
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.RightBracket) do
            wait()
            Multiplier = Multiplier - 0.01
            print(Multiplier)
        end
    end

    if Key.KeyCode == Enum.KeyCode.P then
        Enabled = not Enabled
        if Enabled == true then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
                game:GetService("RunService").Stepped:waitn()
            until Enabled == true
        end
    end
end)

if Fix == true then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/youtubetutorials123/helo/main/123"))()
end
    print('hot ui lib')
 end})

 -- 22

 section4:button({name = "Double Barrell" ,callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	print('hot ui lib')
 end})

 section4:button({name = "Revolver" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
print('hot ui lib')
end})


section4:button({name = "Shotgun" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.623657, 5.47212696, -725.131531, 0, 0, 1, 0, 1, -0, -1, 0, 0)
print('hot ui lib')
end})

section4:button({name = "Tactical Shotgun" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 0.999999821, 0.000604254019, -2.60802135e-08, -0.000604254019, 0.999999821, -8.63220048e-05, -2.60802135e-08, 8.63220048e-05, 1)
print('hot ui lib')
end})

section4:button({name = "Smg" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.123413, 5.47666788, -718.031433, -1, 0, 0, 0, 1, 0, 0, 0, -1)
print('hot ui lib')
end})

section4:button({name = "RPG" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-794.814697, -42.5468521, -932.97998, 5.96046448e-08, 2.91038305e-11, 1, -0.000610388815, 0.999999821, 2.91038305e-11, -0.999999762, -0.000610388815, 5.96046448e-08)
print('hot ui lib')
end})

section4:button({name = "Armor" ,callback = function() getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-607.978455, 7.44964886, -788.494263, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
print('hot ui lib')
end})

section4:button({name = "PopCorn" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-995, 21.6998043, -153.100037, 1, 0, 0, 0, 1, 0, 0, 0, 1)
print('hot ui lib')
end})

section4:button({name = "Casino 1v1" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-962.72345, 21.2549973, -186.814987, -0.0274876002, 2.91178949e-05, 0.999621451, -5.5798846e-06, 1, -2.92823333e-05, -0.999621451, -6.38268148e-06, -0.0274876002)
print('hot ui lib')
end})

section4:button({name = "Bank" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-402.123718, 21.75, -283.988617, 0.0159681588, -0.000121377925, -0.999872446, -2.60148026e-05, 1, -0.000121808866, 0.999872506, 2.79565484e-05, 0.0159681737)
print('hot ui lib')
end})

section4:button({name = "Main Food" ,callback = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-338.352173, 23.6826477, -297.2146, -0.0060598203, -1.03402984e-08, -0.999981582, -1.61653102e-09, 1, -1.03306892e-08, 0.999981582, 1.55389912e-09, -0.0060598203)
print('hot ui lib')
end})
