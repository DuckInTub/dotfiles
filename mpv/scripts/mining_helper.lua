local mp = require 'mp'

-- LibreWolf extension URL
local extension_url = "moz-extension://8f2bb15f-17ba-4e14-9d4f-df7bbe799a3c/search.html"

-- Function to escape shell strings safely
local function shell_escape(str)
    -- Escape single quotes for shell safety
    return "'" .. str:gsub("'", "'\\''") .. "'"
end

-- Function to copy subtitle text to clipboard using xclip
local function copy_to_clipboard(text)
    text = text:gsub("\n", " ")  -- remove newlines
    local escaped = shell_escape(text)
    if os.getenv("WAYLAND_DISPLAY") then -- On wayland
        os.execute("printf %s " .. escaped .. " | wl-copy")
    else
        os.execute("printf %s " .. escaped .. " | xclip -selection clipboard")
    end
end

-- Function to get subtitle text
local function copy_subtitle()
    local sub_text = mp.get_property("sub-text")
    
    if not sub_text or sub_text == "" then
        mp.osd_message("No subtitle to copy", 1)
        return
    end

    copy_to_clipboard(sub_text)
    mp.osd_message("Copied: " .. sub_text, 2)
end

local function open_yomitan()
    os.execute("librewolf " .. extension_url)
end

-- Bind CTRL+C to the function
mp.add_key_binding("ctrl+c", "copy_subtitle", copy_subtitle)

