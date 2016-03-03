;; keybind
(global-set-key (kbd "C-j") 'smart-newline)

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
;; (bind-key* "C-c C-f" 'fci-mode)
(bind-key* "s-f" 'auto-fill-mode)
(bind-key* "C-x m" 'kmacro-end-and-call-macro)
(bind-key* "C-x C-n" 'linum-mode)
;;(bind-key* "C-q" 'back-to-indentation)
(bind-key* "M-q" 'quoted-insert)
(bind-key* "M-k" 'kill-whole-line)
(bind-key* "M-t" 'transpose-chars)
(bind-key* "C-x C-t" 'transpose-lines)
(bind-key* "C-." 'pop-tag-mark)
;;(bind-key* "M-." 'find-tag)
(bind-key* "M-." 'helm-etags-select)
(bind-key* "M-w" 'easy-kill)
(bind-key* "C-x C-d" 'dired-jump)
(bind-key* "M-/" 'hippie-expand)
;;s- whitespace
;; C-` C-- C-\

;; よく使うminormode
(bind-key* "M-x" 'helm-M-x)
(bind-key* "C-x f" 'helm-mini)
(bind-key* "C-c f" 'helm-find-files)
(bind-key* "C-c C-f" 'helm-ls-git-ls)
(bind-key* "M-y"     'helm-show-kill-ring)
(bind-key* "C-c i"   'helm-imenu)
(bind-key* "C-c a" 'helm-ag)
(bind-key* "C-c d" 'ag-dired)
(bind-key* "M-o" 'helm-swoop)
(bind-key* "C-c r" 'anzu-query-replace-regexp)
(bind-key* "C-c C-r" 'anzu-query-replace-at-cursor-thing)
(bind-key* "C-]" 'er/expand-region)
(bind-key* "C-}" 'er/contract-region)
(bind-key* "C-M-8" 'highlight-symbol-at-point)
(bind-key* "C-M-*" 'highlight-symbol-remove-all)
(bind-key* "C-<tab>" 'tabbar-forward)
(bind-key* "C-S-<tab>" 'tabbar-backward)
(bind-key* "M-{" 'goto-last-change)
(bind-key* "M-}" 'goto-last-change-reverse)
(bind-key* "M-[" 'point-undo)
(bind-key* "M-]" 'point-redo)
(bind-key* "C-x c" 'smarter-compile)
(global-unset-key (kbd "C-x i"))
(bind-key* "C-x i i" 'yas-insert-snippet)
(bind-key* "C-x i n" 'yas-new-snippet)
(bind-key* "C-x i e" 'yas-visit-snippet-file)
(bind-key* "C-:" 'avy-goto-char)
(bind-key* "C-;" 'avy-goto-char-2)
(bind-key* "C-'" 'avy-goto-line)
(bind-key* "C-\"" 'goto-line)
(bind-key* "C-x C-z" 'open-dropbox-junk)
(bind-key* "C-x C-a" 'open-0sec-memo)
(bind-key* "C-c C-a" 'helm-projectile-grep)
(bind-key* "M-z" 'zop-to-char)

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
(bind-key* "s-z" '(lambda ()
                                 (interactive)
                                 (split-window-horizontally-n 3)))
(bind-key* "C-a" 'my-goto-line-beginning-or-indent)
