# Nushell Environment Config file

def create_left_prompt [] {
    let dir = ([
        ($env.PWD | str substring 0..($env.HOME | str length) | str replace -s $env.HOME "~"),
        ($env.PWD | str substring ($env.HOME | str length)..)
    ] | str join)

    let path_segment = if (is-admin) {
        $"(ansi red_bold)($dir)"
    } else {
        $"(ansi green_bold)($dir)"
    }

    [ $path_segment ]
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format "%H:%M:%S")
    ] | str join)

    $time_segment
}

# Use nushell to create the prompt

let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

let-env PROMPT_INDICATOR = { "> " }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "> " }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

let-env ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand -n }
        to_string: { |v| $v | path expand -n | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand -n }
        to_string: { |v| $v | path expand -n | str join (char esep) }
    }
}

let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]


# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

let-env PATH = ($env.PATH | split row (char esep) | prepend ~/.cargo/bin | prepend ~/.local/bin | prepend ~/.deno/bin)

let-env HELIX_RUNTIME = $env.HOME + "/.local/share/helix/runtime"

mkdir ~/.cache/nushell
starship init nu | save -f ~/.cache/nushell/starship.nu

zoxide init nushell | save -f ~/.cache/nushell/zoxide.nu