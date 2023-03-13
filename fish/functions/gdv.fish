function gdv -w "git diff -w" -d "Pipe `git diff` to `hx` editor"
  git diff -w $argv | hx -
end
