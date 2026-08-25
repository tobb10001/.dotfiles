{
  pkgs,
  unstable,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Latex
    texlab
    # Markdown
    markdownlint-cli2
    # Typst
    unstable.typst
    tinymist
  ];
}
