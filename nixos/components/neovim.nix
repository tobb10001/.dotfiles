{
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # package = unstable.neovim;
    withNodeJs = false;
    withPython3 = false;
    withRuby = false;
  };

  environment.systemPackages = with pkgs; [
    # LazyVim Deps
    ast-grep
    ghostscript
    luarocks
    mermaid-cli
    sqlite # Zotcite
    tectonic
    tree-sitter

    # LSP
    harper
    ltex-ls-plus
  ];
}
