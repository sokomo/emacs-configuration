#!/usr/bin/env bash

#LIST_PACKAGES="happy hasktags stylish-haskell present ghc-mod hlint hoogle structured-haskell-mode hindent"
LIST_PACKAGES="happy hasktags stylish-haskell ghc-mod hlint hoogle hindent"

cabal sandbox init
cabal update
cabal install cabal-install
cabal install $LIST_PACKAGES

#stack new haskell-emacs-env
#pushd haskell-emacs-env
#stack setup
#stack install $LIST_PACKAGES


