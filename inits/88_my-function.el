(defun goto-line-beginning-or-indent (&optional $position)
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
        (move-beginning-of-line 1))))

(defun full-screen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun make-window-when-unsplit ()
  (interactive)
  (when (one-window-p)
    (split-window-right))
  (other-window 1))

(defun kill-line-backward (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun kill-all-line-forward (arg)
  (interactive "p")
  (save-excursion
    (forward-page)
    (setq end-number (point)))
  (kill-line (- (- end-number (line-number-at-pos)) arg)))

(defun kill-all-line-backward (arg)
  (interactive "p")
  (kill-line (- (* -1 (line-number-at-pos)) arg)))

(defun start-and-end-macro (arg)
  (interactive "p")
  (if (or defining-kbd-macro executing-kbd-macro)
      (kmacro-end-macro arg)
    (kmacro-start-macro arg)))

(defun kill-*-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (string-match "\\`\\*\\(.\\|\n\\)+\\*\\'" (buffer-name buf))
        (if (not (string= (buffer-name buf) "*scratch*"))
            (kill-buffer (buffer-name buf))))))

(defun kill-all-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (not
         (or
          (string= (buffer-name buf) (buffer-name (current-buffer)))
          (string= (buffer-name buf) "*scratch*")))
        (kill-buffer (buffer-name buf)))))

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
      (Split-window-horizontally-n (- num_wins 1)))))

(defun add-file-name-to-kill-ring-and-yank (arg)
  (interactive "p")
  (if (equal arg 4)
      (kill-new buffer-file-name)
    (kill-new (file-name-nondirectory buffer-file-name)))
  (yank))

(defun insert-file-name (arg)
  (interactive "p")
  (if (equal arg 4)
      (insert buffer-file-name)
    (insert (file-name-nondirectory buffer-file-name))))

(defun split-window-3 ()
  (interactive)
  (split-window-horizontally-n 3))

(defun custom-transpose-char ()
  (interactive)
  (let ((tmp-char (char-to-string (following-char))))
    (save-excursion
      (forward-char 2)
      (insert tmp-char)
      (forward-char -3)
      (delete-char 1))))

(defun kill-region-or-word (kill-region &rest args)
  (cond ((and (called-interactively-p 'interactive) transient-mark-mode (not mark-active))
         ;;(backward-word 1)
         ;;(kill-word 1)
         ;;(er/expand-region 1)
         ;;(apply kill-region args)
         (kill-symbol))
        (t
         (apply kill-region args))))
(advice-add 'kill-region :around 'kill-region-or-word)

(defun replace-symbol-from-kill-ring ()
  (interactive)
  (kill-symbol)
  ;;(let ((copied (cadr kill-ring)))
  ;;    (kill-new copied)
  (insert (cadr kill-ring)))

(defun replace-backward-from-kill-ring ()
  (interactive)
  (kill-line-backward 1)
  (insert (cadr kill-ring)))

(defun replace-forward-from-kill-ring ()
  (interactive)
  (kill-line)
  (insert (cadr kill-ring)))
