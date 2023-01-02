config.load_autoconfig()

# Bindings
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("gK", "tab-move +")
config.bind("gJ", "tab-move -")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind(
    "gs",
    "spawn --userscript ~/.dotfiles/misc/qutebrowser/userscripts/switch_google_account.py",
)
config.bind(
    "tt",
    "spawn --userscript /Users/dzfrias/.dotfiles/misc/qutebrowser/userscripts/translate.py",
)
config.bind(
    "tz",
    "spawn --userscript /Users/dzfrias/.dotfiles/misc/qutebrowser/userscripts/translate_to_chinese.py",
)

# Commands
c.aliases = {
    "q": "close",
    "qa": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "wqa": "quit --save",
    "src": "config-source",
}

# Font
c.fonts.default_size = "11pt"
c.fonts.default_family = "MesloLGM Nerd Font"

# Completion
c.completion.height = "40%"
c.completion.use_best_match = True

# Input
c.input.insert_mode.auto_load = True
c.input.links_included_in_focus_chain = False

# Status bar
c.statusbar.padding = {"bottom": 1, "left": 0, "right": 0, "top": 5}
c.statusbar.widgets = [
    "url",
    "keypress",
    "scroll",
    "history",
    "tabs",
    "progress",
]

# Fonts
c.fonts.messages.error = "bold default_size default_family"
c.fonts.prompts = "default_size default_family"
c.fonts.tabs.selected = "italic default_size default_family"

# Tabs
c.tabs.indicator.width = 8
c.tabs.last_close = "startpage"
c.tabs.padding = {"bottom": 4, "left": 5, "right": 5, "top": 4}
c.tabs.title.alignment = "center"

# Colors
COLORS = {
    "white": "rgb(169, 177, 214)",
    "red": "rgb(247, 118, 142)",
    "purple": "rgb(187, 154, 247)",
    "purple2": "#4d3872",
    "magenta": "#bb9af7",
    "orange": "#ff9e64",
    "black": "#16161e",
    "green": "#9ece6a",
    "blue": "#3d59a1",
    "dark blue": "#13265c",
    "sky blue": "#b4f9f8",
    "light blue": "#b4f9f8",
}

c.colors.webpage.preferred_color_scheme = "dark"

c.colors.hints.bg = COLORS["light blue"]
c.colors.hints.match.fg = COLORS["light blue"]

c.colors.messages.error.bg = COLORS["red"]
c.colors.messages.warning.bg = COLORS["orange"]
c.colors.messages.info.bg = COLORS["black"]
c.colors.messages.info.fg = "white"
c.colors.messages.warning.bg = COLORS["black"]
c.colors.messages.warning.fg = COLORS["orange"]
c.colors.messages.error.bg = COLORS["black"]
c.colors.messages.error.fg = COLORS["red"]

c.colors.statusbar.caret.bg = "#ff9e64"
c.colors.statusbar.command.bg = "#071a4f"
c.colors.statusbar.command.fg = "white"
c.colors.statusbar.normal.bg = COLORS["black"]
c.colors.statusbar.insert.bg = COLORS["green"]
c.colors.statusbar.insert.fg = "black"
c.colors.statusbar.url.hover.fg = COLORS["orange"]
c.colors.statusbar.url.fg = COLORS["sky blue"]
c.colors.statusbar.url.success.http.fg = COLORS["sky blue"]
c.colors.statusbar.url.success.https.fg = COLORS["sky blue"]

c.hints.border = "1px solid black"

c.colors.tabs.selected.even.bg = COLORS["blue"]
c.colors.tabs.selected.odd.bg = COLORS["blue"]
c.colors.tabs.odd.bg = COLORS["black"]
c.colors.tabs.even.bg = COLORS["black"]
c.colors.tabs.indicator.stop = COLORS["purple"]
c.colors.tabs.indicator.error = COLORS["red"]

c.colors.keyhint.suffix.fg = "aqua"

c.colors.completion.fg = [COLORS["magenta"], "white", "white"]
c.colors.completion.even.bg = "#24283b"
c.colors.completion.odd.bg = "#24283b"
c.colors.completion.match.fg = COLORS["green"]
c.colors.completion.item.selected.match.fg = COLORS["orange"]
c.colors.completion.item.selected.fg = "#d3d3d3"
c.colors.completion.item.selected.border.bottom = "aqua"
c.colors.completion.item.selected.border.top = "aqua"
c.colors.completion.category.bg = COLORS["black"]
c.colors.completion.category.fg = COLORS["sky blue"]
c.colors.completion.category.border.bottom = "cyan"

# Other options
c.editor.command = [
    "/Users/dzfrias/.dotfiles/misc/qutebrowser/qutebrowser_edit.sh",
    "{file}",
]
c.scrolling.bar = "always"
