#!/usr/bin/env bash

# ArchLinux
# idutils in AUR
pacman -Syu --needed ctags python-pygments cabal-install stack ghc emacs auctex emacs-haskell-mode emacs-lua-mode emacs-python-mode

# Haskell
pacman -Su --needed happy alex ghc-mod haskell-ghc-mod hasktags stylish-haskell hlint hoogle hindent
