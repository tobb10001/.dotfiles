$env.config.show_banner = false
$env.config.edit_mode = "vi"

$env.PATH = ($env.PATH | prepend ($env.HOME | path join ".cargo/bin"))

$env.XDG_CACHE_HOME = $env.HOME | path join ".cache"
$env.XDG_CONFIG_HOME = $env.HOME | path join ".config"
$env.XDG_DATA_HOME = $env.HOME | path join ".local/share"
$env.XDG_STATE_HOME = $env.HOME | path join ".local/state"

$env.GRB_LICENSE_FILE = $env.HOME | path join ".config" "gurobi" "gurobi.lic"

alias clip = wl-copy
alias diff = diff -W (tput cols)

if not (which grc | is-empty) {
  alias go = grc go
}

alias lslsls = echo "Yeah, I don't know either..."
alias pandoc = pandoc --defaults ~/.config/pandoc/pandoc.yaml
alias emacs = emacs -nw
alias pip = pip --require-virtualenv
alias spawn = niri msg action spawn --
alias view = nvim -R

def xopen [item] {
  echo Running (mimeo --command $item)
  setsid mimeo --quiet $item
}

$env.config.keybindings ++= [{
    name: previous_command
    modifier: control_alt
    keycode: char_k
    mode: [vi_normal,vi_insert]
    event: { send: PreviousHistory }
}]

$env.config.keybindings ++= [{
    name: next_command
    modifier: control_alt
    keycode: char_j
    mode: [vi_normal,vi_insert]
    event: { send: NextHistory }
}]

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init --cmd cd --hook prompt nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

use std/config *

# Initialize the PWD hook as an empty list if it doesn't exist
$env.config.hooks.env_change.PWD = $env.config.hooks.env_change.PWD? | default []

$env.config.hooks.env_change.PWD ++= [{||
  if (which direnv | is-empty) {
    # If direnv isn't installed, do nothing
    return
  }

  direnv export json | from json | default {} | load-env
  # If direnv changes the PATH, it will become a string and we need to re-convert it to a list
  $env.PATH = do (env-conversions).path.from_string $env.PATH
}]
