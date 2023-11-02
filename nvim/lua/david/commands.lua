local build_commands = {
  c = "g++ -std=c++17 -o %:p:r.o %",
  cpp = "g++ -std=c++17 -Wall -O2 -o %:p:r.o %",
  rust = "cargo build --release",
  go = "go build",
}

local debug_build_commands = {
  c = "g++ -std=c++17 -g -o %:p:r.o %",
  cpp = "g++ -std=c++17 -g -o %:p:r.o %",
  rust = "cargo build",
  go = "go build",
}

local run_commands = {
  c = "%:p:r.o",
  cpp = "%:p:r.o",
  rust = "cargo run --release",
  -- go = "%:p:r.o",
  go = "go run .",
}

vim.api.nvim_create_user_command("Build", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(build_commands) do
    if filetype == file then
      vim.cmd("!" .. command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("DebugBuild", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(debug_build_commands) do
    if filetype == file then
      vim.cmd("!" .. command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Run", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(run_commands) do
    if filetype == file then
      vim.cmd("sp")
      vim.cmd("term " .. command)
      vim.cmd("resize 20N")
      local keys = vim.api.nvim_replace_termcodes("i", true, false, true)
      vim.api.nvim_feedkeys(keys, "n", false)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Ha", function()
  vim.cmd([[Build]])
  vim.cmd([[Run]])
end, {})

vim.api.nvim_create_user_command("Config", function() vim.cmd([[cd ~/.config/nvim]]) end, {})

vim.api.nvim_create_user_command("UpdateAll", function()
  vim.cmd([[TSUpdateSync]])
  vim.cmd([[MasonUpdate]])
end, {})

local function getWords()
  if vim.fn.getfsize(vim.fn.expand("%")) > 200000 then
    return ""
  end

  if vim.fn.wordcount().visual_words == 1 then
    return "1 word"
  elseif not (vim.fn.wordcount().visual_words == nil) then
    return tostring(vim.fn.wordcount().visual_words) .. " words"
  else
    if vim.fn.wordcount().words == 1 then
      return "1 word"
    else
      return tostring(vim.fn.wordcount().words) .. " words"
    end
  end
end

local wordCountOn = false

vim.api.nvim_create_user_command("WordCount", function()
  if wordCountOn then
    require("lualine").setup({
      sections = {
        lualine_c = { "filename" },
      },
    })
    wordCountOn = true
  else
    require("lualine").setup({
      sections = {
        lualine_c = { "filename", { getWords } },
      },
    })
    wordCountOn = true
  end
end, {})
