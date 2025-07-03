local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- واجهة
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("SpeedGUI") then
	CoreGui.SpeedGUI:Destroy()
end

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "SpeedGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "⚙️ التحكم في السرعة"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

local sliderLabel = Instance.new("TextLabel", frame)
sliderLabel.Size = UDim2.new(1, -20, 0, 20)
sliderLabel.Position = UDim2.new(0, 10, 0, 45)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "قم بتحديد سرعتك:"
sliderLabel.TextColor3 = Color3.new(1,1,1)
sliderLabel.Font = Enum.Font.SourceSansBold
sliderLabel.TextSize = 18

local slider = Instance.new("TextBox", frame)
slider.Size = UDim2.new(0.9, 0, 0, 35)
slider.Position = UDim2.new(0.05, 0, 0, 75)
slider.Text = "16"
slider.PlaceholderText = "16"
slider.TextColor3 = Color3.new(1,1,1)
slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
slider.Font = Enum.Font.SourceSans
slider.TextSize = 20
slider.ClearTextOnFocus = false

local startBtn = Instance.new("TextButton", frame)
startBtn.Size = UDim2.new(0.4, 0, 0, 40)
startBtn.Position = UDim2.new(0.1, 0, 0, 130)
startBtn.Text = "تشغيل"
startBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
startBtn.TextColor3 = Color3.new(1,1,1)
startBtn.Font = Enum.Font.SourceSansBold
startBtn.TextSize = 20

local stopBtn = Instance.new("TextButton", frame)
stopBtn.Size = UDim2.new(0.4, 0, 0, 40)
stopBtn.Position = UDim2.new(0.5, 0, 0, 130)
stopBtn.Text = "إيقاف"
stopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
stopBtn.TextColor3 = Color3.new(1,1,1)
stopBtn.Font = Enum.Font.SourceSansBold
stopBtn.TextSize = 20

-- منطق السرعة
local defaultSpeed = 16

startBtn.MouseButton1Click:Connect(function()
	local speed = tonumber(slider.Text)
	if speed and speed > 0 then
		humanoid.WalkSpeed = speed
	else
		humanoid.WalkSpeed = defaultSpeed
	end
end)

stopBtn.MouseButton1Click:Connect(function()
	humanoid.WalkSpeed = defaultSpeed
end)
