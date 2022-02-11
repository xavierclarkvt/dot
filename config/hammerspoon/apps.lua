local function toggleApplication(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:hide()
    hs.application.launchOrFocus(name)
  else
    app:hide()
  end
end

hs.hotkey.bind(mash, "f", function() toggleApplication("Finder") end)
hs.hotkey.bind(mash, "t", function() toggleApplication("Terminal") end)