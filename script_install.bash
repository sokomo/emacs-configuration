#!/usr/bin/env bash

emacs -batch -l ./install_package.el
#emacs -batch -l ~/.emacs --eval "(progn(package-list-packages)(package-install 'ggtags)(package-install 'helm-core)(package-install 'helm-gtags))"

# Coppy this line to .bashrc or .zshrc
#export GTAGSLIBPATH=$HOME/.gtags/

# Create a directory for holding database, since
# you cannot create a database in your system paths
mkdir -pv ~/.gtags

# Create symbolic links to your external libraries
pushd ~/.gtags
ln -sfv /usr/include usr-include
ln -sfv /usr/local/include/ usr-local-include

# Generate GNU Global database
gtags -c

popd

# Build el config files
emacs -batch --eval '(progn(package-initialize)(byte-recompile-directory (expand-file-name "./emacs_config_loader") 0))'

# Or build 1 file
#emacs --batch --eval '(byte-compile-file "your-elisp-file.el")'

# Add to emacs.d
mkdir -p ~/.emacs.d
cp -rfv emacs_config.el ~/.emacs
cp -rfv emacs_config_loader/ ~/.emacs.d/


