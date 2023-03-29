function ls --wraps='exa --icons --group-directories-first --color-scale' --description 'alias ls=exa'
    exa --icons --color-scale --group-directories-first $argv;
end
