local CoreUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/StyearX/CoreUi/refs/heads/main//setting.luau"))()

local MainTab = CoreUi:Tab("Main", {
    Title = "Main",
    Icon  = "lucide/diamond",
})

local CombatTab = CoreUi:Tab("Combat", {
    Title = "Combat",
    Icon  = "lucide/sword",
})

local VisualsTab = CoreUi:Tab("Visuals", {
    Title = "Visuals",
    Icon  = "lucide/eye",
})

local PlayerTab = CoreUi:Tab("Player", {
    Title = "Player",
    Icon  = "lucide/user",
})

MainTab:AddSection({
    Title = "General Settings",
    Icon = "lucide/settings",
})

MainTab:AddParagraph({
    Title = "About",
    Content = "Configure general game options below. Changes take effect immediately.",
})

MainTab:AddToggle({
    Title = "Auto Farm",
    Description = "Toggle automatic farming on/off",
    Default = false,
    Callback = function(value)
        print("Auto Farm:", value)
    end,
})

MainTab:AddSlider({
    Title = "Walk Speed",
    Description = "Adjust your walk speed",
    Min = 16,
    Max = 100,
    Steps = 10,
    Default = 16,
    Callback = function(value)
        print("Walk Speed:", value)
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end,
})

MainTab:AddDropdown({
    Title = "Weapon Select",
    Description = "Choose your weapon (single)",
    Options = {
        { Label = "Sword", Value = "sword" },
        { Label = "Gun", Value = "gun", SubLabel = "Pistol" },
        { Label = "Knife", Value = "knife" },
    },
    Default = "sword",
    Callback = function(value)
        print("Selected weapon:", value)
    end,
})

MainTab:AddDropdown({
    Title = "Multiple Features",
    Description = "Select multiple features (multi)",
    Options = {
        { Label = "Speed Hack", Value = "speed" },
        { Label = "Fly Mode", Value = "fly" },
        { Label = "Noclip", Value = "noclip" },
        { Label = "Infinite Jump", Value = "infjump" },
    },
    Multi = true,
    Default = {"speed", "fly"},
    Callback = function(values)
        print("Selected features:", table.concat(values, ", "))
    end,
})

MainTab:AddButton({
    Title = "Developer Console",
    Description = "Open the developer console",
    Text = "Open Console",
    Callback = function()
        print("Console opened")
    end,
})

MainTab:AddKeybind({
    Title = "Toggle UI",
    Description = "Key to show or hide the menu",
    Default = Enum.KeyCode.RightShift,
    Callback = function(key)
        print("Keybind set to:", key.Name)
    end,
})

MainTab:AddInput({
    Title = "Player Name",
    Description = "Enter a player name to target",
    Placeholder = "Type name here...",
    Default = "",
    Callback = function(text, enterPressed)
        print("Input:", text, "Enter:", enterPressed)
    end,
})

CombatTab:AddSection({
    Title = "Combat Settings",
    Icon = "lucide/crosshair",
})

CombatTab:AddParagraph({
    Content = "Adjust combat assistance settings. Use responsibly.",
})

CombatTab:AddToggle({
    Title = "Aimbot",
    Description = "Enable aimbot assistance",
    Default = true,
    Callback = function(v) print("Aimbot:", v) end,
})

CombatTab:AddSlider({
    Title = "Aim FOV",
    Description = "Field of view for aimbot",
    Min = 10,
    Max = 120,
    Steps = 10,
    Default = 60,
    Callback = function(v) print("FOV:", v) end,
})

CombatTab:AddKeybind({
    Title = "Aimbot Key",
    Description = "Hold to activate aimbot",
    Default = Enum.KeyCode.Q,
    Callback = function(key)
        print("Aimbot key:", key.Name)
    end,
})

VisualsTab:AddSection({
    Title = "Visual Enhancements",
    Icon = "lucide/eye",
})

VisualsTab:AddParagraph({
    Title = "ESP Info",
    Content = "Show player positions and info through walls.",
})

VisualsTab:AddToggle({
    Title = "ESP",
    Description = "Show player ESP",
    Default = false,
    Callback = function(v) print("ESP:", v) end,
})

VisualsTab:AddDropdown({
    Title = "ESP Mode",
    Description = "Select ESP display style",
    Options = {
        { Label = "Box", Value = "box" },
        { Label = "Chams", Value = "chams" },
        { Label = "Glow", Value = "glow" },
    },
    Default = "box",
    Callback = function(v) print("ESP Mode:", v) end,
})

PlayerTab:AddSection({
    Title = "Player Modifiers",
    Icon = "lucide/user",
})

PlayerTab:AddToggle({
    Title = "God Mode",
    Description = "Become invincible",
    Default = false,
    Callback = function(v)
        print("God Mode:", v)
    end,
})

PlayerTab:AddSlider({
    Title = "Jump Power",
    Description = "Modify jump height",
    Min = 50,
    Max = 200,
    Steps = 10,
    Default = 50,
    Callback = function(v)
        print("Jump Power:", v)
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.JumpPower = v
        end
    end,
})

PlayerTab:AddSlider({
    Title = "Jump Power",
    Description = "Modify jump height",
    Min = 50,
    Max = 200,
    Steps = 5,
    Default = 50,
    Callback = function(v)
        print("Jump Power:", v)
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.JumpPower = v
        end
    end,
})

PlayerTab:AddInput({
    Title = "Custom Tag",
    Description = "Set a custom display tag",
    Placeholder = "Your tag...",
    Callback = function(text)
        print("Tag set to:", text)
    end,
})

print("UI loaded.")
CoreUi.Api:SetVisibility(true)
