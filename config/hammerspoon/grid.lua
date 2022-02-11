hs.grid.setGrid'2x2'
hs.grid.setMargins("0,0")
hs.window.animationDuration = 0

function getWin()
  return hs.window.frontmostWindow()
end

--- arrows: move to side window
hs.hotkey.bind(mash, "left", function() hs.grid.set(getWin(), '0,0 1x2') end)
hs.hotkey.bind(mash, "right", function() hs.grid.set(getWin(), '1,0 1x2') end)
hs.hotkey.bind(mash, "up", function() hs.grid.set(getWin(), '0,0 2x1') end)
hs.hotkey.bind(mash, "down", function() hs.grid.set(getWin(), '0,1 2x1') end)

--- ikjl: move window to corner window
hs.hotkey.bind(mash, ";", function() hs.grid.set(getWin(), '0,0 1x1') end)
hs.hotkey.bind(mash, "'", function() hs.grid.set(getWin(), '1,0 1x1') end)
hs.hotkey.bind(mash, ".", function() hs.grid.set(getWin(), '0,1 1x1') end)
hs.hotkey.bind(mash, "/", function() hs.grid.set(getWin(), '1,1 1x1') end)

--- space: maximize window
hs.hotkey.bind(mash, "space", function() hs.grid.maximizeWindow() end)

--- ,: minimize window TODO: find way to maximize window after minimizing
hs.hotkey.bind(mash, ",", function() local win = getWin(); win:minimize() end)