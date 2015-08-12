(require 'tomorrow-night-bright-theme)

;; 最初のメッセージを消す
(setq inhibit-startup-message t)

;; 起動時フレームの大きさ
;; (setq initial-frame-alist
;;       '((top . 1) (left . 65) (width . 147) (height . 45)));115/32

;; アクティブウィンドウと非アクティブウィンドウの透明度
(when window-system
  (add-to-list 'default-frame-alist '(alpha . (100 70)))
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "black"))
  )

;; ;; miniとかを横に表示
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

;; 時計表示
(display-time)

;; 色
(add-hook 'font-lock-mode-hook '(lambda ()
;;				  (set-face-foreground 'font-lock-builtin-face "spring green")
				  (set-face-foreground 'font-lock-comment-face "slate gray")
;;				  (set-face-foreground 'font-lock-string-face  "spring green")
;;				  (set-face-foreground 'font-lock-keyword-face "khaki")
;;				  (set-face-foreground 'font-lock-constant-face "violet")
;;				  (set-face-foreground 'font-lock-function-name-face "hot pink")
;;				  (set-face-foreground 'font-lock-variable-name-face "hot pink")
;;				  (set-face-foreground 'font-lock-type-face "cyan")
;;				  (set-face-foreground 'font-lock-warning-face "magenta")
;;				  (set-face-bold-p 'font-lock-function-name-face t)
;;				  (set-face-bold-p 'font-lock-warning-face nil)
				  ))


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

;;; スペースとか括弧とか色系
;;カーソルの色
(set-cursor-color "white")

;; リージョン強調
(setq-default transient-mark-mode t)
(set-face-background 'region "#1565C0")

;; 行末の空白を表示
;;(setq-default show-trailing-whitespace t)
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

;;現在行を目立たせる
(global-hl-line-mode t)
(set-face-background 'hl-line "#424242")
(set-face-foreground 'hl-line nil)

;; 括弧
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-priority 0)
(setq show-paren-style 'expression)
(set-face-foreground 'show-paren-match-face nil)
(set-face-background 'show-paren-match-face "#B71C1C")

;; (require 'auto-highlight-symbol)
;; (global-auto-highlight-symbol-mode t )

(require 'highlight-symbol)
(setq highlight-symbol-colors '("#D500F9" "#3D5AFE" "#76FF03" "#FF9100" "#ff1744" "#00E5FF"))
;;("DarkOrange" "DodgerBlue1" "DeepPink1"))
(global-set-key (kbd "C-M-8") 'highlight-symbol-at-point)
(global-set-key (kbd "C-M-*") 'highlight-symbol-remove-all)
