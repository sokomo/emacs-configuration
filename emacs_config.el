
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; (setq package-enable-at-startup nil)
(package-initialize)

(load-file "~/.emacs.d/emacs_config_loader/base_emacs_loader.elc")
(load-file "~/.emacs.d/emacs_config_loader/editing_loader.elc")
(load-file "~/.emacs.d/emacs_config_loader/cedet_loader.elc")
;;(load-file "~/.emacs.d/emacs_config_loader/gtags_loader.elc"
(load-file "~/.emacs.d/emacs_config_loader/helm_loader.elc")
(load-file "~/.emacs.d/emacs_config_loader/helm_gtags_loader.elc")
(load-file "~/.emacs.d/emacs_config_loader/c_cpp_loader.elc")
(load-file "~/.emacs.d/emacs_config_loader/auctex_loader.elc")
(load-file "~/.emacs.d/emacs_config_loader/haskell_loader.elc")
;(load-file "~/.emacs.d/emacs_config_loader/lua_loader.el")
;(load-file "~/.emacs.d/emacs_config_loader/perl_loader.el")
;(load-file "~/.emacs.d/emacs_config_loader/python_loader.el")

