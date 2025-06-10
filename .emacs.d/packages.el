;; repositories
(use-package quelpa-use-package :ensure t)

;; org
(use-package page-break-lines :ensure t)
(use-package org-modern :ensure t)

;; languages
(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook
  (go-mode . eglot-ensure)
  (go-mode . company-mode)
  :init
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package web-mode
  :ensure t
  :mode "\\.php\\'")

(use-package adaptive-wrap
  :ensure t
  :init (setq adaptive-wrap-extra-indent 4))

(use-package transpose-frame :ensure t)

(use-package god-mode :ensure t)

(use-package olivetti :ensure t)

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t))

(use-package vertico-posframe
  :ensure t
  :init (vertico-posframe-mode))

(use-package which-key :ensure t)

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

(use-package company :ensure t)

;; beautifiers
(use-package minions :ensure t :hook (prog-mode . minions-mode))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures
   'prog-mode
   '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
	 ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
	 "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
	 "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
	 "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
	 "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
	 "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
	 "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
	 ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
	 "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
	 "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
	 "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
	 "\\\\" "://")))

;; language servers
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
			   '(web-mode . ("intelephense" "--stdio"))))

(use-package flycheck :ensure t)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-s-l")
  :config
  (lsp-enable-which-key-integration t)
  :custom
  (lsp-enable-snippet t)
  (lsp-keep-workspace-alive nil)
  (lsp-enable-xref t)
  (lsp-enable-imenu t)
  (lsp-enable-completion-at-point t)
  (lsp-completion-provider :none)
  (lsp-completion-show-detail t)
  (lsp-file-watch-threshold 5000)
  (lsp-eldoc-render-all nil)
  (lsp-headerline-breadcrumb-enable nil)
  :bind (:map lsp-mode-map ("C-<down-mouse-3>" . xref-go-back)))
