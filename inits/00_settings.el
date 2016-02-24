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

;; C-i,mをTABから独立
;(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
;(define-key input-decode-map (kbd "C-m") (kbd "H-m"))
;(define-key input-decode-map (kbd "C-S-m") (kbd "H-S-m"))

;; 特にtramp時、zshを使わない
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(when window-system (scroll-bar-mode 0))
(tool-bar-mode 0)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))
