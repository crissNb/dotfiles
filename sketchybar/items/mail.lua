local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local mail = sbar.add("item", "widgets.mail", {
    position = "right",
    icon = {
        font = {
            style = settings.font.style_map["Regular"],
            size = 14.0,
        }
    },
    label = { font = { family = settings.font.numbers } },
    update_freq = 20,
    popup = { align = "center" }
})

mail:subscribe({ "forced", "routine", "system_woke" }, function()
    local total = 0

    -- Iterate through folders
    for folder in io.popen('ls -d ~/.local/share/mail/*/'):lines() do
        -- Count files in INBOX/new/
        local handle = io.popen('find "' .. folder .. 'INBOX/new/" -type f | wc -l')
        local count = tonumber(handle:read('*a'))
        handle:close()
        -- Add count to total
        total = total + count
    end

    -- Set icon and label based on total count
    if total > 0 then
        mail:set({
            icon = {
                string = icons.mail.new
            },
            label = { string = total },
        })
    else
        mail:set({
            icon = {
                string = icons.mail.empty
            },
            label = { string = total },
        })
    end
end)

sbar.add("bracket", "widgets.mail.bracket", { mail.name }, {
    background = { color = colors.bg1 }
})
