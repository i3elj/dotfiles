;; Code ;;
(add-hook 'prog-mode-hook (lambda () (adaptive-wrap-prefix-mode)))
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'hs-minor-mode)
(add-hook 'sql-mode-hook 'indent-tabs-mode)

;; org ;;
(add-hook 'org-mode-hook 'my/org-settings)

;;;;;; org headings toggleable by mouse
(defvar my/org-mouse-map (make-sparse-keymap))
(org-defkey my/org-mouse-map [mouse-1] 'org-cycle)
(add-hook 'org-mode-hook
	  (defun my/org-mouse-map-hook ()
		(font-lock-add-keywords
		 nil
		 `((,(rx (and bol (one-or-more "*") (one-or-more space) (group-n 1 (one-or-more any)) eol))
		(0 `(face nil keymap ,my/org-mouse-map mouse-face highlight) prepend)))
		 t)))

;; post before, after ;;
(add-hook 'post-command-hook #'my/god-mode-update-cursor-type)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; compilation ;;
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(add-hook 'compilation-mode-hook 'my/compilation-settings)

;; others ;;
(add-hook 'mmm-mode-hook (lambda () (set-face-background 'mmm-default-submode-face nil)))
(add-hook 'magit-mode-hook #'my/magit-settings)
