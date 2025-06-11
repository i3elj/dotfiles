;; inserts ç
;; (global-set-key (kbd "C-M-c") (lambda () (interactive) (insert-char #xE7)))

(define-key ctl-x-4-map (kbd "t") 'transpose-windows)
(define-key ctl-x-4-map (kbd "s") 'transpose-frame)

(global-set-key (kbd "M-p") (lambda () (interactive) (scroll-down-line 10)))
(global-set-key (kbd "M-n") (lambda () (interactive) (scroll-up-line 10)))
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-M-d") 'backward-kill-word)
(global-set-key (kbd "C-x t e") 'sr-speedbar-toggle)
(global-set-key (kbd "C-S-l") #'my/horizontal-recenter)
(global-set-key (kbd "C-x t l") 'org-todo-list)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(global-unset-key (kbd "C-z"))

(defun my/god-mode-or-exit()
  (interactive)
  (if (eq (god-local-mode) 0)
	  (god-local-mode 1)
	(keyboard-escape-quit)))

(global-set-key (kbd "C-g") #'my/god-mode-or-exit)
(global-set-key (kbd "<escape>") #'my/god-mode-or-exit)

(define-key god-local-mode-map (kbd "i") #'god-local-mode)
(define-key god-local-mode-map (kbd ".") #'repeat)
(define-key god-local-mode-map (kbd "<f11>") 'toggle-frame-fullscreen)

(define-key org-mode-map (kbd "C-c C-n") #'my/org-next-heading)
(define-key org-mode-map (kbd "C-c C-p") #'my/org-prev-heading)
