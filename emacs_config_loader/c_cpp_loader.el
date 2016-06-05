;; C/C++ configuration
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Indent
(setq tab-width 2) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)

;; Debugger
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Google coding style
;(add-hook 'c-mode-common-hook 'google-set-c-style)

;; If you want the RETURN key to go to the next line and space over
;; to the right place, add this to your .emacs right after the load-file:

;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
