
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

print("Script started")

-- Create the main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "CCWIPT32"  -- Renamed the GUI
print("ScreenGui created and parented")

-- Function to add rounded corners
local function addRoundedCorners(instance, radius)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, radius)
    UICorner.Parent = instance
    print("Rounded corners added to", instance.Name)
end

-- Make the MainFrame draggable
local function makeDraggable(guiElement, handle)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = guiElement.Position
            print("Dragging started")
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            guiElement.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            print("GUI element dragged")
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            print("Dragging ended")
        end
    end)
end

-- Main frame for the GUI
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Parent = ScreenGui
addRoundedCorners(MainFrame, 10)
print("MainFrame created and parented")

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 2
TitleBar.BorderColor3 = Color3.fromRGB(10, 10, 10)
TitleBar.Parent = MainFrame
addRoundedCorners(TitleBar, 10)
print("TitleBar created and parented")


local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -140, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Shoebox"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.SourceSans
TitleText.TextSize = 20
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar
print("TitleText created and parented")

-- Exit button
local ExitButton = Instance.new("TextButton")
ExitButton.Size = UDim2.new(0, 60, 0, 30)
ExitButton.Position = UDim2.new(1, -70, 0.5, -15)
ExitButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ExitButton.BorderSizePixel = 2
ExitButton.BorderColor3 = Color3.fromRGB(10, 10, 10)
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitButton.Font = Enum.Font.SourceSans
ExitButton.TextSize = 16
ExitButton.Text = "Exit"
ExitButton.Parent = TitleBar
addRoundedCorners(ExitButton, 10)
print("ExitButton created and parented")
ExitButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    print("ScreenGui destroyed")
end)

-- Sidebar frame
local SidebarFrame = Instance.new("Frame")
SidebarFrame.Size = UDim2.new(0, 150, 1, -40)
SidebarFrame.Position = UDim2.new(0, 0, 0, 40)
SidebarFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SidebarFrame.BorderSizePixel = 2
SidebarFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
SidebarFrame.Parent = MainFrame
addRoundedCorners(SidebarFrame, 10)
print("SidebarFrame created and parented")

-- Scrolling frame for the sidebar
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 250)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Parent = SidebarFrame
print("ScrollingFrame created and parented")

-- Add buttons to the scrolling frame
local buttonTexts = {"Main", "Visuals", "AimStuff", "Button 4", "Settings"}
local activeButton = nil -- To track the active button

-- Main content frame
local MainContentFrame = Instance.new("Frame")
MainContentFrame.Size = UDim2.new(1, -150, 1, -40)
MainContentFrame.Position = UDim2.new(0, 150, 0, 40)
MainContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainContentFrame.BorderSizePixel = 2
MainContentFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
MainContentFrame.Parent = MainFrame
addRoundedCorners(MainContentFrame, 10)
print("MainContentFrame created and parented")
-- Visuals content frame
local VisualsContentFrame = Instance.new("Frame")
VisualsContentFrame.Size = UDim2.new(1, -150, 1, -40)
VisualsContentFrame.Position = UDim2.new(0, 150, 0, 40)
VisualsContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
VisualsContentFrame.BorderSizePixel = 2
VisualsContentFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
VisualsContentFrame.Parent = MainFrame
VisualsContentFrame.Visible = false
addRoundedCorners(VisualsContentFrame, 10)
print("VisualsContentFrame created and parented")

-- AimStuff content frame
local AimStuffContentFrame = Instance.new("Frame")
AimStuffContentFrame.Size = UDim2.new(1, -150, 1, -40)
AimStuffContentFrame.Position = UDim2.new(0, 150, 0, 40)
AimStuffContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AimStuffContentFrame.BorderSizePixel = 2
AimStuffContentFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
AimStuffContentFrame.Parent = MainFrame
AimStuffContentFrame.Visible = false
addRoundedCorners(AimStuffContentFrame, 10)
print("AimStuffContentFrame created and parented")

