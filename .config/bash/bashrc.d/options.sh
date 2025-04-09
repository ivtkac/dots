# Prepend cd to directory names automatically
shopt -s autocd

# Replace directory names with results of word expansion
shopt -s direxpand

# Correct spelling errors during tab-completion
shopt -s dirspell

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Check if hashed commands exist before executing
shopt -s checkhash

# Check for stopped or running jobs before exiting
shopt -s checkjobs

# Turn on checkwinsize
shopt -s checkwinsize

# Allow expanded glob syntax
shopt -s extglob

# Enable support for recursive globbing via "**"
shopt -s globstar
