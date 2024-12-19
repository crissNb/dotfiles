function Fzfprojects(projects, opts)
  local repos = {}

  projects = projects or {}
  opts = opts or {}
  opts.prompt = "Projects> "
  opts.actions = {
    ['default'] = function(selected)
      vim.cmd("cd " .. repos[selected[1]])
    end
  }

  local max_depth = opts.max_depth or 3

  for _, project in ipairs(projects) do
    local key = string.match(project, ".*/(.*)")
    local absolute_path = vim.fn.expand(project)

    repos[key] = absolute_path

    local git_dirs = require("plenary.scandir").scan_dir(absolute_path, {
      depth = max_depth,
      add_dirs = true,
      hidden = true,
      search_pattern = "%.git$"
    })

    for _, val in ipairs(git_dirs) do
      local git_dir = string.gsub(val, "/.git$", '')
      key = string.match(git_dir, ".*/(.*)")
      repos[key] = git_dir
    end
  end

  local dirs = {}
  for key in pairs(repos) do
    dirs[#dirs+1] = key
  end

  table.sort(dirs, function(a, b) return a:lower() < b:lower() end)

  require("fzf-lua").fzf_exec(dirs or {}, opts)
end
