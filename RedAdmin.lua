-- Create a LocalScript in the ScreenGui

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")

-- List of trusted usernames (add as many as you need)
local trustedUsernames = {
    "TrustedUser1",
    "TrustedUser2",
    "TrustedUser3",
    "yuodsaq6backup",
    "DHEPOOPEA96_MORE"
}

-- Function to check if the player is whitelisted
local function isWhitelisted(player)
    for _, username in ipairs(trustedUsernames) do
        if player.Name == username then
            return true
        end
    end
    return false
end

-- Check if the player is whitelisted
if not isWhitelisted(LocalPlayer) then
    LocalPlayer:Kick("You are not whitelisted to use this script.")
    return
end

-- Function to make a GUI draggable
local function makeDraggable(frame)
    local dragging
    local dragInput
    local startPos
    local mouse = Players.LocalPlayer:GetMouse()

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            startPos = frame.Position
            dragInput = input
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input == dragInput then
            dragging = false
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if dragging then
            local mousePos = mouse.Hit.Position
            local offset = UDim2.new(0, mouse.X - frame.AbsoluteSize.X/2, 0, mouse.Y - frame.AbsoluteSize.Y/2)
            frame.Position = startPos + offset
        end
    end)
end

-- Base GUI elements
local ScreenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local executeButton = Instance.new("TextButton")
local titleLabel = Instance.new("TextLabel")
local dropDown = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")
local openButton = Instance.new("TextButton")
local flightFrame = Instance.new("Frame")
local flyUpButton = Instance.new("TextButton")
local flyDownButton = Instance.new("TextButton")
local unflyButton = Instance.new("TextButton")
local closeFlightButton = Instance.new("TextButton")
local otherScriptsFrame = Instance.new("Frame")
local betterBypasserButton = Instance.new("TextButton")
local changealogButton = Instance.new("TextButton")
local changealogFrame = Instance.new("Frame")
local changealogLabel = Instance.new("TextLabel")
local changealogCloseButton = Instance.new("TextButton")

local commands = {
    "Kill All",
    "Go To The Void",
    "Fly",
    "Rejoin",
    "Serverhop",
    "Other Scripts"
}
local selectedCommand = "Select Command"
local flying = false
local bodyVelocity

-- Properties for Main Frame
mainFrame.Size = UDim2.new(0.4, 0, 0.4, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.Visible = false

-- Properties for Title
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
titleLabel.Text = "Red's Admin"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.FontSize = Enum.FontSize.Size24
titleLabel.TextScaled = true

-- Properties for Execute Button
executeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
executeButton.Position = UDim2.new(0.7, 0, 0.5, 0)
executeButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
executeButton.Text = "Execute"

-- Properties for Close Button
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.8, 0, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "Close"

-- Open Button Settings
openButton.Size = UDim2.new(0.1, 0, 0.1, 0)
openButton.Position = UDim2.new(0.9, 0, 0.1, 0)
openButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
openButton.Text = "Open"

-- Dropdown Setup
dropDown.Size = UDim2.new(0.5, 0, 0.1, 0)
dropDown.Position = UDim2.new(0.1, 0, 0.5, 0)
dropDown.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
dropDown.Text = selectedCommand

-- Properties for Flight GUI
flightFrame.Size = UDim2.new(0.3, 0, 0.2, 0)
flightFrame.Position = UDim2.new(0.35, 0, 0.6, 0)
flightFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
flightFrame.Visible = false

-- Close Button for Flight GUI
closeFlightButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeFlightButton.Position = UDim2.new(0.8, 0, 0, 0)
closeFlightButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeFlightButton.Text = "Close"

-- Up Button Properties
flyUpButton.Size = UDim2.new(0.4, 0, 0.3, 0)
flyUpButton.Position = UDim2.new(0.5, 0, 0, 0)
flyUpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
flyUpButton.Text = "Up"

-- Down Button Properties
flyDownButton.Size = UDim2.new(0.4, 0, 0.3, 0)
flyDownButton.Position = UDim2.new(0.5, 0, 0.4, 0)
flyDownButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
flyDownButton.Text = "Down"

-- Unfly Button Properties
unflyButton.Size = UDim2.new(0.4, 0, 0.3, 0)
unflyButton.Position = UDim2.new(0.5, 0, 0.8, 0)
unflyButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
unflyButton.Text = "Unfly"

-- Other Scripts Frame
otherScriptsFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
otherScriptsFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
otherScriptsFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
otherScriptsFrame.Visible = false

-- BetterBypasser Button
betterBypasserButton.Size = UDim2.new(0.8, 0, 0.2, 0)
betterBypasserButton.Position = UDim2.new(0.1, 0, 0.1, 0)
betterBypasserButton.BackgroundColor3 = Color3.fromRGB(0, 200, 200)
betterBypasserButton.Text = "Load BetterBypasser"

-- Changealog Button
changealogButton.Size = UDim2.new(0.2, 0, 0.1, 0)
changealogButton.Position = UDim2.new(0.7, 0, 0.4, 0)
changealogButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
changealogButton.Text = "Changealog"

-- Changealog Frame
changealogFrame.Size = UDim2.new(0.4, 0, 0.3, 0)
changealogFrame.Position = UDim2.new(0.3, 0, 0.35, 0)
changealogFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
changealogFrame.Visible = false

-- Changealog Label
changealogLabel.Size = UDim2.new(1, 0, 0.2, 0)
changealogLabel.Position = UDim2.new(0, 0, 0, 0)
changealogLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
changealogLabel.Text = "Changealog:\n- Added Changealog\n- Added new Command"
changealogLabel.TextScaled = true

-- Changealog Close Button
changealogCloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
changealogCloseButton.Position = UDim2.new(0.8, 0, 0, 0)
changealogCloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
changealogCloseButton.Text = "Close"

-- Command functions
local function killAll()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            player.Character:BreakJoints()
        end
    end
end

local function goToVoid()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.Position = Vector3.new(0, -500, 0) -- Adjust as needed for your game
    end
end

local function fly()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    flying = true
    flightFrame.Visible = true

    -- Create a BodyVelocity object for flying
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0) -- Set to origin
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Parent = character.HumanoidRootPart

    -- Handle input for the flight
    flyUpButton.MouseButton1Click:Connect(function()
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Fly Up
    end)

    flyDownButton.MouseButton1Click:Connect(function()
        bodyVelocity.Velocity = Vector3.new(0, -50, 0) -- Fly Down
    end)

    unflyButton.MouseButton1Click:Connect(function()
        unfly()
    end)

    -- Stop flying when character dies
    character.Humanoid.Died:Connect(function()
        unfly()
    end)
