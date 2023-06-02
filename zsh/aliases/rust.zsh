# Cargo
alias temprs='cargo init --name temprs'
alias cr='cargo run'
alias ca='cargo add'
alias ct='cargo nextest run'
alias cdoc='cargo doc --open'
alias rustc='~/.cargo/bin/rustc'
alias ccl='cargo clippy --all'

alias crm='bat Cargo.toml | sed "1,/^\[dependencies\]$/d" | sed "/^\[.*\]$/d" | sed "/^$/d" | fzf | cut -w -f 1 | xargs cargo remove'

# Trunk
alias ts='trunk serve --open'

