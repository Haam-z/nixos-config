{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url =
      "https://github.com/nix-community/nix-doom-emacs/archive/da227e13707789198870deb3222af0f5f12b475d.tar.gz";
    sha256 = "0a1rpjzy3zf0v6zqwpm744mhfr03fsz5ndgkm12cfi16wi77ycc1";
  }) { doomPrivateDir = ./doom.d; };
in {
  home.packages = with pkgs; [
    #rust
    rustup
    rust-analyzer
    doom-emacs
    # Hasskell
    haskellPackages.brittany
    haskellPackages.haskell-language-server
    # elixir
    elixir
    elixir_ls
    # clojure
    leiningen
    clojure-lsp
    # c/c++
    clang
    clang-tools
    #nix
    rnix-lsp
    nixfmt
    #shell scripting
    nodePackages_latest.bash-language-server
    shfmt
    #Latex and markdown
    #python
    python3
    emacsPackages.lsp-python-ms
    python39Packages.python-lsp-server
    nodePackages.prettier
  ];
}
