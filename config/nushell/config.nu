# Nushell Configuration File

# The default config record. This is where much of your global configuration is setup.
let-env config = {  
  rm: {
    always_trash: true # Always move files to the trash instead of deleting them. Can be overridden with the -p flag.
  }

  cd: {
    abbreviations: true # Enable abbreviations for directories.
  }
  
  table: {
    mode: compact # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, non, other
  }

  history: {
    file_format: "sqlite" # "sqlite" or "plaintext"
  }

  completions: {
    case_sensitive: true # set to true to enable case-sensitive completions
    algorithm: "fuzzy" # "fuzzy" or "prefix"
  }

  cursor_shape: {
    vi_insert: line 
    vi_normal: block
  }

  float_precision: 3 # The number of decimal places to show for floats

  edit_mode: vi # vi or emacs

  show_banner: false # Show the banner when starting nushell
}

use ~/.config/nushell/aliases.nu *
use ~/.config/nushell/scripts/git-completions.nu *

source ~/.cache/nushell/starship.nu
source ~/.cache/nushell/zoxide.nu