for i, text in ipairs(buttonTexts) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.Position = UDim2.new(0, 5, 0, (i - 1) * 45)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.BorderSizePixel = 2
    Button.BorderColor3 = Color3.fromRGB(10, 10, 10)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.Text = text
    Button.Parent = ScrollingFrame
    addRoundedCorners(Button, 10)
    print("Button for", text, "created and parented")

    -- Hover effect for buttons
    Button.MouseEnter:Connect(function()
        if Button ~= activeButton then
            Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end
    end)
    Button.MouseLeave:Connect(function()
        if Button ~= activeButton then
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end)

    -- Click event to highlight the button
    Button.MouseButton1Click:Connect(function()
        if activeButton then
            activeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
        activeButton = Button
        Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Highlight color

        -- Show or hide content based on the button clicked
        if text == "Main" then
            MainContentFrame.Visible = true
            VisualsContentFrame.Visible = false
            AimStuffContentFrame.Visible = false
            print("MainContentFrame shown")
        elseif text == "Visuals" then
            MainContentFrame.Visible = false
            VisualsContentFrame.Visible = true
            AimStuffContentFrame.Visible = false
            print("VisualsContentFrame shown")
        elseif text == "AimStuff" then
            MainContentFrame.Visible = false
            VisualsContentFrame.Visible = false
            AimStuffContentFrame.Visible = true
            print("AimStuffContentFrame shown")
        elseif text == "Button 4" then
            MainContentFrame.Visible = false
            VisualsContentFrame.Visible = false
            AimStuffContentFrame.Visible = false
            print("Button 4 content shown")
        elseif text == "Settings" then
            MainContentFrame.Visible = false
            VisualsContentFrame.Visible = false
            AimStuffContentFrame.Visible = false
            print("Settings content shown")
        end
    end)
end

-- Fly script
local flying = false
local speed = 50
local keys = {W = false, S = false, A = false, D = false}
local bodyVelocity, bodyGyro

local function startFlying()
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)
    bodyVelocity.Parent = rootPart

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
    bodyGyro.Parent = rootPart

    while flying do
        RunService.RenderStepped:Wait()
        local direction = Vector3.zero
        if keys.W then direction = direction + Workspace.CurrentCamera.CFrame.LookVector end
        if keys.S then direction = direction - Workspace.CurrentCamera.CFrame.LookVector end
        if keys.A then direction = direction - Workspace.CurrentCamera.CFrame.RightVector end
        if keys.D then direction = direction + Workspace.CurrentCamera.CFrame.RightVector end

        bodyVelocity.Velocity = direction * speed
        bodyGyro.CFrame = Workspace.CurrentCamera.CFrame
    end
end

local function stopFlying()
    flying = false
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
    print("Stopped flying")
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then keys.W = true end
    if input.KeyCode == Enum.KeyCode.S then keys.S = true end
    if input.KeyCode == Enum.KeyCode.A then keys.A = true end
    if input.KeyCode == Enum.KeyCode.D then keys.D = true end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then keys.W = false end
    if input.KeyCode == Enum.KeyCode.S then keys.S = false end
    if input.KeyCode == Enum.KeyCode.A then keys.A = false end
    if input.KeyCode == Enum.KeyCode.D then keys.D = false end
end)

-- Spin script
local spinning = false
local spinSpeed = 5000 -- Increased spin speed

local function startSpinning()
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    while spinning do
        RunService.RenderStepped:Wait()
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed * RunService.RenderStepped:Wait()), 0)
    end
end

local function stopSpinning()
    spinning = false
    print("Stopped spinning")
end

-- Speed script
local speedEnabled = false
local originalWalkSpeed = 16

local function startSpeed()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    originalWalkSpeed = humanoid.WalkSpeed
    humanoid.WalkSpeed = 100 -- Set to desired speed
end

local function stopSpeed()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    humanoid.WalkSpeed = originalWalkSpeed
    print("Stopped speed enhancement")
end

-- No clip script
local noClip = false
local noClipConnection

