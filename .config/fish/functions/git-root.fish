function git-root --description "Print the root of the git repository, if there is one"
    git rev-parse --git-dir | path dirname
end