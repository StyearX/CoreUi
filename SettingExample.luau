local CoreUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/StyearX/Script/refs/heads/main/Luau/sss.lua"))()

local MainTab = CoreUi:Tab("Main", {
    Title = "Main",
    Icon  = "lucide/diamond",
})

local CombatTab = CoreUi:Tab("Combat", {
    Title = "Combat",
    Icon  = "lucide/sword",
})

local PlayerTab = CoreUi:Tab("Player", {
    Title = "Player",
    Icon  = "lucide/user",
})

local SecGeneral = MainTab:AddSection({
    Title = "General Settings",
    Icon = "lucide/settings",
})

SecGeneral:AddToggle({
    Title = "Auto Farm",
    Description = "Toggle automatic farming on/off",
    Default = false,
    Callback = function(value)
        print("Auto Farm:", value)
    end,
})

SecGeneral:AddSlider({
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

SecGeneral:AddButton({
    Title = "Developer Console",
    Description = "Open the developer console",
    Text = "Open Console",
    Callback = function()
        print("Console opened")
    end,
})

SecGeneral:AddKeybind({
    Title = "Toggle UI",
    Description = "Key to show or hide the menu",
    Default = Enum.KeyCode.RightShift,
    Callback = function(key)
        print("Keybind set to:", key.Name)
    end,
})

SecGeneral:AddInput({
    Title = "Player Name",
    Description = "Enter a player name to target",
    Placeholder = "Type name here...",
    Callback = function(text, enterPressed)
        print("Input:", text)
    end,
})

local SecWeapons = MainTab:AddSection({
    Title = "Weapon Settings",
    Icon = "lucide/crosshair",
})

SecWeapons:AddDropdown({
    Title = "Weapon Select",
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

SecWeapons:AddParagraph({
    Title = "About Weapons",
    Content = "Choose your loadout carefully. Each weapon has different range and damage stats.",
})

local SecCombat = CombatTab:AddSection({
    Title = "Combat Settings",
    Icon = "lucide/crosshair",
})

SecCombat:AddToggle({
    Title = "Aimbot",
    Description = "Enable aimbot assistance",
    Default = true,
    Callback = function(v) print("Aimbot:", v) end,
})

SecCombat:AddSlider({
    Title = "Aim FOV",
    Description = "Field of view for aimbot",
    Min = 10,
    Max = 120,
    Steps = 20,
    Default = 60,
    Callback = function(v) print("FOV:", v) end,
})

SecCombat:AddKeybind({
    Title = "Aimbot Key",
    Default = Enum.KeyCode.Q,
    Callback = function(key)
        print("Aimbot key:", key.Name)
    end,
})

local SecPlayer = PlayerTab:AddSection({
    Title = "Player Modifiers",
    Icon = "lucide/user",
})

SecPlayer:AddToggle({
    Title = "God Mode",
    Default = false,
    Callback = function(v) print("God Mode:", v) end,
})

SecPlayer:AddSlider({
    Title = "Jump Power",
    Min = 50,
    Max = 200,
    Steps = 150,
    Default = 50,
    Callback = function(v)
        print("Jump Power:", v)
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.JumpPower = v
        end
    end,
})

SecPlayer:AddInput({
    Title = "Custom Tag",
    Placeholder = "Your tag...",
    Callback = function(text)
        print("Tag set to:", text)
    end,
})

print("UI loaded.")
CoreUi.Api:SetVisibility(true)
