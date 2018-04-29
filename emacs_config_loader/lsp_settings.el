;;; LSP settings mode

(require 'lsp-mode)


;; ;; LSP UI settings

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-lsp)
(push 'company-lsp company-backends)

;; ;; ==========================================================================
;; ;; C/C++
;; ;; Arch Linux aur/cquery-git aur/cquery
(require 'cquery)
(setq cquery-executable "/usr/bin/cquery")

;; ;; Log file
(setq cquery-extra-args '("--log-file=/tmp/cq.log"))
;; ;; Cache directory, both relative and absolute paths are supported
(setq cquery-cache-dir ".cquery_cached_index")
;; ;; Initialization options
;; (setq cquery-extra-init-params '(:cacheFormat "msgpack"))
(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack" :completion (:detailedLabel t)))

;(setq cquery-sem-highlight-method 'font-lock)
;; alternatively
;; (setq cquery-sem-highlight-method 'overlay)

;; For rainbow semantic highlighting
(cquery-use-default-rainbow-sem-highlight)

(add-hook 'c-mode-common-hook
          (lambda ()
            (lsp-cquery-enable)
            (with-eval-after-load 'projectile
              (setq projectile-project-root-files-top-down-recurring
                    (append '("compile_commands.json"
                              ".cquery")
                            projectile-project-root-files-top-down-recurring)))
            (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
            ;; (define-key evil-normal-state-map (kbd "C-p") 'lsp-ui-peek-jump-forward)
            ;; (define-key evil-normal-state-map (kbd "C-t") 'lsp-ui-peek-jump-backward)

            ;; (lsp-ui-peek-find-workspace-symbol "pattern 0")
            ;; (cquery-xref-find-custom "$cquery/base")
            ;; (cquery-xref-find-custom "$cquery/callers")
            ;; (cquery-xref-find-custom "$cquery/derived")
            ;; (cquery-xref-find-custom "$cquery/vars")

            ;; Alternatively, use lsp-ui-peek interface
            (lsp-ui-peek-find-custom 'base "$cquery/base")
            (lsp-ui-peek-find-custom 'callers "$cquery/callers")
            (lsp-ui-peek-find-custom 'random "$cquery/random") ;; jump to a random declaration
            ))
;; Also see lsp-project-whitelist lsp-project-blacklist cquery-root-matchers


;; ;; Haskell
(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp-haskell-enable)
(add-hook 'haskell-mode-hook 'flycheck-mode)
