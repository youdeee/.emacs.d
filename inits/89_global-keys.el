;;keybind
(global-set-key (kbd "H-i") 'indent-for-tab-command)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "s-&") 'kill-buffer)
(global-set-key (kbd "C-S-v") 'scroll-down-command)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-x 5 o") 'transpose-words)
(global-set-key (kbd "C-x t") 'other-frame)
(global-set-key (kbd "s-u") 'browse-url-of-file)
(global-set-key (kbd "M-SPC") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c C-f") 'fci-mode)
(global-set-key (kbd "s-f") 'auto-fill-mode)
;;(global-set-key (kbd "s-k") 'kill-this-buffer)
(global-set-key (kbd "C-x m") 'kmacro-end-and-call-macro)
(global-set-key (kbd "C-x C-n") 'linum-mode)
(global-set-key (kbd "C-q") 'back-to-indentation)
(global-set-key (kbd "M-q") 'quoted-insert)
(global-set-key (kbd "M-k") 'kill-whole-line)
(global-set-key (kbd "M-t") 'transpose-lines)
(global-set-key (kbd "C-x C-t") 'transpose-chars)
;;(global-set-key (kbd "C-@") 'indent-region)
;;s-f findfile
;;s- whitespace
;; C-. C-; C-' C-= C-` C-u C-- C-[ C-]
;;C-\調べる

(defun make-window-when-unsplit ()
  (interactive)
  (if (one-window-p)
      (split-window-right)
    (other-window 1)
    ))
(global-set-key (kbd "C-t") 'make-window-when-unsplit)

(defun kill-line-backward (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-,") 'kill-line-backward)

(defun kill-all-line-forward (arg)
  (interactive "p")
  (save-excursion
    (forward-page)
    (setq end-number (point)))
  (kill-line (- (- end-number (line-number-at-pos)) arg)))
(global-set-key (kbd "C-M-k") 'kill-all-line-forward)

(defun kill-all-line-backward (arg)
  (interactive "p")
  (kill-line (- (* -1 (line-number-at-pos)) arg)))
(global-set-key (kbd "C-M-,") 'kill-all-line-backward)

(defun start-and-end-macro (arg)
  (interactive "p")
 (if (or defining-kbd-macro executing-kbd-macro)
     (kmacro-end-macro arg)
   (kmacro-start-macro arg)))
(global-set-key (kbd "M-m") 'start-and-end-macro)

(defun kill-*-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (string-match "\\`\\*\\(.\\|\n\\)+\\*\\'" (buffer-name buf))
	(if (not (string= (buffer-name buf) "*scratch*"))
	    (kill-buffer (buffer-name buf))))))
(global-set-key (kbd "s-k") 'kill-*-buffer)

(defun kill-all-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (not
	 (or
	  (string= (buffer-name buf) (buffer-name (current-buffer)))
	  (string= (buffer-name buf) "*scratch*")))
	(kill-buffer (buffer-name buf)))))
(global-set-key (kbd "C-x a k") 'kill-all-buffer)

(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))
(global-set-key (kbd "C-x @") '(lambda ()
                           (interactive)
                           (split-window-vertically-n 3)))
(global-set-key (kbd "C-x #") '(lambda ()
                           (interactive)
                           (split-window-horizontally-n 3)))

