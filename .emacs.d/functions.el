(defun my/god-mode-or-exit()
  (interactive)
  (unless (god-local-mode)
	(god-local-mode 1))
  (keyboard-quit))

(defun transpose-windows ()
  "Transpose two windows. If more or less than two windows are visible, error."
  (interactive)
  (unless (= 2 (count-windows))
	(error "There are not 2 windows."))
  (let* ((windows (window-list))
		 (w1 (car windows))
		 (w2 (nth 1 windows))
		 (w1b (window-buffer w1))
		 (w2b (window-buffer w2)))
	(set-window-buffer w1 w2b)
	(set-window-buffer w2 w1b)))

(defun my/mode-header-line ()
  (interactive)
  ;; (setq mode-line-format "")
  (setq header-line-format mode-line-format))

(defun my/horizontal-recenter ()
  "make the point horizontally centered in the window"
  (interactive)
  (let ((mid (/ (window-width) 2))
		(line-len (save-excursion (end-of-line) (current-column)))
		(cur (current-column)))
	(if (< mid cur)
		(set-window-hscroll (selected-window)
							(- cur mid)))))

(defun my/god-mode-update-cursor-type ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(defun my/to-god-mode-or-keyboard-quit ()
  (interactive)
  (if god-local-mode
	  (keyboard-quit)
	(god-local-mode 1)))

(defun my/pixel-scroll-down ()
  (interactive)
  (pixel-scroll-precision-interpolate (- (/ (window-text-height nil t) 2))
									  nil 1))

(defun my/pixel-scroll-up ()
  (interactive)
  (pixel-scroll-precision-interpolate (/ (window-text-height nil t) 2)
									  nil 1))

(defun my/forward-page ()
  (interactive)
  (forward-page)
  (recenter-top-bottom 0))

(defun my/backward-page ()
  (interactive)
  (backward-page)
  (recenter-top-bottom 0))

(defun my/olivetti-settings ()
  (interactive)
  (setq olivetti-body-width 90)
  (setq olivetti-set-width 90)
  (setq olivetti-recall-visual-line-mode-entry-state t)
  (setq olivetti-style 'fancy)
  (setq truncate-lines t)
  (olivetti-mode)
  (cua-mode)
  (pixel-scroll-precision-mode))

(defun my/magit-settings ()
  (interactive)
  (setq display-line-numbers nil))

(defun my/compilation-settings ()
  (interactive)
  (setq display-line-numbers nil)
  (visual-line-mode))

(defun my/org-settings ()
  (olivetti-mode)
  (olivetti-set-width 86)
  (set-fringe-mode 0)
  ;; (org-indent-mode)
  (org-modern-mode)
  (visual-line-mode)
  (setq org-hide-emphasis-markers t)
  (setq display-line-numbers nil)
  (setq word-wrap 1)

  ;; Set header font sizes
  (set-face-attribute 'org-level-1 nil :height 1.5)
  (set-face-attribute 'org-level-2 nil :height 1.4)
  (set-face-attribute 'org-level-3 nil :height 1.3)
  (set-face-attribute 'org-level-4 nil :height 1.2)
  (set-face-attribute 'org-level-5 nil :height 1.1)
  (set-face-attribute 'org-level-6 nil :height 1.0)

  ;; Set non-monospaced font for this buffer only
  (buffer-face-set '(:family "Serif"))

  ;; Set monospaced font for code-related elements
  (set-face-attribute 'org-code				nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'org-verbatim			nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'org-block			nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'org-block-begin-line nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'org-block-end-line	nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'org-meta-line		nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'org-table			nil :family "Monospace" :inherit 'fixed-pitch)
  (set-face-attribute 'fixed-pitch			nil :family "Monospace"))

(defun my/org-next-heading ()
  (interactive)
  (outline-next-visible-heading 1)
  (recenter-top-bottom 3))

(defun my/org-prev-heading ()
  (interactive)
  (outline-next-visible-heading -1)
  (recenter-top-bottom 3))

;; (let ((key (read-key "hi")))
;;   (message "%s" (single-key-description key)))

;; (defun my-check-last-key ()
;;   "Check if the last key pressed was 'a', 'b', or 'c' and display a message."
;;   (interactive)
;;   (let ((last-key (aref (this-command-keys) (1- (length (this-command-keys))))))
;;     (cond
;;      ((eq last-key ?a) (message "You pressed 'a'"))
;;      ((eq last-key ?b) (message "You pressed 'b'"))
;;      ((eq last-key ?c) (message "You pressed 'c"))
;;      (t (message "Key pressed was not 'a', 'b', or 'c'")))))

;; (defun my/check-typed-char (&rest _args)
;;   "Check and display each character as it is typed."
;;   (let ((last-char last-command-event))
;;     (if (and (>= last-char 97) (<= last-char 127))
;;         (message "%d" last-char))))

;; (advice-add 'self-insert-command :after #'my-check-typed-char)
