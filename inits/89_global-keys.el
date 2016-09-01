;; 残り
;; s- whitespace
;; C- ` - = - 5~9
;; C-x x
;; M- 2~9 z xw s g | ' " / ? - + _ ^ & * ( )

;; 便利
;; M系
;; j コメント付き改行
;; \ 空白削除
;; C系
;; C-M系
;; i インデント削除


(bind-key* "C-h" 'delete-backward-char)
(bind-key* "C-x k" 'kill-this-buffer)
(bind-key "s-&" 'kill-buffer)
(bind-key* "C-S-v" 'scroll-down-command)
(bind-key "M-h" 'backward-kill-word)
(bind-key "C-x 5 o" 'transpose-words)
(bind-key "C-x t" 'other-frame)
(bind-key "s-u" 'browse-url)
(bind-key "M-SPC" 'delete-trailing-whitespace)
;;(bind-key "s-f" 'auto-fill-mode)
(bind-key "s-f" 'toggle-truncate-lines)
(bind-key "C-x m" 'kmacro-end-and-call-macro)
(bind-key "C-x C-n" 'linum-mode)
(bind-key "M-q" 'quoted-insert)
(bind-key "M-k" 'kill-whole-line)
(bind-key "M-t" 'transpose-chars)
(bind-key "C-x C-t" 'transpose-lines)
(bind-key "C-x d" 'dired-jump)
(bind-key "s-r" 'revert-buffer)
(bind-key "s-e" 'eval-buffer)
(bind-key "C-M-i" 'delete-indentation)
(global-unset-key (kbd "C-o"))
(bind-key "C-o" 'mode-specific-command-prefix)
(global-unset-key (kbd "s-q"))
(bind-key* "s-q" 'auto-complete)
(bind-key* "C-<right>" 'tabbar-forward)
(bind-key* "C-<left>" 'tabbar-backward)

;;(bind-key "C-z" 'mode-specific-command-prefix)
;(global-unset-key (kbd "C-z"))
;;(bind-key "C-q" 'back-to-indentation)
;; (bind-key "C-o C-f" 'fci-mode)
;; (bind-key "M-n" (lambda () (interactive) (scroll-up 1)))
;; (bind-key "M-p" (lambda () (interactive) (scroll-down 1)))

(bind-key "M-p" 'backward-paragraph)
(bind-key "M-n" 'forward-paragraph)
(bind-key "C-j" 'smart-newline)
(bind-keys :map isearch-mode-map
           ("C-h" . isearch-del-char))

;; helm
(bind-key* "M-x" 'helm-M-x)
(bind-key* "C-x f" 'helm-mini)
(bind-key* "C-o f" 'helm-find-files)
(bind-key "C-o C-f" 'helm-ls-git-ls)
(bind-key "M-y"     'helm-show-kill-ring)
(bind-key "C-o i"   'helm-imenu)
(bind-key "C-o a" 'helm-ag)
(bind-key* "M-o" 'helm-swoop)
(bind-key* "C-M-o" 'helm-multi-swoop-all)
(bind-key "C-o C-a" 'helm-projectile-ag)
(bind-key "C-x C-d" 'helm-dired-recent-dirs-view)
(bind-key "<f1> a" 'helm-apropos)
(bind-keys :map helm-find-files-map
           ("TAB" . helm-execute-persistent-action))
(bind-keys :map helm-read-file-map
           ("TAB" . helm-execute-persistent-action))
;;(define-key helm-map (kbd "C-h") 'delete-backward-char)
;;(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; bm
(bind-key "M-0" 'bm-toggle)
(bind-key "C-0" 'bm-next)
(bind-key "C-M-)" 'bm-previous)
(bind-key "M-)" 'bm-remove-all-current-buffer)

;; yasnippet
(global-unset-key (kbd "C-x i"))
(bind-key "C-x i i" 'yas-insert-snippet)
(bind-key "C-x i n" 'yas-new-snippet)
(bind-key "C-x i e" 'yas-visit-snippet-file)
(bind-keys :map yas-minor-mode-map
           ("TAB" . nil)
           ("<tab>" . nil)
           ("C-q" . yas-expand-from-trigger-key))

;; multi-cursor
(bind-key "C-|" 'mc/edit-lines) ;;リージョン全てにカーソルおく
(global-unset-key "\C-\\")
(smartrep-define-key global-map "C-\\"
  '(("C-\\"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/unmark-next-like-this)
    ("P"        . 'mc/mark-previous-like-this)
    ("N"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))

;; ohter
(bind-key "C-o d" 'ag-dired)
(bind-key* "C-o r" 'anzu-query-replace-regexp)
(bind-key* "C-o C-r" 'anzu-query-replace-at-cursor-thing)
(bind-key* "C-]" 'er/expand-region)
(bind-key* "C-}" 'er/contract-region)
(bind-key "M-8" 'highlight-symbol-at-point)
(bind-key "M-*" 'my-highlight-symbol-input)
(bind-key "C-M-*" 'highlight-symbol-remove-all)
(bind-key* "C-<tab>" 'tabbar-forward)
(bind-key* "C-S-<tab>" 'tabbar-backward)
(bind-key "M-{" 'goto-last-change)
(bind-key "M-}" 'goto-last-change-reverse)
(bind-key "M-[" 'point-undo)
(bind-key "M-]" 'point-redo)
(bind-key "C-x c" 'smarter-compile)
(bind-key* "C-;" 'avy-migemo-goto-char)
(bind-key* "C-:" 'avy-migemo-goto-char-2)
(bind-key* "C-'" 'avy-goto-line)
(bind-key "C-\"" 'goto-line)
(bind-key* "C-x C-z" 'open-dropbox-junk)
(bind-key "C-x C-a" 'open-0sec-memo)
(bind-key "M-z" 'zop-to-char)
(bind-key "C-." 'pop-tag-mark)
(bind-key "M-." 'find-tag)
(bind-key "C-M-." 'helm-etags-select)
(bind-key "M-w" 'easy-kill)
(bind-key "M-/" 'hippie-expand)

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
(bind-keys :map isearch-mode-map
           ("C-;" . avy-migemo-isearch))


;; 自作関数
(bind-key "M-," 'full-screen)
(bind-key* "C-t" 'move-window)
(bind-key* "C-M-t" 'move-window-opposite)
(bind-key "C-," 'kill-line-backward)
(bind-key "C-M-k" 'kill-all-line-forward)
(bind-key "C-M-," 'kill-all-line-backward)
(bind-key "M-m" 'start-and-end-macro)
(bind-key "s-k" 'kill-*-buffer)
(bind-key "C-x a k" 'kill-all-buffer)
(bind-key "s-z" 'split-window-3)
(bind-key "C-a" 'goto-line-beginning-or-indent)
(bind-key "M-t" 'custom-transpose-char)
(bind-key "C-1" 'replace-symbol-from-kill-ring)
(bind-key "C-o k" 'replace-forward-from-kill-ring)
(bind-key "C-o ," 'replace-backward-from-kill-ring)
(bind-key "s-w" 'window-resizer)

(require 'thingopt)
(define-thing-commands)
(bind-key "M-3" 'mark-word*)
(bind-key "M-4" 'mark-string)
(bind-key "M-5" 'mark-up-list)

;; |M-b| 矩形をスペースで埋める
;; |M-f| 矩形を入力された1文字で埋める
;; |M-i| 矩形の各行の数値をインクリメントする
;; |M-k| 矩形をキルする
;; |M-n| 矩形の各行にインクリメントされた数値をフォーマットして挿入する
;; |M-r| 矩形を置換する
;; |M-t| 矩形を入力された文字列で埋める
;; |M-|| 矩形を入力としてシェルコマンドを実行する。引数が指定されている場合はシェルコマンドの結果が矩形に埋まる
;; |M-/| 矩形の正規表現にマッチする行をハイライト

;; C-u C-s isearch-regexp

;; helm-map
;; <C-M-down>      helm-scroll-other-window
;; <C-M-up>        helm-scroll-other-window-down
;; M-m             helm-toggle-all-marks
;; M-n             next-history-element
;; M-p             previous-history-element
;; C-s		Run Grep (C-u Recursive).
;; M-g a		Run AG grep on current directory.
;; M-g g		Run git-grep on current directory.
;; M-g i		Run gid (id-utils).
;; M-.		Run Etags (C-u use thing-at-point `C-u C-u' reload cache)
;; M-%		Query replace on marked files.
;; M-C		Copy File (C-u Follow).
;; C-]		Toggle basename/fullpath.
;; C-c C-y		Yank current selection into pattern.
