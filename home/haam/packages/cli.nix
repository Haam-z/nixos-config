{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #rust
    rustup
    rust-analyzer
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
