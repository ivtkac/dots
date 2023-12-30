function gl -d "git log at requested pretty level" -a format
  set -q format[1]; and git log --pretty=$format
end

complete -c gl -x -a "(complete -C 'git log --pretty=' | sed 's/^--pretty=//')"
