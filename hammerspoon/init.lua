-- Define a table for key-app bindings
local appBindings = {
    i = "Alacritty",
    b = "Brave Browser",
    h = "Google Chrome",
    g = "GitKraken",
    n = "Quiver",
    w = "iA Writer",
    v = "Visual Studio Code",
    z = "Zed"
}

-- Iterate through the table to bind keys
for key, app in pairs(appBindings) do
    hs.hotkey.bind({ "ctrl", "cmd" }, key, function()
        if not hs.application.launchOrFocus(app) then
            hs.alert.show("Unable to launch " .. app)
        end
    end)
end

-- We'll store possible widths for the "right" side in a table
local rightWidths = { 0.5, 0.7 } -- Cycle through these widths
local currentRightIndex = 1      -- Index to track which width is next

-- Helper function to move and resize windows
local function moveWindowTo(position)
    local win = hs.window.focusedWindow()
    if not win then
        hs.alert.show("No active window detected!")
        print("No active window detected!")
        return
    end

    print("Active window: " .. win:title()) -- Log the active window title
    local screen = win:screen()
    local frame = screen:frame()

    if position == "center" then
        win:centerOnScreen()
    elseif position == "fullscreen" then
        win:setFrame(frame)
    elseif position == "left" then
        win:setFrame({
            x = frame.x,
            y = frame.y,
            w = frame.w / 2,
            h = frame.h
        })
    elseif position == "right" then
        -- Pick the next width in our list
        local width = rightWidths[currentRightIndex]

        -- Calculate the new frame, aligning on the right
        local newWidth = frame.w * width
        local newX = frame.x + (frame.w - newWidth)

        win:setFrame({
            x = newX,
            y = frame.y,
            w = newWidth,
            h = frame.h
        })

        -- Update the index for the next time
        currentRightIndex = currentRightIndex % #rightWidths + 1
    end
end

-- Bind keys to window positions
hs.hotkey.bind({ "ctrl", "cmd" }, "C", function() moveWindowTo("center") end)     -- Center
hs.hotkey.bind({ "ctrl", "cmd" }, "K", function() moveWindowTo("fullscreen") end) -- Fullscreen
hs.hotkey.bind({ "ctrl", "cmd" }, "L", function() moveWindowTo("left") end)       -- Left Half
hs.hotkey.bind({ "ctrl", "cmd" }, "R", function() moveWindowTo("right") end)      -- Right Half
