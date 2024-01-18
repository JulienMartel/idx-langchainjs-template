{ pkgs, typescript ? false, ... }: {
    packages = [];
    bootstrap = ''
      cp -rf ${if typescript then ./ts else ./js } "$out"

      mkdir "$out"/.idx
      cp -f ${./shared/dev.nix} "$out"/.idx/
      cp ${./shared/hotdog.jpg} "$out"/hotdog.jpg
      cp -f ${./shared/gitignore} "$out"/.gitignore
      cp -f ${./shared/example.env} "$out"/.env

      chmod -R +w "$out"
    '';
}