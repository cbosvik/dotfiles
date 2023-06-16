let-env config = {
  show_banner: false,

  }

let-env PATH = 
mkdir -p ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
