function ls --wraps='exa --icons --color-scale' --description 'alias ls=exa'
    exa --icons --color-scale $argv;
end
