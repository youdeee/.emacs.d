;;keybind

(global-set-key (kbd "C-j") 'smart-newline)

;;(global-set-key "H-i" 'indent-for-tab-command)
(bind-key* "C-h" 'delete-backward-char)
(bind-key* "C-x k" 'kill-this-buffer)
(bind-key* "s-&" 'kill-buffer)
(bind-key* "C-S-v" 'scroll-down-command)
(bind-key* "M-p" 'backward-paragraph)
(bind-key* "M-n" 'forward-paragraph)
(bind-key* "M-h" 'backward-kill-word)
(bind-key* "C-x 5 o" 'transpose-words)
(bind-key* "C-x t" 'other-frame)
(bind-key* "s-u" 'browse-url)
(bind-key* "M-SPC" 'delete-trailing-whitespace)
(bind-key* "C-c C-f" 'fci-mode)
(bind-key* "s-f" 'auto-fill-mode)
(bind-key* "C-x m" 'kmacro-end-and-call-macro)
(bind-key* "C-x C-n" 'linum-mode)
(bind-key* "C-q" 'back-to-indentation)
(bind-key* "M-q" 'quoted-insert)
(bind-key* "M-k" 'kill-whole-line)
(bind-key* "M-t" 'transpose-chars)
(bind-key* "C-x C-t" 'transpose-lines)
(bind-key* "C-." 'pop-tag-mark)
(bind-key* "M-." 'find-tag)
;;s- whitespace
;; C-= C-` C--  C-]
;;C-\調べる

;; よく使うminormode
(bind-key* "M-x" 'helm-M-x)
(bind-key* "C-x f" 'helm-mini)
(bind-key* "C-c f" 'helm-find-files)
(bind-key* "M-y"     'helm-show-kill-ring)
(bind-key* "C-c i"   'helm-imenu)
(bind-key* "C-c a" 'helm-ag)
(bind-key* "C-c d" 'ag-dired)
(bind-key* "M-o" 'helm-swoop)
(bind-key* "C-c r" 'anzu-query-replace-regexp)
(bind-key* "C-c C-r" 'anzu-query-replace-at-cursor-thing)
(bind-key* "C-'" 'er/expand-region)
(bind-key* "C-\"" 'er/contract-region)
(bind-key* "C-M-8" 'highlight-symbol-at-point)
(bind-key* "C-M-*" 'highlight-symbol-remove-all)
(bind-key* "C-<tab>" 'tabbar-forward)
(bind-key* "C-S-<tab>" 'tabbar-backward)
(bind-key* "M-{" 'goto-last-change)
(bind-key* "M-}" 'goto-last-change-reverse)
(bind-key* "M-[" 'point-undo)
(bind-key* "M-]" 'point-redo)
(bind-key* "C-x c" 'smarter-compile)
;;(bind-key* "C-x C-x" (kbd "C-x c C-m"))
(global-unset-key (kbd "C-x i"))
(bind-key* "C-x i i" 'yas-insert-snippet)
(bind-key* "C-x i n" 'yas-new-snippet)
(bind-key* "C-x i e" 'yas-visit-snippet-file)
(bind-key* "C-:" 'avy-goto-char)
(bind-key* "C-;" 'avy-goto-char-2)
(bind-key* "M-g M-g" 'avy-goto-line)
(bind-key* "C-x C-z" 'open-junk-file)

;; 自作関数
(bind-key* "M-," 'full-screen)
(bind-key* "C-t" 'make-window-when-unsplit)
(bind-key* "C-," 'kill-line-backward)
(bind-key* "C-M-k" 'kill-all-line-forward)
(bind-key* "C-M-," 'kill-all-line-backward)
(bind-key* "M-m" 'start-and-end-macro)
(bind-key* "s-k" 'kill-*-buffer)
(bind-key* "C-x a k" 'kill-all-buffer)
(bind-key* "C-x @" '(lambda ()
                                 (interactive)
                                 (split-window-vertically-n 3)))
(bind-key* "C-x #" '(lambda ()
                                 (interactive)
                                 (split-window-horizontally-n 3)))


(defun full-screen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized)
  )

(defun make-window-when-unsplit ()
  (interactive)
  (if (one-window-p)
      (split-window-right)
    (other-window 1)
    ))

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
      (split-window-horizontally-n (- num_wins 1)))))