end

local function unfly()
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    flightFrame.Visible = false
    flying = false
end

local function rejoin()
    local placeId = game.PlaceId
    TeleportService:Teleport(placeId, LocalPlayer) -- This will rejoin the same game
end

local function serverhop()
    -- Placeholder logic for server hopping
    local newServerPlaceId = 0  -- Replace with actual logic to get a new server
    if newServerPlaceId then
        TeleportService:Teleport(newServerPlaceId, LocalPlayer) -- Teleport to new server
    end
end

-- Load BetterBypasser
betterBypasserButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-BetterBypasser-Chat-Bypass-AI-ChatBot-Hub-22691"))()
end)

-- Open Other Scripts Frame
dropDown.MouseButton1Click:Connect(function()
    selectedCommand = "Other Scripts"
    dropDown.Text = selectedCommand
    otherScriptsFrame.Visible = true
end)

-- Handle button click for Execute
executeButton.MouseButton1Click:Connect(function()
    if selectedCommand == "Kill All" then
        killAll()
    elseif selectedCommand == "Go To The Void" then
        goToVoid()
    elseif selectedCommand == "Fly" then
        fly()
    elseif selectedCommand == "Rejoin" then
        rejoin()
    elseif selectedCommand == "Serverhop" then
        serverhop()
    end
end)

-- Dropdown listener
dropDown.MouseButton1Click:Connect(function()
    selectedCommand = commands[math.random(1, #commands)] -- Randomly select a command
    dropDown.Text = selectedCommand
end)

-- Close functionality for the main frame
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Open button functionality
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
end)

-- Close functionality for the flight frame
closeFlightButton.MouseButton1Click:Connect(function()
    flightFrame.Visible = false
end)

-- Close functionality for Changealog Frame
changealogCloseButton.MouseButton1Click:Connect(function()
    changealogFrame.Visible = false
end)

-- Open Changealog Frame
changealogButton.MouseButton1Click:Connect(function()
    changealogFrame.Visible = true
end)

-- Finalize GUI
mainFrame.Parent = ScreenGui
titleLabel.Parent = mainFrame
executeButton.Parent = mainFrame
dropDown.Parent = mainFrame
closeButton.Parent = mainFrame

flightFrame.Parent = ScreenGui
flyUpButton.Parent = flightFrame
flyDownButton.Parent = flightFrame
unflyButton.Parent = flightFrame
closeFlightButton.Parent = flightFrame

otherScriptsFrame.Parent = ScreenGui
betterBypasserButton.Parent = otherScriptsFrame

changealogFrame.Parent = ScreenGui
changealogLabel.Parent = changealogFrame
changealogCloseButton.Parent = changealogFrame

-- Open button parent
openButton.Parent = ScreenGui

-- Make the frames draggable
makeDraggable(mainFrame)
makeDraggable(flightFrame)
makeDraggable(otherScriptsFrame)
makeDraggable(changealogFrame)

-- Hide the main frame initially
mainFrame.Visible = false

-- Finalize ScreenGui
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui
