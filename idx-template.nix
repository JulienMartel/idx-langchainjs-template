{ pkgs, typescript ? false, ... }: {
    packages = [];
    bootstrap = ''
      cp -rf ${if typescript then ./ts else ./js } "$out"

      mkdir "$out"/.idx
      cp ${./shared/dev.nix} "$out"/.idx
      mv ${./shared/hotdog.jpg} "$out"
      mv ${./shared/gitignore} "$out"/.gitignore
      mv ${./shared/example.env} "$out"/.env

      chmod -R +w "$out"
    '';
}