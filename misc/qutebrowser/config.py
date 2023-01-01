# Bindings
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("gK", "tab-move +")
config.bind("gJ", "tab-move -")

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
c.statusbar.widgets = ["url", "keypress", "scroll", "history", "tabs", "progress"]

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
    "black": "rgb(26, 27, 38)",
    "green": "#9ece6a",
}
c.colors.hints.bg = "rgba(122, 162, 247, 0.8)"
c.colors.hints.match.fg = "white"
c.colors.messages.error.bg = COLORS["red"]
c.colors.statusbar.caret.bg = COLORS["purple"]
c.colors.statusbar.command.bg = COLORS["black"]
c.colors.statusbar.normal.bg = COLORS["black"]
c.colors.statusbar.insert.bg = COLORS["green"]
c.colors.statusbar.insert.fg = "black"

# Other options
c.editor.command = [
    "/Users/dzfrias/.dotfiles/misc/qutebrowser/qutebrowser_edit.sh",
    "{file}",
]
c.scrolling.bar = "always"
