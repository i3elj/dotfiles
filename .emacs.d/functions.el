(unless (version< emacs-version "27")
  (use-package tab-line
	:ensure nil
	:hook (after-init . global-tab-line-mode)
	:config

	(defcustom tab-line-tab-min-width 10
	  "Minimum width of a tab in characters."
	  :type 'integer
	  :group 'tab-line)

	(defcustom tab-line-tab-max-width 30
	  "Maximum width of a tab in characters."
	  :type 'integer
	  :group 'tab-line)

	(setq tab-line-close-button-show t
		  tab-line-new-button-show nil
		  tab-line-separator ""
		  tab-line-tab-name-function #'my/tab-line-name-buffer
		  tab-line-right-button (propertize (if (char-displayable-p ?▶) " ▶ " " > ")
											'keymap tab-line-right-map
											'mouse-face 'tab-line-highlight
											'help-echo "Click to scroll right")
		  tab-line-left-button (propertize (if (char-displayable-p ?◀) " ◀ " " < ")
										   'keymap tab-line-left-map
										   'mouse-face 'tab-line-highlight
										   'help-echo "Click to scroll left")
		  tab-line-close-button (propertize (if (char-displayable-p ?×) " × " " x ")
											'keymap tab-line-tab-close-map
											'mouse-face 'tab-line-close-highlight
											'help-echo "Click to close tab"))

	(my/set-tab-theme)

	;;(dolist (mode '(ediff-mode process-menu-mode term-mode vterm-mode))
	;;(add-to-list 'tab-line-exclude-modes mode))
	(dolist (mode '(ediff-mode process-menu-mode))
	  (add-to-list 'tab-line-exclude-modes mode))))

(defun my/set-tab-theme ()
  (let ((bg (face-attribute 'mode-line :background))
		(fg (face-attribute 'default :foreground))
	(hg (face-attribute 'default :background))
		(base (face-attribute 'mode-line :background))
		(box-width (/ (line-pixel-height) 4)))
	(set-face-attribute 'tab-line nil
			:background base
			:foreground fg
			:height 0.8
			:inherit nil
			:box (list :line-width -1 :color base)
			)
	(set-face-attribute 'tab-line-tab nil
			:foreground fg
			:background bg
			:weight 'normal
			:inherit nil
			:box (list :line-width box-width :color bg))
	(set-face-attribute 'tab-line-tab-inactive nil
			:foreground fg
			:background base
			:weight 'normal
			:inherit nil
			:box (list :line-width box-width :color base))
	(set-face-attribute 'tab-line-highlight nil
			:foreground fg
			:background hg
			:weight 'normal
			:inherit nil
			:box (list :line-width box-width :color hg))
	(set-face-attribute 'tab-line-tab-current nil
			:foreground fg
			:background hg
			:weight 'normal
			:inherit nil
			:box (list :line-width box-width :color hg))))

(defun my/tab-line-name-buffer (buffer &rest _buffers)
  "Create name for tab with padding and truncation.

If buffer name is shorter than `tab-line-tab-max-width' it gets
centered with spaces, otherwise it is truncated, to preserve
equal width for all tabs.  This function also tries to fit as
many tabs in window as possible, so if there are no room for tabs
with maximum width, it calculates new width for each tab and
truncates text if needed.  Minimal width can be set with
`tab-line-tab-min-width' variable."
  (with-current-buffer buffer
	(let* ((window-width (window-width (get-buffer-window)))
		   (tab-amount (length (tab-line-tabs-window-buffers)))
		   (window-max-tab-width (if (>= (* (+ tab-line-tab-max-width 3) tab-amount) window-width)
									 (/ window-width tab-amount)
								   tab-line-tab-max-width))
		   (tab-width (- (cond ((> window-max-tab-width tab-line-tab-max-width)
								tab-line-tab-max-width)
							   ((< window-max-tab-width tab-line-tab-min-width)
								tab-line-tab-min-width)
							   (t window-max-tab-width))
						 3)) ;; compensation for ' x ' button
		   (buffer-name (string-trim (buffer-name)))
		   (name-width (length buffer-name)))
	  (if (>= name-width tab-width)
		  (concat  " " (truncate-string-to-width buffer-name (- tab-width 2)) "…")
		(let* ((padding (make-string (+ (/ (- tab-width name-width) 2) 1) ?\s))
			   (buffer-name (concat padding buffer-name)))
		  (concat buffer-name (make-string (- tab-width (length buffer-name)) ?\s)))))))

(defun tab-line-close-tab (&optional e)
  "Close the selected tab.

If tab is presented in another window, close the tab by using
`bury-buffer` function.  If tab is unique to all existing
windows, kill the buffer with `kill-buffer` function.  Lastly, if
no tabs left in the window, it is deleted with `delete-window`
function."
  (interactive "e")
  (let* ((posnp (event-start e))
		 (window (posn-window posnp))
		 (buffer (get-pos-property 1 'tab (car (posn-string posnp)))))
	(with-selected-window window
	  (let ((tab-list (tab-line-tabs-window-buffers))
			(buffer-list (flatten-list
						  (seq-reduce (lambda (list window)
										(select-window window t)
										(cons (tab-line-tabs-window-buffers) list))
									  (window-list) nil))))
		(select-window window)
		(if (> (seq-count (lambda (b) (eq b buffer)) buffer-list) 1)
			(progn
			  (if (eq buffer (current-buffer))
				  (bury-buffer)
				(set-window-prev-buffers window (assq-delete-all buffer (window-prev-buffers)))
				(set-window-next-buffers window (delq buffer (window-next-buffers))))
			  (unless (cdr tab-list)
				(ignore-errors (delete-window window))))
		  (and (kill-buffer buffer)
			   (unless (cdr tab-list)
				 (ignore-errors (delete-window window)))))))))

(defun transpose-windows ()
  "Transpose two windows.  If more or less than two windows are visible, error."
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
  ;; (face-remap-add-relative 'default '(:height 160 :family "Cascadia Code Light"))
  ;; (set-face-attribute 'org-document-title   nil :height 1.8)
  ;; (set-face-attribute 'org-level-1          nil :height 1.4)
  ;; (set-face-attribute 'org-level-2          nil :height 1.3)
  ;; (set-face-attribute 'org-level-3          nil :height 1.2)
  ;; (set-face-attribute 'org-level-4          nil :height 1.1)
  ;; (set-face-attribute 'org-verbatim         nil :family "Iosevka")
  ;; (set-face-attribute 'org-block            nil :family "Iosevka")
  ;; (set-face-attribute 'org-block-begin-line nil :family "Iosevka")
  ;; (set-face-attribute 'org-table            nil :family "Iosevka")
  (org-indent-mode)
  (org-modern-mode)
  (visual-line-mode)
  (setq org-hide-emphasis-markers t)
  (setq display-line-numbers nil)
  (setq word-wrap 1)
  (setq line-spacing 2)
  (olivetti-mode)
  (setq olivetti-body-width 80)
  (setq olivetti-set-width 80)
  (pixel-scroll-precision-mode)
  (flyspell-mode)
  (setq ispell-dictionary "pt_BR"))

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
