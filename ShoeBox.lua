-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the draggable frame (box)
local dragFrame = Instance.new("Frame")
dragFrame.Size = UDim2.new(0, 200, 0, 100) -- Box size
dragFrame.Position = UDim2.new(0.5, -100, 0.5, -50) -- Centered position
dragFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Box color
dragFrame.BorderSizePixel = 2
dragFrame.Active = true
dragFrame.Draggable = true -- Makes it draggable
dragFrame.Parent = screenGui

-- Create a label inside the box
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0) -- Full size inside the box
label.BackgroundTransparency = 1
label.Text = "Draggable Box"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.Parent = dragFrame
