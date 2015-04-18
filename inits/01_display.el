;; 最初のメッセージを消す
(setq inhibit-startup-message t)

;; 起動時フレームの大きさ
(setq initial-frame-alist
      '((top . 1) (left . 65) (width . 147) (height . 45)));115/32

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
				  (set-face-foreground 'font-lock-builtin-face "spring green")
				  (set-face-foreground 'font-lock-comment-face "slate gray")
				  (set-face-foreground 'font-lock-string-face  "spring green")
				  (set-face-foreground 'font-lock-keyword-face "khaki")
				  (set-face-foreground 'font-lock-constant-face "violet")
				  (set-face-foreground 'font-lock-function-name-face "hot pink")
				  (set-face-foreground 'font-lock-variable-name-face "hot pink")
				  (set-face-foreground 'font-lock-type-face "cyan")
				  (set-face-foreground 'font-lock-warning-face "magenta")
				  (set-face-bold-p 'font-lock-function-name-face t)
				  (set-face-bold-p 'font-lock-warning-face nil)
				  ))
