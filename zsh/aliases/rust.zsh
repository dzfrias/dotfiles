# Cargo
alias temprs='cargo init --name temprs'
alias cr='cargo run'
alias ct='cargo nextest run'
alias rustc='~/.cargo/bin/rustc'

alias crm='bat Cargo.toml | sed "1,/^\[dependencies\]$/d" | sed "/^\[.*\]$/d" | sed "/^$/d" | fzf | cut -w -f 1 | xargs cargo remove'

# Trunk
alias ts='trunk serve --open'