local function startNoClip()
    noClip = true
    local character = LocalPlayer.Character
    if not character then return end

    noClipConnection = RunService.Stepped:Connect(function()
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
    print("No clip enabled")
end

local function stopNoClip()
    noClip = false
    if noClipConnection then
        noClipConnection:Disconnect()
        noClipConnection = nil
    end
    local character = LocalPlayer.Character
    if not character then return end

    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
    print("No clip disabled")
end

-- Kill all (tool) script
local killing = false

local function hasWeapon()
    local character = LocalPlayer.Character
    if not character then return false end
    local tool = character:FindFirstChildWhichIsA("Tool")
    return tool ~= nil
end

local function findNearestEnemy()
    local character = LocalPlayer.Character
    if not character then return nil end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local nearestEnemy = nil
    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then
            local enemyCharacter = player.Character
            if enemyCharacter and enemyCharacter:FindFirstChild("HumanoidRootPart") and enemyCharacter:FindFirstChild("Humanoid") and enemyCharacter.Humanoid.Health > 0 then
                local distance = (rootPart.Position - enemyCharacter.HumanoidRootPart.Position).magnitude
                if distance < shortestDistance then
                    nearestEnemy = enemyCharacter
                    shortestDistance = distance
                end
            end
        end
    end

    return nearestEnemy
end

local function startKilling()
    if not hasWeapon() then return end

    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    local originalPosition = rootPart.Position

    while killing do
        local nearestEnemy = findNearestEnemy()
        if nearestEnemy then
            while nearestEnemy.Humanoid.Health > 0 and killing do
                rootPart.CFrame = nearestEnemy.HumanoidRootPart
                local tool = character:FindFirstChildWhichIsA("Tool")
                if tool then
                    -- Spam the tool activation
                    for _ = 1, 10 do
                        tool:Activate()
                    end
                end
                RunService.RenderStepped:Wait() -- Small delay to ensure the tool activation is recognized
            end
        end
        RunService.RenderStepped:Wait() -- Small delay before moving to the next enemy
    end
    rootPart.CFrame = CFrame.new(originalPosition)
end

local function stopKilling()
    killing = false
    print("Stopped killing")
end

 -- Orbit script
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local orbiting = false
local orbitSpeed = 5
local orbitDistance = 10
local originalPosition

local function findNearestPlayer()
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    local nearestPlayer
    local nearestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetRootPart = player.Character.HumanoidRootPart
            local distance = (rootPart.Position - targetRootPart.Position).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

local function startOrbiting()
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    originalPosition = rootPart.Position

    local nearestPlayer = findNearestPlayer()
    if not nearestPlayer then return end
    local targetRootPart = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetRootPart then return end

    orbiting = true
    while orbiting do
        RunService.RenderStepped:Wait()
        local angle = tick() * orbitSpeed
        local offset = Vector3.new(math.cos(angle) * orbitDistance, 0, math.sin(angle) * orbitDistance)
        local newPosition = targetRootPart.Position + offset

        local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        local tween = TweenService:Create(rootPart, tweenInfo, { CFrame = CFrame.new(newPosition, targetRootPart.Position) })
        tween:Play()
        tween.Completed:Wait()
    end
end

local function stopOrbiting()
    orbiting = false
    local character = LocalPlayer.Character
    if not character then return end
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    rootPart.CFrame = CFrame.new(originalPosition)
    print("Stopped orbiting")
end


-- Infinite Jump script
local infiniteJumpEnabled = false
local infiniteJumpConnection -- Store the connection to the JumpRequest event

local function toggleInfiniteJump(enable)
    if enable then
        -- Connect to the JumpRequest event
        infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        -- Disconnect from the JumpRequest event
        if infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
            infiniteJumpConnection = nil
        end
    end
end

-- Add switches to the MainContentFrame
local switchLabels = {"Fly", "Spin", "Speed", "No Clip", "Kill all (tool)", "Orbit", "Infinite Jump"}
local switchStates = {Fly = false, Spin = false, Speed = false, NoClip = false, Kill = false, Orbit = false, InfiniteJump = false} -- Store switch states
local switchFrames = {}

for i, label in ipairs(switchLabels) do
    local SwitchFrame = Instance.new("Frame")
    SwitchFrame.Size = UDim2.new(0.9, 0, 0, 40)
    SwitchFrame.Position = UDim2.new(0.05, 0, 0, (i - 1) * 50 + 10)
    SwitchFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SwitchFrame.BorderSizePixel = 2
    SwitchFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
    SwitchFrame.Parent = MainContentFrame
    addRoundedCorners(SwitchFrame, 10)
    table.insert(switchFrames, SwitchFrame)

    local SwitchLabel = Instance.new("TextLabel")
    SwitchLabel.Size = UDim2.new(0.7, 0, 1, 0)
    SwitchLabel.Position = UDim2.new(0, 10, 0, 0)
    SwitchLabel.BackgroundTransparency = 1
    SwitchLabel.Text = label
    SwitchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SwitchLabel.Font = Enum.Font.SourceSans
    SwitchLabel.TextSize = 16
    SwitchLabel.TextXAlignment = Enum.TextXAlignment.Left
    SwitchLabel.Parent = SwitchFrame

    local CylinderSwitch = Instance.new("Frame")
    CylinderSwitch.Size = UDim2.new(0, 60, 0, 20)
    CylinderSwitch.Position = UDim2.new(0.8, 0, 0.5, -10)
    CylinderSwitch.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    CylinderSwitch.BorderSizePixel = 2
    CylinderSwitch.BorderColor3 = Color3.fromRGB(10, 10, 10)
    CylinderSwitch.Parent = SwitchFrame
    addRoundedCorners(CylinderSwitch, 10)

    local Ball = Instance.new("Frame")
    Ball.Size = UDim2.new(0, 20, 0, 20)
    Ball.Position = UDim2.new(0, 0, 0, 0)
    Ball.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ball.Parent = CylinderSwitch
    addRoundedCorners(Ball, 10)

    local toggled = false
    SwitchFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            toggled = not toggled
            switchStates[label] = toggled -- Update switch state
            if toggled then
                Ball:TweenPosition(UDim2.new(1, -20, 0, 0), "Out", "Sine", 0.2)
                CylinderSwitch.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
                if label == "Fly" then
                    flying = true
                    startFlying()
                elseif label == "Spin" then
                    spinning = true
                    startSpinning()
                elseif label == "Speed" then
                    speedEnabled = true
                    startSpeed()
                elseif label == "No Clip" then
                    startNoClip()
                elseif label == "Kill all (tool)" then
                    killing = true
                    startKilling()
                elseif label == "Orbit" then
                    orbiting = true
                    startOrbiting()
                elseif label == "Infinite Jump" then
                    infiniteJumpEnabled = true
                    toggleInfiniteJump(infiniteJumpEnabled)
                end
            else
                Ball:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.2)
                CylinderSwitch.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                if label == "Fly" then
                    stopFlying()
                elseif label == "Spin" then
                    stopSpinning()
                elseif label == "Speed" then
                    stopSpeed()
                elseif label == "No Clip" then
                    stopNoClip()
                elseif label == "Kill all (tool)" then
                    stopKilling()
                elseif label == "Orbit" then
                    stopOrbiting()
                elseif label == "Infinite Jump" then
                    infiniteJumpEnabled = false
                    toggleInfiniteJump(infiniteJumpEnabled)
                end
            end
        end
    end)
