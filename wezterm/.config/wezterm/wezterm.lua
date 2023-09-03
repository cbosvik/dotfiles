local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- config.default_prog = { "/opt/homebrew/bin/nu", "-l" }
config.default_cursor_style = "SteadyBlock"
config.window_decorations = "RESIZE"
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}
config.quit_when_all_windows_are_closed = true
config.color_scheme = "tokyonight"
config.colors = {
	cursor_bg = "orange",
}
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13
config.line_height = 1.2
config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.unzoom_on_switch_pane = true
config.window_frame = {
	font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}

-- config.disable_default_key_bindings = true

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- copy paste
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	-- misc
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  { key = "t", mods = "LEADER", action = act.ActivateKeyTable({ name = "activate_tab" }), timeout_milliseconds = 1000 },
  -- { key = "p", mods = "LEADER", action = act.ActivateKeyTable({ name = "activate_pane" }), timeout_milliseconds = 1000 },
	{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
	{ key = "+", mods = "SUPER", action = act.IncreaseFontSize },
	{ key = "0", mods = "SUPER", action = act.ResetFontSize },
	{ key = "P", mods = "SUPER|SHIFT", action = act.ActivateCommandPalette },
	{ key = "L", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },


	{ key = "i", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  {
        key = "[",
        mods = "LEADER",
        action = act.Multiple {
          act.ActivatePaneDirection "Up",
          act.EmitEvent "reload-helix",
        }
      },
	{
		     key = "s",
		     mods = "LEADER",
		     action = wezterm.action.QuickSelectArgs {
		      label = "open url",
					patterns = {
			        "https?://\\S+",
			        "^/[^/\r\n]+(?:/[^/\r\n]+)*:\\d+:\\d+",
			        "[^\\s]+\\.rs:\\d+:\\d+",
			        "rustc --explain E\\d+",
			      },
            action = wezterm.action_callback(function(window, pane)
		        local selection = window:get_selection_text_for_pane(pane)
		        wezterm.log_info("opening: " .. selection)
		        if startswith(selection, "http") then
		          wezterm.open_with(selection)
		        elseif startswith(selection, "rustc --explain") then
							local action = wezterm.action{
		             SplitPane={
		               direction = "Right",
		               command = {
		                 args = {
		                   "/bin/sh",
		                   "-c",
		                   "rustc --explain " .. selection:match("(%S+)$") .. " | mdcat -p",
		                 },
		              },
		            };
		          };
		          window:perform_action(action, pane);
		        else
		          selection = "$EDITOR:" .. selection
		          return open_with_hx(window, pane, selection)
		        end
		      end),
		    },
		  },
	}

config.key_tables = {
	resize_pane = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },	},
	-- activate_pane = {
	-- { key = "i", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { key = "v", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- { key = "x", action = act.CloseCurrentPane({ confirm = true }) },
	-- { key = "h", action = act.ActivatePaneDirection("Left") },
	-- { key = "j", action = act.ActivatePaneDirection("Down") },
	-- { key = "k", action = act.ActivatePaneDirection("Up") },
	-- { key = "l", action = act.ActivatePaneDirection("Right") },
	-- { key = "z", action = act.TogglePaneZoomState },
	-- },
	activate_tab = {
	{ key = "l", action = act.ActivateTabRelative(1) },
	{ key = "h", action = act.ActivateTabRelative(-1) },
	{ key = "n", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "x", action = act.CloseCurrentTab({ confirm = true }) },
	}
}


function startswith(str, prefix)
  return string.sub(str, 1, string.len(prefix)) == prefix
end

wezterm.on('reload-helix', function(window, pane)
  local top_process = basename(pane:get_foreground_process_name())
  if top_process == 'hx' then
    local bottom_pane = pane:tab():get_pane_direction('Down')
    if bottom_pane ~= nil then
      local bottom_process = basename(bottom_pane:get_foreground_process_name())
      if bottom_process == 'lazygit' then
        local action = wezterm.action.SendString(':reload-all\r\n')
        window:perform_action(action, pane);
      end
    end
  end
end)

for i = 1, 8 do
  -- CTRL+ALT+number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end


function extract_filename(uri)
  local start, match_end = uri:find("$EDITOR:");
  if start == 1 then
    return uri:sub(match_end+1)
  end

  return nil
end

function editable(filename)
  local extension = filename:match("%.([^.:/\\]+):%d+:%d+$")
  if extension then
    wezterm.log_info(string.format("extension is [%s]", extension))
    local text_extensions = {
      md = true,
      c = true,
      go = true,
      scm = true,
      rkt = true,
      rs = true,
    }
    if text_extensions[extension] then
      return true
    end
  end

  return false
end

function extension(filename)
  return filename:match("%.([^.:/\\]+):%d+:%d+$")
end

function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

function open_with_hx(window, pane, url)
  local name = extract_filename(url)
  wezterm.log_info('name: ' .. url)
  if name and editable(name) then
    if extension(name) == "rs" then
      local pwd = string.gsub(pane:get_current_working_dir(), "file://.-(/.+)", "%1")
      name = pwd .. "/" .. name
    end

    local direction = 'Up'
    local hx_pane = pane:tab():get_pane_direction(direction)
    if hx_pane == nil then
      local action = wezterm.action{
        SplitPane={
          direction = direction,
          command = { args = { 'hx', name } }
        };
      };
      window:perform_action(action, pane);
      pane:tab():get_pane_direction(direction).activate()
    elseif basename(hx_pane:get_foreground_process_name()) == "hx" then
      local action = wezterm.action.SendString(':open ' .. name .. '\r\n')
      window:perform_action(action, hx_pane);
      hx_pane:activate()
    else
      local action = wezterm.action.SendString('hx ' .. name .. '\r\n')
      window:perform_action(action, hx_pane);
      hx_pane:activate()
    end
    -- prevent the default action from opening in a browser
    return false
  end
  -- otherwise, by not specifying a return value, we allow later
  -- handlers and ultimately the default action to caused the
  -- URI to be opened in the browser
end

wezterm.on('open-uri', function(window, pane, uri)
  return open_with_hx(window, pane, uri)
end)

config.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
  regex = '^/[^/\r\n]+(?:/[^/\r\n]+)*:\\d+:\\d+',
  format = '$EDITOR:$0',
})

table.insert(config.hyperlink_rules, {
  regex = '[^\\s]+\\.rs:\\d+:\\d+',
  format = '$EDITOR:$0',
})

-- https://wezfurlong.org/wezterm/faq.html#multiple-characters-being-renderedcombined-as-one-character
config.harfbuzz_features = { 'calt=0' }

-- and finally, return the configuration to wezterm
return config