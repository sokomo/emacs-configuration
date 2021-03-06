(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

;(windmove-default-keybindings)

; company
(require 'company)
;(eval-after-load 'company
;  '(add-to-list 'company-backends 'company-irony))

(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)
;(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)

