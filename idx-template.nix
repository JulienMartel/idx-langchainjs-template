{ pkgs, typescript ? false, ... }: {
    packages = [];
    bootstrap = ''
      mkdir -p "$out"
      cp -rf ${if typescript then ./ts else ./js } "$out"

      mkdir "$out"/.idx
      cp ${./shared/dev.nix} "$out"/.idx/dev.nix
      cp ${./shared/hotdog.jpg} "$out"/hotdog.jpg
      cp ${./shared/gitignore} "$out"/.gitignore
      cp ${./shared/example.env} "$out"/.env

      chmod -R +w "$out"
    '';
}