{
  pkgs,
  nixpkgs-zotero,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    poppler-utils
    tesseract # OCR
    nixpkgs-zotero.zotero
  ];
}
