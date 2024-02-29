alias cat='bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never'

alias cp='cp -iv'

alias du='dust'

alias fcd='cd $(find -type d | fzf)'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status'

alias grep='rg'

alias la='eza -lah --tree'
alias ls='eza -h --git --icons --color=auto --group-directories-first -s extension'

alias mv='mv -iv'

alias ps='procs'

alias rm='rm -iv'

alias tree='eza --tree --icons'

alias untar='tar -xvf'
alias untargz='tar -xzf'

alias ytmp3='yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata --output "%(title)s.%(ext)s"'
