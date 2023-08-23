hs.hotkey.bind({ "cmd" }, "=", function()
	wez = hs.application.find("Wezterm")
	-- print(wez)
	if wez == nil then
		hs.application.launchOrFocus("Wezterm")
	else
		if wez:isFrontmost() then
			wez:hide()
		else
			wez:activate()
		end
	end
end)

hs.hotkey.bind({ "cmd" }, "]", function()
	vscode = hs.application.find("Code")
	if vscode:isFrontmost() then
		vscode:hide()
	else
		vscode:activate()
	end
end)
