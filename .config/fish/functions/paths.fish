function paths --description "Displays every path in $PATH"
    for path in $PATH
        echo -- $path
    end
end