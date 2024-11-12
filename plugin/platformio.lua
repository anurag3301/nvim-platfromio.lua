-- Pioinit
vim.api.nvim_create_user_command("Pioinit", function()
	require("platformio.pioinit").pioinit()
end, {})

-- Piodb
vim.api.nvim_create_user_command("Piodb", function()
	require("platformio.piodb").piodb()
end, {})

-- Piorun
vim.api.nvim_create_user_command("Piorun", function(opts)
	local args = opts.args
	if args == "upload" then -- checking valid commands
		require("platformio.piorun").pioupload()
	elseif args == "build" then
		require("platformio.piorun").piobuild()
	elseif args == "clean" then
		require("platformio.piorun").pioclean()
	else
		vim.api.nvim_err_writeln("Invalid argument. Use 'upload', 'build', or 'clean'.") -- error message if the cmd is invalid
	end
end, {
	nargs = 1, -- Only one argument is expected
	complete = function(_, _, _)
		return { "upload", "build", "clean" } -- Autocompletion options
	end,
})

-- Piomon
vim.api.nvim_create_user_command("Piomon", function(opts)
	local args = opts.args
	if args == 0 then
		require("platformio.piomon").piomon(0)
	else
		require("platformio.piomon").piomon(args)
	end
end, {})

-- Piolib
vim.api.nvim_create_user_command("Piolib", function()
	require("platformio.piolib").piolib()
end, {})