end

-- ESP switch in VisualsContentFrame
local ESPFrame = Instance.new("Frame")
ESPFrame.Size = UDim2.new(0.9, 0, 0, 40)
ESPFrame.Position = UDim2.new(0.05, 0, 0, 10)
ESPFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ESPFrame.BorderSizePixel = 2
ESPFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
ESPFrame.Parent = VisualsContentFrame
addRoundedCorners(ESPFrame, 10)

local ESPLabel = Instance.new("TextLabel")
ESPLabel.Size = UDim2.new(0.7, 0, 1, 0)
ESPLabel.Position = UDim2.new(0, 10, 0, 0)
ESPLabel.BackgroundTransparency = 1
ESPLabel.Text = "ESP"
ESPLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPLabel.Font = Enum.Font.SourceSans
ESPLabel.TextSize = 16
ESPLabel.TextXAlignment = Enum.TextXAlignment.Left
ESPLabel.Parent = ESPFrame

local ESPCylinderSwitch = Instance.new("Frame")
ESPCylinderSwitch.Size = UDim2.new(0, 60, 0, 20)
ESPCylinderSwitch.Position = UDim2.new(0.8, 0, 0.5, -10)
ESPCylinderSwitch.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ESPCylinderSwitch.BorderSizePixel = 2
ESPCylinderSwitch.BorderColor3 = Color3.fromRGB(10, 10, 10)
ESPCylinderSwitch.Parent = ESPFrame
addRoundedCorners(ESPCylinderSwitch, 10)

local ESPBall = Instance.new("Frame")
ESPBall.Size = UDim2.new(0, 20, 0, 20)
ESPBall.Position = UDim2.new(0, 0, 0, 0)
ESPBall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPBall.Parent = ESPCylinderSwitch
addRoundedCorners(ESPBall, 10)

local espEnabled = false
local espConnections = {} -- Store connections to clean up later

