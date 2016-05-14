;; keybind
;; s- whitespace
;; C- ` - o q z = -

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
(bind-key* "s-f" 'auto-fill-mode)
(bind-key* "C-x m" 'kmacro-end-and-call-macro)
(bind-key* "C-x C-n" 'linum-mode)
(bind-key* "M-q" 'quoted-insert)
(bind-key* "M-k" 'kill-whole-line)
(bind-key* "M-t" 'transpose-chars)
(bind-key* "C-x C-t" 'transpose-lines)
(bind-key* "C-." 'pop-tag-mark)
(bind-key* "M-." 'find-tag)
(bind-key* "C-M-." 'helm-etags-select)
(bind-key* "M-w" 'easy-kill)
(bind-key* "C-x C-d" 'dired-jump)
(bind-key* "M-/" 'hippie-expand)
(bind-key* "s-r" 'revert-buffer)
(bind-key* "s-e" 'eval-buffer)
(bind-key* "M-0" 'suspend-frame)
;;(bind-key* "C-z" 'mode-specific-command-prefix)
(global-unset-key (kbd "C-z"))
;;(bind-key* "C-q" 'back-to-indentation)
;; (bind-key* "C-c C-f" 'fci-mode)
;; (bind-key* "M-n" (lambda () (interactive) (scroll-up 1)))
;; (bind-key* "M-p" (lambda () (interactive) (scroll-down 1)))

(bind-key "C-j" 'smart-newline)
(bind-keys :map isearch-mode-map
           ("C-h" . isearch-del-char))

;; helm
(bind-key* "M-x" 'helm-M-x)
(bind-key* "C-x f" 'helm-mini)
(bind-key* "C-c f" 'helm-find-files)
(bind-key* "C-c C-f" 'helm-ls-git-ls)
(bind-key* "M-y"     'helm-show-kill-ring)
(bind-key* "C-c i"   'helm-imenu)
(bind-key* "C-c a" 'helm-ag)
(bind-key* "M-o" 'helm-swoop)
(bind-key* "C-M-o" 'helm-multi-swoop-all)
(bind-key* "C-c C-a" 'helm-projectile-ag)
(bind-keys :map helm-find-files-map
           ("TAB" . helm-execute-persistent-action))
(bind-keys :map helm-read-file-map
           ("TAB" . helm-execute-persistent-action))
;;(define-key helm-map (kbd "C-h") 'delete-backward-char)
;;(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; bm
(bind-key* "C-0" 'bm-toggle)
(bind-key* "C-M-0" 'bm-next)
(bind-key* "C-)" 'bm-previous)
(bind-key* "C-M-)" 'bm-remove-all-current-buffer)

;; yasnippet
(global-unset-key (kbd "C-x i"))
(bind-key* "C-x i i" 'yas-insert-snippet)
(bind-key* "C-x i n" 'yas-new-snippet)
(bind-key* "C-x i e" 'yas-visit-snippet-file)
(bind-keys :map yas-minor-mode-map
           ("TAB" . nil)
           ("<tab>" . nil)
           ("C-9" . yas-expand-from-trigger-key))

;; multi-cursor
(bind-key* "C-|" 'mc/edit-lines) ;;リージョン全てにカーソルおく
(global-unset-key "\C-\\")
(smartrep-define-key global-map "C-\\"
  '(("C-\\"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))

;; ohter
(bind-key* "C-c d" 'ag-dired)
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
(bind-key* "C-:" 'avy-goto-char)
(bind-key* "C-;" 'avy-goto-char-2)
(bind-key* "C-'" 'avy-goto-line)
(bind-key* "C-\"" 'goto-line)
(bind-key* "C-x C-z" 'open-dropbox-junk)
(bind-key* "C-x C-a" 'open-0sec-memo)
(bind-key* "M-z" 'zop-to-char)

(bind-keys :map ac-menu-map
           ("C-n" . ac-next)
           ("C-p" . ac-previous))
(bind-keys :map web-mode-map
           ("C-c u" . web-mode-fold-or-unfold))
(bind-keys :map ac-completing-map
           ("M-/" . ac-stop))
(bind-keys :map emacs-lisp-mode-map
           ("C-c C-d" . lispxmp))
(ac-set-trigger-key "<backtab>")

;; 自作関数
(bind-key* "M-," 'full-screen)
(bind-key* "C-t" 'make-window-when-unsplit)
(bind-key* "C-," 'kill-line-backward)
(bind-key* "C-M-k" 'kill-all-line-forward)
(bind-key* "C-M-," 'kill-all-line-backward)
(bind-key* "M-m" 'start-and-end-macro)
(bind-key* "s-k" 'kill-*-buffer)
(bind-key* "C-x a k" 'kill-all-buffer)
(bind-key* "s-z" 'split-window-3)
(bind-key* "C-a" 'goto-line-beginning-or-indent)
