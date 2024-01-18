{ pkgs, typescript ? false, ... }: {
    packages = [];
    bootstrap = ''
      cp -rf ${if typescript then ./ts else ./js } "$out"

      mkdir "$out"/.idx
      cp ${./shared/dev.nix} "$out"/.idx
      cp ${./shared/hotdog.jpg} "$out"
      cp ${./shared/gitignore} "$out"/.gitignore
      cp ${./shared/example.env} "$out"/.env

      chmod -R +w "$out"
    '';
}