local function createESP(player)
    local function onCharacterAdded(character)
        -- Ensure PrimaryPart is set
        if not character.PrimaryPart then
            character:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end

        -- Create adornments for each part of the character
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                local adornment = Instance.new("BoxHandleAdornment")
                adornment.Size = part.Size
                adornment.Adornee = part
                adornment.AlwaysOnTop = true
                adornment.ZIndex = 10
                adornment.Transparency = 0.5
                adornment.Color3 = Color3.fromRGB(255, 255, 255) -- Initial color
                adornment.Parent = part

                -- Function to animate the RGB color
                local function animateRGBColor()
                    while espEnabled do
                        for i = 0, 1, 0.01 do
                            adornment.Color3 = Color3.fromHSV(i, 1, 1)
                            RunService.RenderStepped:Wait()
                        end
                    end
                    adornment:Destroy()
                end
                coroutine.wrap(animateRGBColor)()
            end
        end
    end

    if player.Character then
        onCharacterAdded(player.Character)
    end
    table.insert(espConnections, player.CharacterAdded:Connect(onCharacterAdded))
end

local function removeESP(player)
    local function onCharacterRemoving(character)
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") and part:FindFirstChildOfClass("BoxHandleAdornment") then
                part:FindFirstChildOfClass("BoxHandleAdornment"):Destroy()
            end
        end
    end

    if player.Character then
        onCharacterRemoving(player.Character)
    end
    table.insert(espConnections, player.CharacterRemoving:Connect(onCharacterRemoving))
end

local function checkAndApplyESP()
    if espEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") and not part:FindFirstChildOfClass("BoxHandleAdornment") then
                            createESP(player)
                            break
                        end
                    end
                end
            end
        end
    end
end

local function startESP()
    espEnabled = true

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end

    table.insert(espConnections, Players.PlayerAdded:Connect(function(player)
        createESP(player)
    end))

    table.insert(espConnections, Players.PlayerRemoving:Connect(function(player)
        removeESP(player)
    end))

    -- Constantly check and apply ESP to new players or after respawn
    RunService.RenderStepped:Connect(checkAndApplyESP)
end

local function stopESP()
    espEnabled = false
    for _, connection in ipairs(espConnections) do
        connection:Disconnect()
    end
    espConnections = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            removeESP(player)
        end
    end
end

-- ESP toggle logic
ESPFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        espEnabled = not espEnabled
        if espEnabled then
            ESPBall:TweenPosition(UDim2.new(1, -20, 0, 0), "Out", "Sine", 0.2)
            ESPCylinderSwitch.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            startESP()
        else
            ESPBall:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.2)
            ESPCylinderSwitch.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            stopESP()
        end
    end
end)
-- FOV Slider
local FOVFrame = Instance.new("Frame")
FOVFrame.Size = UDim2.new(0.9, 0, 0, 40)
FOVFrame.Position = UDim2.new(0.05, 0, 0, 60)
FOVFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FOVFrame.BorderSizePixel = 2
FOVFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
FOVFrame.Parent = VisualsContentFrame
addRoundedCorners(FOVFrame, 10)

local FOVLabel = Instance.new("TextLabel")
FOVLabel.Size = UDim2.new(0.7, 0, 1, 0)
FOVLabel.Position = UDim2.new(0, 10, 0, 0)
FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "FOV"
FOVLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVLabel.Font = Enum.Font.SourceSans
FOVLabel.TextSize = 16
FOVLabel.TextXAlignment = Enum.TextXAlignment.Left
FOVLabel.Parent = FOVFrame

local Slider = Instance.new("Frame")
Slider.Size = UDim2.new(0, 180, 0, 20) -- Adjusted width to fit inside the box
Slider.Position = UDim2.new(0.75, -90, 0.5, -10) -- Adjusted position to fit inside the box
Slider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Slider.BorderSizePixel = 2
Slider.BorderColor3 = Color3.fromRGB(10, 10, 10)
Slider.Parent = FOVFrame
addRoundedCorners(Slider, 10)

local Thumb = Instance.new("Frame")
Thumb.Size = UDim2.new(0, 20, 0, 20)
Thumb.Position = UDim2.new(0.5, -10, 0, 0)
Thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Thumb.Parent = Slider
addRoundedCorners(Thumb, 10)

local function updateFOV(fov)
    Workspace.CurrentCamera.FieldOfView = fov
end

