{ pkgs, typescript ? false, ... }: {
    packages = [];
    bootstrap = ''
      cp -rf ${if typescript then ./ts else ./js } "$WS_NAME"

      mkdir "$WS_NAME"/.idx
      cp ${./shared/dev.nix} "$WS_NAME"/.idx/
      cp ${./shared/hotdog.jpg} "$WS_NAME"/hotdog.jpg
      cp ${./shared/gitignore} "$WS_NAME"/.gitignore
      cp ${./shared/example.env} "$WS_NAME"/.env

      mv "$WS_NAME" "$out"
      chmod -R +w "$out"
    '';
}