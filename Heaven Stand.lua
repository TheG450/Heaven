repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Heaven Spot",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}
local Tab = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://4034483344"
}
Tab:Toggle{
	Name = "Auto Box",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        _G.AutoBox = state
    end
}
Tab:Toggle{
	Name = "Auto Deal Damage",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        _G.AutoDD = state
    end
}
Tab:Toggle{
	Name = "Auto Take Damage",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        _G.AutoTD = state
    end
}
Tab:Toggle{
	Name = "Auto Farm DIO(INSTANT)",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        _G.AutoDIO = state
    end
}
Tab:Toggle{
	Name = "Auto Farm Silver Chariot Requiem(INSTANT)",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        _G.AutoSCR = state
    end
}
Tab:Button{
	Name = "Box",
	Description = nil,
	Callback = function() end
}

----------------script
local Plr = game.Players.LocalPlayer.Character
spawn(function()
	while wait() do
        pcall(function()
            local anti = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                anti:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                anti:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end
end)
spawn(function()
    while wait() do
        if _G.AutoBox == true then
            wait()
            for i,v in pairs(game:GetService("Workspace")["Item_Spawnner"].Box:GetDescendants()) do
                if v.Name == "Box" and v:FindFirstChild("Base") and v:IsA("Model") then
                    pcall(function() 
                        Plr.HumanoidRootPart.CFrame = v.Base.CFrame * CFrame.new(0,-1.6,0) * CFrame.Angles(3,0,0)
                        wait(1)
                        fireclickdetector(v.Base.ClickDetector)
                    end)
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoDD == true then
                wait()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.Name == "just a dummy" and not v:FindFirstChild("UseMyComponentModule") and not v:FindFirstChild("Infinity") and v.Humanoid.Health > 0 then
                        pcall(function()
                            Plr.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                        end)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoDD == true then
                wait()
                game:GetService("ReplicatedStorage").Remote_Events.Input_Remote:FireServer("MouseButton1")
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if _G.AutoTD == true then
            wait()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "just a dummy but attack you" and not v:FindFirstChild("Infinity") and v.Humanoid.Health > 0 then
                    pcall(function()
                        Plr.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)
                    end)
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoDIO == true then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                if v.Name == "DIO" and v:FindFirstChild("Data") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                    v.Humanoid.Health = 0
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoSCR == true then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                if v.Name == "Silver Chariot Requiem" and v:FindFirstChild("Settings") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                    v.Humanoid.Health = 0
                end
            end
        end
    end
end)
