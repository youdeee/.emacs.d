;; meta -> command
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super)))

;; シンボリックリンクを開くときの質問省略
(setq vc-follow-symlinks t)

;; 編集時 buffer 再読み込み
(global-auto-revert-mode 1)

;; ido
(ido-mode t)
(ido-everywhere 1)
(setq ido-everywhere t)

;; max-specpdl
(setq max-specpdl-size 6000)
(setq max-lisp-eval-depth 5000)

;; wdired
(require 'wdired)
(setq wdired-allow-to-change-permissions t)
(define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
(setq delete-by-moving-to-trash t)

;; C-i,mをTABから独立
;(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
;(define-key input-decode-map (kbd "C-m") (kbd "H-m"))
;(define-key input-decode-map (kbd "C-S-m") (kbd "H-S-m"))

;; 特にtramp時、zshを使わない
(eval-after-load 'tramp '(setenv "SHELL" "/bin/zsh"))

(when window-system (scroll-bar-mode -1))
(tool-bar-mode 0)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

;; GC
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))
(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))
(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; マウス選択箇所を自動コピー
(setq mouse-drag-copy-region t)

(require 'generic-x)

(setq kill-ring-max 500)

(setq truncate-partial-width-windows nil)

(setq save-interprogram-paste-before-kill t)
(setq yank-pop-change-selection t)

;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

(setq ring-bell-function 'ignore)

(setq initial-scratch-message "")

(setq set-mark-command-repeat-pop t)
(setq mark-ring-max 32)
