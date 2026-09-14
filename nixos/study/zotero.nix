{
  pkgs,
  unstable,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    poppler-utils
    tesseract # OCR
    unstable.zotero
  ];
}
