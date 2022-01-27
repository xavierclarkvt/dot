hs.grid.setGrid'2x2'
hs.grid.setMargins("0,0")
hs.window.animationDuration = 0

function getWin()
  return hs.window.focusedWindow()
end

--- arrows: move window
hs.hotkey.bind(mash, "left", function() hs.grid.pushWindowLeft() end)
hs.hotkey.bind(mash, "right", function() hs.grid.pushWindowRight() end)
hs.hotkey.bind(mash, "up", function() hs.grid.pushWindowUp() end)
hs.hotkey.bind(mash, "down", function() hs.grid.pushWindowDown() end)

--- ikjl: resize window
hs.hotkey.bind(mash, "i", function() hs.grid.resizeWindowShorter() end)
hs.hotkey.bind(mash, "k", function() hs.grid.resizeWindowTaller() end)
hs.hotkey.bind(mash, "j", function() hs.grid.resizeWindowThinner() end)
hs.hotkey.bind(mash, "l", function() hs.grid.resizeWindowWider() end)

--- /: move window to next screen
hs.hotkey.bind(mash, "/", function() local win = getWin(); win:moveToScreen(win:screen():next()) end)

--- space: maximize window
hs.hotkey.bind(mash, ",", function() hs.grid.maximizeWindow() end)

--- .: minimize window
hs.hotkey.bind(mash, ".", function() hs.grid.set(getWin(), '0,0 1x1'); end)
