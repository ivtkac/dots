function is_empty --description "Check if a list of arguments is empty"
    not count $argv >/dev/null
    return
end