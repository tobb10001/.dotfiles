{
  pkgs,
  nixpkgs-zotero,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    alsa-utils # Provides aplay, used by Pied's Speech Dispatcher module.
    poppler-utils
    pied # Read aloud
    piper-tts # Read aloud
    nixpkgs-zotero.zotero
  ];

  services.speechd = {
    enable = true;
    config = ''
      AddModule "piper" "sd_generic" "piper.conf"
      DefaultModule "piper"
    '';
    modules.piper = ''
           GenericExecuteSynth "${pkgs.coreutils}/bin/printf %s \'$DATA\' | ${pkgs.piper-tts}/bin/piper --model \"$VOICE\" --output_raw | ${pkgs.pipewire}/bin/pw-play --raw --rate 22050
      --channels 1 --format s16 -"

           AddVoice "en" "MALE1" "/home/tobi/.local/share/com.mikeasoft.pied/models/en_GB-cori-high.onnx"
           AddVoice "en-GB" "MALE1" "/home/tobi/.local/share/com.mikeasoft.pied/models/en_GB-cori-high.onnx"
           DefaultVoice "/home/tobi/.local/share/com.mikeasoft.pied/models/en_GB-cori-high.onnx"

           GenericLanguage "en" "en-GB" "utf-8"
           GenericLanguage "en-GB" "en-GB" "utf-8"
    '';
  };
}