local dragging = false
Thumb.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local relativePosition = (input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X
        local clampedPosition = math.clamp(relativePosition, 0, 1)
        Thumb.Position = UDim2.new(clampedPosition, -10, 0, 0)
        local fov = clampedPosition * 120 -- Assuming FOV range is 0 to 120
        updateFOV(fov)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Make the GUI draggable
makeDraggable(MainFrame, TitleBar)

-- Reapply enabled features after player respawns
local function onCharacterAdded(character)
    if switchStates["Fly"] then
        flying = true
        startFlying()
    end
    if switchStates["Spin"] then
        spinning = true
        startSpinning()
    end
    if switchStates["Speed"] then
        speedEnabled = true
        startSpeed()
    end
    if switchStates["No Clip"] then
        startNoClip()
    end
    if switchStates["Kill all (tool)"] then
        killing = true
        startKilling()
    end
    if switchStates["Orbit"] then
        orbiting = true
        startOrbiting()
    end
    if switchStates["ESP"] then
        startESP()
    end
    if switchStates["Infinite Jump"] then
        toggleInfiniteJump(true)
    end
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
end

-- Aimbot script integration
local aimbotEnabled = false

local function startAimbot()
    -- Aimbot script here
--// Preventing Multiple Processes
pcall(function()
    getgenv().Aimbot.Functions:Exit()
end)

--// Environment
getgenv().Aimbot = {}
local Environment = getgenv().Aimbot

--// Services
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local StarterGui = game:GetService("StarterGui")

--// Variables
local LocalPlayer = Players.LocalPlayer
local Title = "Exunys Developer"
local FileNames = {"Aimbot", "Configuration.json", "Drawing.json"}
local Typing, Running, Animation, RequiredDistance, ServiceConnections = false, false, nil, 2000, {}

--// Support Functions
local mousemoverel = getgenv().mousemoverel or (Input and Input.MouseMove)
local queueonteleport = getgenv().queue_on_teleport or syn.queue_on_teleport

--// Script Settings
Environment.Settings = {
    SendNotifications = false, -- Disabled notifications
    SaveSettings = true,
    ReloadOnTeleport = true,
    Enabled = true,
    TeamCheck = true,
    AliveCheck = true,
    WallCheck = false,
    Sensitivity = 0,
    ThirdPerson = false,
    ThirdPersonSensitivity = 3,
    TriggerKey = "MouseButton2",
    Toggle = false,
    LockPart = "Head"
}

Environment.FOVSettings = {
    Enabled = true,
    Visible = true,
    Amount = 90,
    Color = "255, 255, 255",
    LockedColor = "0, 0, 0",
    Transparency = 0.5,
    Sides = 60,
    Thickness = 1,
    Filled = false
}

Environment.FOVCircle = Drawing.new("Circle")
Environment.Locked = nil

--// Core Functions
local function Encode(Table)
    if Table and type(Table) == "table" then
        local EncodedTable = HttpService:JSONEncode(Table)
        return EncodedTable
    end
end

local function Decode(String)
    if String and type(String) == "string" then
        local DecodedTable = HttpService:JSONDecode(String)
        return DecodedTable
    end
end

local function GetColor(Color)
    local R = tonumber(string.match(Color, "([%d]+)[%s]*,[%s]*[%d]+[%s]*,[%s]*[%d]+"))
    local G = tonumber(string.match(Color, "[%d]+[%s]*,[%s]*[%d]+[%s]*,[%s]*[%d]+"))
    local B = tonumber(string.match(Color, "[%d]+[%s]*,[%s]*[%d]+[%s]*,[%s]*[%d]+"))
    return Color3.fromRGB(R, G, B)
end

--// Functions
local function SaveSettings()
    if Environment.Settings.SaveSettings then
        if isfile(Title.."/"..FileNames[1].."/"..FileNames[2]) then
            writefile(Title.."/"..FileNames[1].."/"..FileNames[2], Encode(Environment.Settings))
        end

        if isfile(Title.."/"..FileNames[1].."/"..FileNames[3]) then
            writefile(Title.."/"..FileNames[1].."/"..FileNames[3], Encode(Environment.FOVSettings))
        end
    end
end

local function GetClosestPlayer()
    if not Environment.Locked then
        if Environment.FOVSettings.Enabled then
            RequiredDistance = Environment.FOVSettings.Amount
        else
            RequiredDistance = 2000
        end

        for _, v in next, Players:GetPlayers() do
            if v ~= LocalPlayer then
                if v.Character and v.Character:FindFirstChild(Environment.Settings.LockPart) and v.Character:FindFirstChildOfClass("Humanoid") then
                    if Environment.Settings.TeamCheck and v.Team == LocalPlayer.Team then continue end
                    if Environment.Settings.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
                    if Environment.Settings.WallCheck and #(Camera:GetPartsObscuringTarget({v.Character[Environment.Settings.LockPart].Position}, v.Character:GetDescendants())) > 0 then continue end

                    local Vector, OnScreen = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
                    local Distance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(Vector.X, Vector.Y)).Magnitude

                    if Distance < RequiredDistance and OnScreen then
                        RequiredDistance = Distance
                        Environment.Locked = v
                    end
                end
            end
        end
    elseif (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).X, Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).Y)).Magnitude > RequiredDistance then
        Environment.Locked = nil
        Animation:Cancel()
        Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
    end
