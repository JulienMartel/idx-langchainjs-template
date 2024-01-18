{ pkgs, typescript ? false, ... }: {
    packages = [];
    bootstrap = ''
      mkdir -p "$out"/.idx/

      cp -rf ${if typescript then ./ts else ./js } "$out"

      cp ${./shared/dev.nix} "$out"/.idx
      cp ${./shared/hotdog.jpg} "$out"
      cp ${./shared/gitignore} "$out"/.gitignore
      cp ${./shared/example.env} "$out"/.env

      chmod -R +w "$out"
    '';
}