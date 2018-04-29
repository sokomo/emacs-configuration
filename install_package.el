(require 'package)
(add-to-list 'package-archives
             '("stable-melpa" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(package-list-packages)

(defconst working-packages
  '(anzu
    sr-speedbar
    ecb
    company
    ; company-c-headers
    duplicate-thing
    ; ggtags
    indent-guide
    helm
    ; helm-gtags
    helm-projectile
    helm-swoop
    ;; LSP
    lsp-mode
    lsp-ui
    company-lsp
    cquery
    lsp-haskell
    ;google-c-style ;; Install google-c-style
    ;flycheck-google-cpplint
    ;; function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    yasnippet
    smartparens
    projectile
    volatile-highlights
    undo-tree
    zygospore
    ;; Haskell
    ;; haskel-mode
    ;flycheck-haskell
    ;ghc
    ;hindent
    ;company-ghc
    shm
    yaml-mode))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package working-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