end

--// Typing Check
ServiceConnections.TypingStartedConnection = UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

ServiceConnections.TypingEndedConnection = UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)

--// Create, Save & Load Settings
if Environment.Settings.SaveSettings then
    if not isfolder(Title) then
        makefolder(Title)
    end

    if not isfolder(Title.."/"..FileNames[1]) then
        makefolder(Title.."/"..FileNames[1])
    end

    if not isfile(Title.."/"..FileNames[1].."/"..FileNames[2]) then
        writefile(Title.."/"..FileNames[1].."/"..FileNames[2], Encode(Environment.Settings))
    else
        Environment.Settings = Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[2]))
    end

    if not isfile(Title.."/"..FileNames[1].."/"..FileNames[3]) then
        writefile(Title.."/"..FileNames[1].."/"..FileNames[3], Encode(Environment.FOVSettings))
    else
        Environment.Visuals = Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[3]))
    end

    coroutine.wrap(function()
        while wait(10) and Environment.Settings.SaveSettings do
            SaveSettings()
        end
    end)()
else
    if isfolder(Title) then
        delfolder(Title)
    end
end

local function Load()
    ServiceConnections.RenderSteppedConnection = RunService.RenderStepped:Connect(function()
        if Environment.FOVSettings.Enabled and Environment.Settings.Enabled then
            Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
            Environment.FOVCircle.Thickness = Environment.FOVSettings.Thickness
            Environment.FOVCircle.Filled = Environment.FOVSettings.Filled
            Environment.FOVCircle.NumSides = Environment.FOVSettings.Sides
            Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
            Environment.FOVCircle.Transparency = Environment.FOVSettings.Transparency
            Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
            Environment.FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
        else
            Environment.FOVCircle.Visible = false
        end

        if Running and Environment.Settings.Enabled then
            GetClosestPlayer()

            if Environment.Settings.ThirdPerson then
                Environment.Settings.ThirdPersonSensitivity = math.clamp(Environment.Settings.ThirdPersonSensitivity, 0.1, 5)

                if Environment.Locked then
                    local Vector = Camera:WorldToViewportPoint(Environment.Locked[Environment.Settings.LockPart].Position)
                    mousemoverel((Vector.X - UserInputService:GetMouseLocation().X) * Environment.Settings.ThirdPersonSensitivity, (Vector.Y - UserInputService:GetMouseLocation().Y) * Environment.Settings.ThirdPersonSensitivity)
                end
            else
                if Environment.Locked then
                    if Environment.Settings.Sensitivity > 0 then
                        Animation = TweenService:Create(Camera, TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)})
                        Animation:Play()
                    else
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)
                    end
                end
            end

            Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.LockedColor)
        end
    end)

    ServiceConnections.InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
        if not Typing then
            pcall(function()
                if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
                    if Environment.Settings.Toggle then
                        Running = not Running

                        if not Running then
                            Environment.Locked = nil
                            Animation:Cancel()
                            Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
                        end
                    else
                        Running = true
                    end
                end
            end)
        end
    end)

    ServiceConnections.InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
        if not Typing then
            pcall(function()
                if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
                    if not Environment.Settings.Toggle then
                        Running = false
                        Environment.Locked = nil
                        Animation:Cancel()
                        Environment.FOVCircle.Color = GetColor(Environment.FOVSettings.Color)
                    end
                end
            end)
        end
    end)
end

--// Functions
Environment.Functions = {}

function Environment.Functions:Exit()
    SaveSettings()

    for _, v in next, ServiceConnections do
        v:Disconnect()
    end

    if Environment.FOVCircle.Remove then Environment.FOVCircle:Remove() end

    getgenv().Aimbot.Functions = nil
    getgenv().Aimbot = nil
end

function Environment.Functions:Restart()
    SaveSettings()

    for _, v in next, ServiceConnections do
        v:Disconnect()
    end

    Load()
end

