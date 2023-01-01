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

# Other options
c.editor.command = [
    "/Users/dzfrias/.dotfiles/misc/qutebrowser/qutebrowser_edit.sh",
    "{file}",
]
c.scrolling.bar = "always"
