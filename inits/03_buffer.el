;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
(format "%%f @%s" (system-name)))

;; タブの幅
(setq tab-width 2)

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
(setq-default truncate-lines t)

;; ウィンドウを左右に分割したときに行を折り返さない
(setq-default truncate-partial-width-windows t)

;; バッファ末尾より後の行では、フリンジ左側に何か表示される
(setq-default indicate-empty-lines t)

;; 矩形
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; 行番号表示
(global-linum-mode t)


;;; スペースとか括弧とか色系
;;カーソルの色
(set-cursor-color "white")

;; リージョン強調
(setq-default transient-mark-mode t)

;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;;現在行を目立たせる
(global-hl-line-mode t)
(set-face-background 'hl-line "#333333")

;; 括弧
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-priority 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "#500")