function Environment.Functions:ResetSettings()
    Environment.Settings = {
        SendNotifications = false,
        SaveSettings = true,
        ReloadOnTeleport = true,
        Enabled = true,
        TeamCheck = true,
        AliveCheck = true,
        WallCheck = false,
        Sensitivity = 0,
        ThirdPerson = false,
        ThirdPersonSensitivity = 3,
        TriggerKey = "MouseButton2",
        Toggle = false,
        LockPart = "Body"
    }

    Environment.FOVSettings = {
        Enabled = true,
        Visible = true,
        Amount = 90,
        Color = "255, 255, 255",
        LockedColor = "255, 70, 70",
        Transparency = 0.5,
        Sides = 60,
        Thickness = 1,
        Filled = false
    }
end

-- Load the aimbot
Load()

-- Show notification
StarterGui:SetCore("SendNotification", {
    Title = "ShoeBox Injected",
    Text = "ShoeBox Injected",
    Duration = 5,
})

local function stopAimbot()
    if getgenv().Aimbot and getgenv().Aimbot.Functions and getgenv().Aimbot.Functions.Exit then
        getgenv().Aimbot.Functions:Exit()
    end
end

-- Add AimBot switch to AimStuffContentFrame
local aimBotSwitchFrame = Instance.new("Frame")
aimBotSwitchFrame.Size = UDim2.new(0.9, 0, 0, 40)
aimBotSwitchFrame.Position = UDim2.new(0.05, 0, 0, 10)  -- Position moved to the top
aimBotSwitchFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aimBotSwitchFrame.BorderSizePixel = 2
aimBotSwitchFrame.BorderColor3 = Color3.fromRGB(10, 10, 10)
aimBotSwitchFrame.Parent = AimStuffContentFrame
addRoundedCorners(aimBotSwitchFrame, 10)

local aimBotLabel = Instance.new("TextLabel")
aimBotLabel.Size = UDim2.new(0.7, 0, 1, 0)
aimBotLabel.Position = UDim2.new(0, 10, 0, 0)
aimBotLabel.BackgroundTransparency = 1
aimBotLabel.Text = "AimBot"
aimBotLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
aimBotLabel.Font = Enum.Font.SourceSans
aimBotLabel.TextSize = 16
aimBotLabel.TextXAlignment = Enum.TextXAlignment.Left
aimBotLabel.Parent = aimBotSwitchFrame

local aimBotCylinderSwitch = Instance.new("Frame")
aimBotCylinderSwitch.Size = UDim2.new(0, 60, 0, 20)
aimBotCylinderSwitch.Position = UDim2.new(0.8, 0, 0.5, -10)
aimBotCylinderSwitch.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
aimBotCylinderSwitch.BorderSizePixel = 2
aimBotCylinderSwitch.BorderColor3 = Color3.fromRGB(10, 10, 10)
aimBotCylinderSwitch.Parent = aimBotSwitchFrame
addRoundedCorners(aimBotCylinderSwitch, 10)

local aimBotBall = Instance.new("Frame")
aimBotBall.Size = UDim2.new(0, 20, 0, 20)
aimBotBall.Position = UDim2.new(0, 0, 0, 0)
aimBotBall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
aimBotBall.Parent = aimBotCylinderSwitch
addRoundedCorners(aimBotBall, 10)

local aimBotToggled = false

aimBotSwitchFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        aimBotToggled = not aimBotToggled
        if aimBotToggled then
            aimBotBall:TweenPosition(UDim2.new(1, -20, 0, 0), "Out", "Sine", 0.2)
            aimBotCylinderSwitch.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            startAimbot()
        else
            aimBotBall:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Sine", 0.2)
            aimBotCylinderSwitch.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            stopAimbot()
        end
    end
end)

-- Reapply enabled features after player respawns
local function onCharacterAdded(character)
    if switchStates["Fly"] then
        flying = true
        startFlying()
    end
    if switchStates["Spin"] then
        spinning = true
        startSpinning()
    end
    if switchStates["Speed"] then
        speedEnabled = true
        startSpeed()
    end
    if switchStates["No Clip"] then
        startNoClip()
    end
    if switchStates["Kill all (tool)"] then
        killing = true
        startKilling()
    end
    if switchStates["Orbit"] then
        orbiting = true
        startOrbiting()
    end
    if switchStates["ESP"] then
        startESP()
    end
    if switchStates["Infinite Jump"] then
        toggleInfiniteJump(true)
    end
    if aimBotToggled then
        startAimbot()
    end
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
end

print("Custom GUI script loaded successfully!")
