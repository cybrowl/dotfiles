hs.hotkey.bind({"ctrl"}, "3", function()
  hs.application.launchOrFocus("Alacritty")
end)

hs.hotkey.bind({"ctrl"}, "2", function()
  hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind({"ctrl"}, "q", function()
  hs.application.launchOrFocus("Quiver")
end)

hs.hotkey.bind({"ctrl", "cmd"}, "n", function()
  hs.application.launchOrFocus("GitKraken")
end)

hs.hotkey.bind({"ctrl", "cmd"}, "j", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)