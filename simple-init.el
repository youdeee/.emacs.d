(eval-when-compile (require 'cl-lib))

(setq load-prefer-newer t)
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)

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

;; 特にtramp時、zshを使わない
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; GCを減らして軽くする
(setq gc-cons-threshold (* 128 1024 1024))

;; マウス選択箇所を自動コピー
(setq mouse-drag-copy-region t)

(require 'generic-x)


;; デフォルト設定
(setq default-input-method "MacOSX")

;; 言語を日本語にする
(set-language-environment 'Japanese)

;; 極力UTF-8とする
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; (when (memq window-system '(mac ns))
;;   (global-set-key [s-mouse-1] 'browse-url-at-mouse)
;;   (let* ((size 17)
;; 	 (jpfont "Hiragino Maru Gothic ProN")
;; 	 (asciifont "Ricty")
;; 	 (h (* size 10)))
;;     (set-face-attribute 'default nil :family asciifont :height h)
;;     (set-fontset-font t 'katakana-jisx0201 jpfont)
;;     (set-fontset-font t 'japanese-jisx0208 jpfont)
;;     (set-fontset-font t 'japanese-jisx0212 jpfont)
;;     (set-fontset-font t 'japanese-jisx0213-1 jpfont)
;;     (set-fontset-font t 'japanese-jisx0213-2 jpfont)
;;     (set-fontset-font t '(#x0080 . #x024F) asciifont))
;;     (setq face-font-rescale-alist
;; 	'(("^-apple-hiragino.*" . 1.2)
;; 	  (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
;; 	  (".*osaka-bold.*" . 1.2)
;; 	  (".*osaka-medium.*" . 1.2)
;; 	  (".*courier-bold-.*-mac-roman" . 1.0)
;; 	  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
;; 	  (".*monaco-bold-.*-mac-roman" . 0.9)
;; 	  ("-cdac$" . 1.3)))
;; )

;; (create-fontset-from-ascii-font "Ricty-17:weight=normal:slant=normal" nil "ricty")

;; (set-fontset-font "fontset-ricty"
;;                   'unicode
;;                   (font-spec :family "Ricty" :size 17)
;;                   nil
;;                   'append)

;; (add-to-list 'default-frame-alist '(font . "fontset-ricty"))

(setenv "LC_ALL" "ja_JP.UTF-8")

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 3000)

;; 最初のメッセージを消す
(setq inhibit-startup-message t)

(load-theme 'tsdh-dark) ;;manoj-dark

;; アクティブウィンドウと非アクティブウィンドウの透明度
;; (when window-system
;;   (add-to-list 'default-frame-alist '(alpha . (90 80)))
;;   (add-to-list 'default-frame-alist '(foreground-color . "white"))
;;   (add-to-list 'default-frame-alist '(background-color . "black"))
;;   )

;; 色
;; (add-hook 'font-lock-mode-hook '(lambda ()
;;                                   (set-face-foreground 'font-lock-comment-face "slate gray")
;;                                   ))

;; ;; miniとかを横に表示
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
(format "%%f @%s" (system-name)))

;; タブの幅
;;(setq tab-width 2)
(setq-default tab-width 2 indent-tabs-mode nil)

;;前の行とインデントをあわせる
(setq indent-line-function 'indent-relative-maybe)

;; 問い合わせを簡略化
(fset 'yes-or-no-p 'y-or-n-p)

;; 補完 大文字小文字
(setq completion-ignore-case t)
(which-function-mode 1)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq isearch-case-fold-search t)
(setq case-fold-search t)

;; 補完可能なものを随時表示
(icomplete-mode 1)

;;１行ずつスクロール
(setq scroll-step 1)
(setq font-lock-maximum-decoration t)

;;ファイルの最後で改行しない
(setq next-line-add-newlines nil)

;; 通常のウィンドウで行を折り返さない
;;(setq-default truncate-lines t)

;; ウィンドウを左右に分割したときに行を折り返さない
;;(setq-default truncate-partial-width-windows t)

;; バッファ末尾より後の行では、フリンジ左側に何か表示される
(setq-default indicate-empty-lines t)

;; 矩形
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;(setq-default transient-mark-mode t)
(set-face-background 'region "#225A92")

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;;現在行を目立たせる
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.05 t 'global-hl-line-timer-function))
;;  (cancel-timer global-hl-line-timer)
;; (global-hl-line-mode t)
;; (set-face-background 'hl-line "#191919")
;; (set-face-foreground 'hl-line nil)

;; 括弧
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-priority 0)
(setq show-paren-style 'expression)
(set-face-foreground 'show-paren-match-face nil)
(set-face-background 'show-paren-match-face "#4C4067")

(set-cursor-color "#EA0825")


;; functions
(defun goto-line-beginning-or-indent (&optional $position)
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
        (move-beginning-of-line 1))))

(defun full-screen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun move-window ()
  (interactive)
  (make-window-when-unsplit 1))

(defun move-window-opposite ()
  (interactive)
  (make-window-when-unsplit -1))

(defun make-window-when-unsplit (n)
  (when (one-window-p)
    (split-window-right))
  (other-window n))

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
      (delete-char 1)
      )))

;; (defmacro dkey (keymap key command)
;;   '(define-key ,keymap ,(read-kbd-macro key) ,command))

(defmacro gkey (key command)
  `(define-key global-map ,(read-kbd-macro key) ,command))

;; keybind
(gkey "C-x f" 'recentf-open-files)
(gkey "C-h" 'delete-backward-char)
(gkey "C-x k" 'kill-this-buffer)
(gkey "s-&" 'kill-buffer)
(gkey "C-S-v" 'scroll-down-command)
(gkey "M-p" 'backward-paragraph)
(gkey "M-n" 'forward-paragraph)
(gkey "M-h" 'backward-kill-word)
(gkey "C-x 5 o" 'transpose-words)
(gkey "C-x t" 'other-frame)
(gkey "s-u" 'browse-url)
(gkey "M-SPC" 'delete-trailing-whitespace)
;;(gkey "s-f" 'auto-fill-mode)
(gkey "s-f" 'toggle-truncate-lines)
(gkey "C-x m" 'kmacro-end-and-call-macro)
(gkey "C-x C-n" 'linum-mode)
(gkey "M-q" 'quoted-insert)
(gkey "M-k" 'kill-whole-line)
(gkey "M-t" 'transpose-chars)
(gkey "C-x C-t" 'transpose-lines)
(gkey "C-x C-d" 'dired-jump)
(gkey "s-r" 'revert-buffer)
(gkey "s-e" 'eval-buffer)
(gkey "M-0" 'suspend-frame)
;;(gkey "C-z" 'mode-specific-command-prefix)
(global-unset-key (kbd "C-z"))
;;(gkey "C-q" 'back-to-indentation)
;; (gkey "C-c C-f" 'fci-mode)

;; (dkey isearch-mode-map "C-h" isearch-del-char)

;; 自作関数
(gkey "M-," 'full-screen)
(gkey "C-t" 'move-window)
(gkey "C-M-t" 'move-window-opposite)
(gkey "C-," 'kill-line-backward)
(gkey "C-M-k" 'kill-all-line-forward)
(gkey "C-M-," 'kill-all-line-backward)
(gkey "M-m" 'start-and-end-macro)
(gkey "s-k" 'kill-*-buffer)
(gkey "C-x a k" 'kill-all-buffer)
(gkey "s-z" 'split-window-3)
(gkey "C-a" 'goto-line-beginning-or-indent)
(gkey "M-t" 'custom-transpose-char)
