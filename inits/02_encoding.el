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

(create-fontset-from-ascii-font "Ricty-14:weight=normal:slant=normal" nil "ricty")

(set-fontset-font "fontset-ricty"
                  'unicode
                  (font-spec :family "Ricty" :size 14)
                  nil
                  'append)

(add-to-list 'default-frame-alist '(font . "fontset-ricty"))

;; ;; Google日本語入力
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `cursor-color "red")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.Roman" `cursor-color "blue")

(setenv "LC_ALL" "ja_JP.UTF-8")
