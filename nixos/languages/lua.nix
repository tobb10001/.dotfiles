{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Lua
    lua5_1
    lua-language-server
    selene
    stylua
    # Luau
    luau-lsp
  ];
}
