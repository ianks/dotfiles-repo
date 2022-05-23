local application = require("hs.application")
local stackline = require("stackline")

HYPEEEER = { "cmd", "alt", "shift", "ctrl" }
MEH = { "alt", "shift", "ctrl" }
ADJUST = { "cmd", "shift", "ctrl" }

function yabai(args)
	hs.task.new("/opt/homebrew/bin/yabai", nil, function(ud, ...)
		print("yabai output:", hs.inspect(table.pack(...)))
		return true
	end, args):start()
end

function yabaiBindSpace(key, cmds)
	hs.hotkey.bind(MEH, key, function()
		for _, args in pairs(cmds) do
			yabai(args)
		end
	end)
end

-- Move focus
yabaiBindSpace("j", { { "-m", "window", "--focus", "south" } })
yabaiBindSpace("k", { { "-m", "window", "--focus", "north" } })
yabaiBindSpace("h", { { "-m", "window", "--focus", "west" } })
yabaiBindSpace("l", { { "-m", "window", "--focus", "east" } })

-- Rotate layout
yabaiBindSpace("e", { { "-m", "window", "--toggle", "split" } })

-- Stack layout
yabaiBindSpace("s", { { "-m", "space", "--layout", "stack" } })

-- BSP layout
yabaiBindSpace("b", { { "-m", "space", "--layout", "bsp" } })

function shellTask(cmd)
	hs.task.new("/bin/sh", nil, function(ud, ...)
		print("shell output:", hs.inspect(table.pack(...)))
		return true
	end, { "-c", cmd }):start()
end

-- Picture in picture
hs.hotkey.bind(MEH, "p", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --toggle border; /opt/homebrew/bin/yabai -m window --toggle pip; /opt/homebrew/bin/yabai -m window --toggle float; /opt/homebrew/bin/yabai -m window --grid 8:8:6:5:2:3"
	)
end)

-- Move window
hs.hotkey.bind(HYPEEEER, "left", function()
	shellTask("/opt/homebrew/bin/yabai -m window --warp west || /opt/homebrew/bin/yabai -m window --display west")
end)

hs.hotkey.bind(HYPEEEER, "down", function()
	shellTask("/opt/homebrew/bin/yabai -m window --warp south || /opt/homebrew/bin/yabai -m window --display south")
end)

hs.hotkey.bind(HYPEEEER, "up", function()
	shellTask("/opt/homebrew/bin/yabai -m window --warp north || /opt/homebrew/bin/yabai -m window --display north")
end)

hs.hotkey.bind(HYPEEEER, "right", function()
	shellTask("/opt/homebrew/bin/yabai -m window --warp east || /opt/homebrew/bin/yabai -m window --display east")
end)

-- Move window to space
hs.hotkey.bind(HYPEEEER, "1", function()
	shellTask("/opt/homebrew/bin/yabai -m window --space 1; /opt/homebrew/bin/yabai -m space --focus 1")
end)

hs.hotkey.bind(HYPEEEER, "2", function()
	shellTask("/opt/homebrew/bin/yabai -m window --space 2; /opt/homebrew/bin/yabai -m space --focus 2")
end)

hs.hotkey.bind(HYPEEEER, "3", function()
	shellTask("/opt/homebrew/bin/yabai -m window --space 3; /opt/homebrew/bin/yabai -m space --focus 3")
end)

hs.hotkey.bind(HYPEEEER, "4", function()
	shellTask("/opt/homebrew/bin/yabai -m window --space 4; /opt/homebrew/bin/yabai -m space --focus 4")
end)

-- Focus window
hs.hotkey.bind(MEH, "h", function()
	shellTask("/opt/homebrew/bin/yabai -m window --focus west")
end)

hs.hotkey.bind(MEH, "j", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --focus south || /opt/homebrew/bin/yabai -m window --focus stack.next || /opt/homebrew/bin/yabai -m window --focus stack.first"
	)
end)

hs.hotkey.bind(MEH, "k", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --focus north || /opt/homebrew/bin/yabai -m window --focus stack.prev || /opt/homebrew/bin/yabai -m window --focus stack.last"
	)
end)

hs.hotkey.bind(MEH, "l", function()
	shellTask("/opt/homebrew/bin/yabai -m window --focus east")
end)

-- Resize
hs.hotkey.bind(ADJUST, "h", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --resize left:-80:0 || /opt/homebrew/bin/yabai -m window --resize right:-80:0"
	)
end)

hs.hotkey.bind(ADJUST, "j", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --resize bottom:0:80 || /opt/homebrew/bin/yabai -m window --resize top:0:80"
	)
end)

hs.hotkey.bind(ADJUST, "k", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --resize top:0:-80 || /opt/homebrew/bin/yabai -m window --resize bottom:0:-80"
	)
end)

hs.hotkey.bind(ADJUST, "l", function()
	shellTask(
		"/opt/homebrew/bin/yabai -m window --resize right:80:0 || /opt/homebrew/bin/yabai -m window --resize left:80:0"
	)
end)

-- Toggle window zoom
hs.hotkey.bind(HYPEEEER, "f", function()
	shellTask("/opt/homebrew/bin/yabai -m window --toggle zoom-fullscreen")
end)
hs.hotkey.bind(HYPEEEER, "d", function()
	shellTask("/opt/homebrew/bin/yabai -m window --toggle zoom-parent")
end)

-- float / unfloat window and center on screen
hs.hotkey.bind(HYPEEEER, "t", function()
	shellTask("/opt/homebrew/bin/yabai -m window --toggle float; /opt/homebrew/bin/yabai -m window --grid 4:4:1:1:2:2")
end)

hs.hotkey.bind(HYPEEEER, "q", function()
	local window = hs.window.focusedWindow()
	if window then
		window:close()
	end
end)

hs.hotkey.bind(MEH, "return", function()
	if hs.application.find("iTerm") then
		hs.applescript.applescript([[
			tell application "iTerm"
				create window with default profile
			end tell
		]])
	else
		hs.application.open("iTerm")
	end
end)

function toggleAppWindow(appName)
	local app = hs.appfinder.appFromName(appName)
	if app == nil then
		hs.application.launchOrFocus(appName)
	else
		local systemFocusedWindow = hs.window.focusedWindow()

		if systemFocusedWindow == app:focusedWindow() then
			app:hide()
		else
			--  local appWindow = app:mainWindow()
			--  spaces.moveWindowToSpace(appWindow.id(), spaces.activeSpace())
			app:unhide()
			app:activate()
			app:setFrontmost(true)
		end
	end
end

hs.hotkey.bind(HYPEEEER, "c", function()
	toggleAppWindow("Calendar")
end)
hs.hotkey.bind(HYPEEEER, "m", function()
	toggleAppWindow("com.spotify.client")
end)
hs.hotkey.bind(HYPEEEER, "n", function()
	toggleAppWindow("Obsidian")
end)
hs.hotkey.bind(HYPEEEER, "b", function()
	shellTask("/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --new-window")
end)

-- Disable global cmd+h
hs.hotkey.bind({ "cmd" }, "h", function() end)

-- Stackline
local stacklineConf = require("stackline.conf")
local stackline = require("stackline.stackline.stackline")
stacklineConf.appearance.showIcons = false
stacklineConf.paths.yabai = "/opt/homebrew/bin/yabai"
stackline:init(stacklineConf)
