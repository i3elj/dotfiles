;; Code ;;
(add-hook 'prog-mode-hook #'my/olivetti-settings)
(add-hook 'prog-mode-hook (lambda ()
							(adaptive-wrap-prefix-mode)))
(add-hook 'prog-mode-hook (lambda () (cua-mode)))
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'hs-minor-mode)
(add-hook 'sql-mode-hook 'indent-tabs-mode)
(add-hook 'elixir-ts-mode-hook
		  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
(add-hook 'heex-ts-mode-hook
		  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; org ;;
(add-hook 'org-mode-hook 'my/org-settings)

;; dired ;;
(add-hook 'dired-mode-hook
		  (lambda ()
			;; (dired-hide-details-mode 1)
			(nerd-icons-dired-mode)
			(setq display-line-numbers nil)))

;; post before, after ;;
(add-hook 'post-command-hook #'my/god-mode-update-cursor-type)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; compilation ;;
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(add-hook 'compilation-mode-hook 'my/compilation-settings)

;; others ;;
(add-hook 'mmm-mode-hook (lambda () (set-face-background 'mmm-default-submode-face nil)))
(add-hook 'magit-mode-hook #'my/magit-settings)
