# Locale
if LC_ALL=C locale -a | grep -q '^en_US.utf8$'; then
  export LANG=en_US.utf8
elif LC_ALL=C locale -a | grep -q '^C.utf8$'; then
  export LANG=C.utf8
else
  export LANG=C
fi

export LANGUAGE="$LANG"
export LC_COLLATE="$LANG"
export LC_CTYPE="$LANG"
export LC_IDENTIFICATION="$LANG"
export LC_NUMERIC="$LANG"
export LC_MESSAGES="$LANG"

unset LC_ALL

if locale -a | grep -q '^uk_UA.utf8$'; then
  export LC_ADDRESS=uk_UA.utf8
  export LC_MEASUREMENT=uk_UA.utf8
  export LC_MONETARY=uk_UA.utf8
  export LC_NAME=uk_UA.utf8
  export LC_PAPER=uk_UA.utf8
  export LC_TELEPHONE=uk_UA.utf8
  export LC_TIME=uk_UA.utf8
else
  export LC_ADDRESS="$LANG"
  export LC_MEASUREMENT="$LANG"
  export LC_MONETARY="$LANG"
  export LC_NAME="$LANG"
  export LC_PAPER="$LANG"
  export LC_TELEPHONE="$LANG"
  export LC_TIME="$LANG"
fi

# Path
for d in $HOME/.local/bin $HOME/.local/opt/*/bin; do
  if [ -d "$d" ]; then
    PATH="$d${PATH:+:$PATH}"
  fi
done

# Enable using helix as editor of other commands.  Setting
# ALTERNATE_EDITOR like this makes nvim default, if it can't find one.
export EDITOR="hx"
export ALTERNATE_EDITOR="nvim"

# Use less with -R (show ANSI colour)
export PAGER='less -R'
