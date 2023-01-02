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
    "black": "#16161e",
    "green": "#9ece6a",
    "blue": "#3d59a1",
    "dark blue": "#13265c",
    "light blue": "#b4f9f8",
}

c.colors.hints.bg = COLORS["light blue"]
c.colors.hints.match.fg = COLORS["light blue"]

c.colors.messages.error.bg = COLORS["red"]

c.colors.statusbar.caret.bg = COLORS["purple"]
c.colors.statusbar.command.bg = COLORS["black"]
c.colors.statusbar.normal.bg = COLORS["black"]
c.colors.statusbar.insert.bg = COLORS["green"]
c.colors.statusbar.insert.fg = "black"

c.hints.border = "1px solid black"

c.colors.tabs.selected.even.bg = COLORS["blue"]
c.colors.tabs.selected.odd.bg = COLORS["blue"]
c.colors.tabs.odd.bg = COLORS["black"]
c.colors.tabs.even.bg = COLORS["black"]

c.colors.keyhint.suffix.fg = "aqua"

c.colors.completion.even.bg = "#24283b"
c.colors.completion.odd.bg = "#24283b"
c.colors.completion.match.fg = COLORS["green"]
c.colors.completion.item.selected.match.fg = COLORS["red"]
c.colors.completion.item.selected.fg = "white"
c.colors.completion.category.bg = COLORS["dark blue"]
c.colors.completion.category.border.bottom = COLORS["white"]

c.colors.statusbar.url.success.https.fg = "white"

# Other options
c.editor.command = [
    "/Users/dzfrias/.dotfiles/misc/qutebrowser/qutebrowser_edit.sh",
    "{file}",
]
c.scrolling.bar = "always"
