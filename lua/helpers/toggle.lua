local toggle = {}

toggle.word = function()
	local toggles = {
		["True"] = "False",
		["False"] = "True",
		["true"] = "false",
		["false"] = "true",
		["On"] = "Off",
		["Off"] = "On",
		["Yes"] = "No",
		["No"] = "Yes",
		["on"] = "off",
		["off"] = "on",
		["yes"] = "no",
		["no"] = "yes",
	}

	local word = vim.fn.expand("<cword>")
	local replacement = toggles[word]
	if replacement then
		vim.cmd("normal! ciw" .. replacement)
	else
		vim.notify("Not a toggleable word: " .. word, vim.log.levels.INFO)
	end
end

return toggle
