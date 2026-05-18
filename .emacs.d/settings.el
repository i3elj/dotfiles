;;;;; emacs modes ;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-notify-method 'pushy)
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(completion-cycle-threshold 3)
 '(confirm-kill-emacs nil)
 '(dired-dwin-target t)
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-aBhl  --group-directories-first")
 '(display-battery-mode nil)
 '(display-line-numbers nil)
 '(display-time-mode nil)
 '(dtrt-indent-global-mode nil)
 '(fill-column 100)
 '(fringe-mode 0 nil (fringe))
 '(global-visual-line-mode t)
 '(go-ts-mode-indent-offset 4)
 '(hscroll-step 0)
 '(ido-mode nil nil (ido))
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice 'other-buffer)
 '(lsp-ui-doc-delay 1.0)
 '(lsp-ui-doc-position 'at-point)
 '(lsp-ui-doc-show-with-cursor t)
 '(menu-bar-mode nil)
 '(mouse-drag-and-drop-region t)
 '(org-agenda-files '("~/code/quem-faz-app/todo.org"))
 '(org-file-apps
   '((auto-mode . emacs) (directory . emacs) ("\\.mm\\'" . default) ("\\.x?html?\\'" . default)
	 ("\\.pdf\\'" . default) ("\\.ods\\'" . "xdg-open %s")))
 '(org-fontify-quote-and-verse-blocks t)
 '(org-format-latex-options '(:scale 1.5))
 '(org-hide-leading-stars t)
 '(org-html-checkbox-type 'html)
 '(org-image-actual-width (list 550))
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame) (vm-imap . vm-visit-imap-folder-other-frame)
	 (gnus . org-gnus-no-new-news) (file . find-file) (wl . wl-other-frame)))
 '(org-modern-fold-stars
   '(("◉" . "◉") ("○" . "○") ("◈" . "◈") ("◇" . "◇") ("✳" . "✳")))
 '(org-modern-replace-stars "◉○◈◇✳")
 '(org-startup-folded t)
 '(package-selected-packages
   '(adaptive-wrap company consult corfu doom-themes dtrt-indent emmet-mode flycheck god-mode ls-pui
				   lsp-mode lsp-ui magit minions olivetti orderless org-modern quelpa-use-package
				   tab-bar-echo-area transpose-frame typescript-mode vertico-posframe web-mode
				   yasnippets))
 '(pixel-scroll-precision-interpolate-page nil)
 '(pixel-scroll-precision-interpolation-total-time 0.2)
 '(pixel-scroll-precision-mode nil)
 '(repeat-mode t)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1000)
 '(scroll-step 10)
 '(speedbar-use-images nil)
 '(split-height-threshold 80)
 '(split-width-threshold 120)
 '(tab-bar-show nil)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(treesit-font-lock-level 4)
 '(vertico-mode t)
 '(visible-bell nil)
 '(whitespace-style '(trailing tabs indentation tab-mark)))

(set-frame-parameter nil 'internal-border-width 0)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
