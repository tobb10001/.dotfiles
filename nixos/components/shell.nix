{
  pkgs,
  unstable,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Shells
    nushell

    # Direct Dependencies
    # Packages that integrate with the shell or shell tools directly.
    delta
    direnv
    unstable.fzf
    grc # configured for go test
    gum # in some scripts
    starship
    zoxide

    # Shell Tools
    # These are the ones that are inherently for shell environments.
    bat
    eza
    fd
    file
    graphviz
    imagemagick
    jless
    jq
    lazygit
    libqalculate
    gnumake
    moreutils # contains sponge
    parallel-full
    progress
    ripgrep
    socat
    stow
    go-task
    tldr
    translate-shell
    watchexec
    xmlstarlet
    yq

    # General Tools
    # These are the ones that I use on the shell, because I like
    # to do things there, although their domain isn't bound to the shell.
    borgbackup
    btop
    dig
    exiftool
    ipcalc
    openssl
    pandoc
    pciutils
    sc-im
    traceroute
    usbutils
    zip
  ];
}
