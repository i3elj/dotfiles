;; repositories
(use-package quelpa-use-package :ensure t)

;; org
(use-package org-modern :ensure t)

;; languages
(use-package web-mode
  :ensure t
  :hook (web-mode . emmet-mode))

(use-package adaptive-wrap
  :ensure t
  :init (setq adaptive-wrap-extra-indent 4))

(use-package transpose-frame :ensure t)

(use-package god-mode :ensure t)

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t))

(use-package vertico-posframe
  :ensure t
  :init (vertico-posframe-mode))

(use-package windmove
  :ensure nil
  :bind*
  (("C-M-b" . windmove-left)
   ("C-M-f" . windmove-right)
   ("C-M-p" . windmove-up)
   ("C-M-n" . windmove-down)))


(use-package emmet-mode :ensure t)

(use-package magit
  :ensure t
  ;; :init (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  )

(use-package dtrt-indent :ensure t)

;; completion
(use-package consult :ensure t)

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless flex)))

(use-package company
  :ensure t
  :config
  (add-to-list 'company-backends 'company-files))

;; beautifiers
(use-package minions :ensure t :hook (prog-mode . minions-mode))
(use-package tab-bar-echo-area :ensure :config (tab-bar-echo-area-mode 1))

;; language servers
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
			   '(web-mode . ("phpactor" "language-server"))))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l"
		read-process-output-max (* 1024 1024)
		lsp-idle-delay 0.1
		lsp-enable-code-actions nil)
  :hook ((web-mode . lsp-deferred)
		 (typescript-mode . lsp-deferred))
  :commands lsp lsp-deferred)

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-peek-always-show t))


(use-package flycheck :ensure t)
