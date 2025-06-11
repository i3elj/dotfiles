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
 '(custom-safe-themes
   '("d46d30357ff92894b1f16b4d1219421bcc028aa3bd3def87ec031dcdb149506d" default))
 '(dired-dwin-target t)
 '(dired-kill-when-opening-new-dired-buffer t)
 '(dired-listing-switches "-aBhl  --group-directories-first")
 '(display-battery-mode nil)
 '(display-line-numbers nil)
 '(display-time-mode nil)
 '(dtrt-indent-global-mode nil)
 '(fill-column 80)
 '(global-visual-line-mode t)
 '(go-ts-mode-indent-offset 4)
 '(hscroll-step 0)
 '(ido-mode nil nil (ido))
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice 'other-buffer)
 '(line-spacing 6)
 '(menu-bar-mode nil)
 '(mouse-drag-and-drop-region t)
 '(org-agenda-files
   '("~/Projects/tusk/README.org" "/home/bn/Documents/Journal/Notes.org"
	 "/home/bn/Documents/Journal/Agenda.org"))
 '(org-fontify-quote-and-verse-blocks t)
 '(org-format-latex-options '(:scale 1.5))
 '(org-hide-leading-stars t)
 '(org-html-checkbox-type 'html)
 '(org-image-actual-width (list 550))
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
	 (vm-imap . vm-visit-imap-folder-other-frame) (gnus . org-gnus-no-new-news)
	 (file . find-file) (wl . wl-other-frame)))
 '(org-modern-fold-stars
   '(("◉" . "◉") ("○" . "○") ("◈" . "◈") ("◇" . "◇") ("✳" . "✳")))
 '(org-modern-replace-stars "◉○◈◇✳")
 '(org-startup-folded t)
 '(package-selected-packages nil)
 '(pixel-scroll-precision-interpolate-page nil)
 '(pixel-scroll-precision-interpolation-total-time 0.2)
 '(pixel-scroll-precision-mode nil)
 '(repeat-mode t)
 '(scroll-bar-mode t)
 '(scroll-conservatively 1000)
 '(scroll-step 10)
 '(speedbar-use-images nil)
 '(split-height-threshold 80)
 '(split-width-threshold 120)
 '(tab-width 4)
 '(tab-bar-show nil)
 '(tool-bar-mode nil)
 '(treesit-font-lock-level 4)
 '(truncate-lines t nil nil "Customized with use-package olivetti")
 '(vertico-mode t)
 '(visible-bell 1)
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
