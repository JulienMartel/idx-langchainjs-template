# /opt/nix/store/pi1a3ca85v80whh6pyanpv1lf3idm6h7-idx-template/bin/idx-template ~/Monospace/workspace/nix_templates/lanchain-js-gemini --output-dir ~ --workspace-name foo -a '{"typescript": "true"}'
{ pkgs, typescript ? false, ... }: {
    packages = [
      pkgs.nodejs
    ];
    bootstrap = ''

      cp -rf ${if typescript then ./ts else ./js } "$WS_NAME"
      chmod -R +w "$WS_NAME"
      mv "$WS_NAME" "$out"
    '';
}