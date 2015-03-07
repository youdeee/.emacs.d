;;; package --- Summary
;;; Commentary:
;;; Author: YOUDEEE

;;; Code:
(eval-when-compile (require 'cl))

;; load-path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdir-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")
;(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;インストールするディレクトリを指定
;;(setq package-user-dir(concat user-emacs-directory "elpa"))
(package-initialize)
;; install if not installed
(defvar my-package-list
  '(ac-ispell
    ac-helm
    anzu
    auto-complete
    async
    auto-dictionary
    auto-indent-mode
    auto-install
    auto-yasnippet
    autopair
    coffee-mode
    color-theme
    color-moccur
    csv-mode
    dash
    dired-toggle
    dired-details
    epl
    expand-region
    git
    fill-column-indicator
    flex-autopair
    flycheck
    goto-chg
    haml-mode
    helm
    helm-ag
    helm-descbinds
    helm-css-scss
    helm-c-yasnippet
    highlight
    highlight-symbol
    indent-guide
    ido-select-window
    ido-ubiquitous
    ido-vertical-mode
    ido-yes-or-no
    inf-ruby
    inflections
    js3-mode
    json
    json-mode
    jump
    key-combo
    lispxmp
    markdown-mode
    markdown-mode+
    multi
    multiple-cursors
    open-junk-file
    php-mode
    php+-mode
    pkg-info
    pod-mode
    point-undo
    popup
    powerline
    python-mode
    recentf-ext
    rinari
    rspec-mode
    ruby-block
    ruby-compilation
    ruby-electric
    ruby-end
    ruby-mode
    sass-mode
    scss-mode
    slim-mode
    smart-indent-rigidly
    smarter-compile
    smartparens
    sticky
    tabbar
    undo-tree
    undohist
    vline
    web-mode
    yaml-mode
    yasnippet))
(let ((not-installed
       (loop for package in my-package-list
             when (not (package-installed-p package))
             collect package)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))

(setq load-prefer-newer t)

;; ;; auto-install.el
;; (require 'auto-install)
;; ;; インストールディレクトリを設定
;; (setq auto-install-directory "~/.emacs.d/elisp")
;; ;; EmacsWikiに登録されているelispの名前を取得
;; (auto-install-update-emacswiki-package-name t)
;; ;; install-elispの関数を利用可能にする
;; (auto-install-compatibility-setup)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
(setq ac-modes (append ac-modes '(objc-mode)))
(auto-complete '(ac-persist-help))
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-auto-show-menu 0.8)
(define-key ac-completing-map "\M-/" 'ac-stop)

;;ac-ispell
(eval-after-load "auto-complete"
  '(progn
     (ac-ispell-setup)))
(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)
(add-hook 'text-mode-hook 'ac-ispell-ac-setup)
(add-hook 'markdown-mode-hook 'ac-ispell-ac-setup)

;;起動時フレームの大きさ
 (setq initial-frame-alist
          '((top . 1) (left . 65) (width . 147) (height . 45)));;115/32
;;miniとかを横に表示
(setq split-height-threshold nil)
(setq split-width-threshold 0)
(global-set-key (kbd "C-c f") 'fci-mode)

;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)
(ido-yes-or-no-mode)

(require 'point-undo)
(global-set-key (kbd "M-[") 'point-undo)
(global-set-key (kbd "M-]") 'point-redo)

;; meta -> command
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super)))

;; 言語を日本語にする
(set-language-environment 'Japanese)
;; 極力UTF-8とする
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
;; 英語
(set-face-attribute 'default nil
           :family "ricty" ;; font
           :height 170)    ;; font size
;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font
;; ;;Google日本語入力
;; (setq default-input-method "MacOSX")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ;バッファの同一ファイル名を区別

(require 'server)
(unless (server-running-p)
  (server-start))
(defalias 'exit 'save-buffers-kill-emacs)

(require 'indent-guide)
(indent-guide-global-mode)
;(set-face-background 'indent-guide-face "dimgray")
;(setq indent-guide-recursive t)

(require 'dired-details)
;; (dired-details-install)
;; (setq dired-details-hidden-string "")
;; (setq dired-details-hide-link-targets nil)
;; (defadvice find-dired-sentinel (after dired-details (proc state) activate)
;;   (ignore-errors
;;     (with-current-buffer (process-buffer proc)
;;       (dired-details-activate))))

(global-set-key (kbd "s-f") 'auto-fill-mode)

(require 'open-junk-file)
(global-set-key (kbd "C-z") 'open-junk-file)
(setq open-junk-file-format "~/workspace/junk/%Y/%m/%Y-%m-%d-%H%M%S.")

(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

(yas-global-mode 1)
(global-set-key (kbd "C-x j j") 'yas-insert-snippet)
(global-set-key (kbd "C-x j n") 'yas-new-snippet)
(global-set-key (kbd "C-x j v") 'yas-visit-snippet-file)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<tab>") nil)

(helm-mode 1)
(helm-descbinds-mode 1)
(setq helm-split-window-default-side 'right)
(require 'helm-ag)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x f") 'helm-mini)
(global-set-key (kbd "C-c C-f") 'helm-find-files)
(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-c i")   'helm-imenu)
(global-set-key (kbd "C-x b")   'helm-buffers-list)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-o") 'helm-occur)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)
(setq helm-css-scss-split-direction 'split-window-horizontally)
(global-set-key (kbd "C-c C-;") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-c C-;") 'ac-complete-with-helm)

;; Disable helm in some functions
(setq helm-delete-minibuffer-contents-from-point t)
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  (kill-new (buffer-substring (point) (field-end))))
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

 ;;js3-mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(coffee-tab-width 2)
 '(fill-column 80)
 '(js3-auto-indent-p t)
 '(js3-curly-indent-offset 0)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-lazy-dots t)
 '(js3-lazy-operators t)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2))
(autoload 'js3-mode "js3-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;;coffee-mode tab
(add-to-list 'ac-modes 'coffee-mode) ;; coffee-modeでACを使えるようにする
(add-hook 'coffee-mode-hook
  '(lambda ()
    (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/javascript-mode")
))

(require 'slim-mode)
(add-to-list 'ac-modes 'slim-mode) ;; coffee-modeでACを使えるようにする
(add-hook 'slim-mode-hook
  '(lambda ()
    (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/ruby-mode")
))

(require 'sass-mode)
(add-to-list 'ac-modes 'sass-mode) ;; coffee-modeでACを使えるようにする

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
 ;; (add-hook 'yaml-mode-hook
 ;;    '(lambda ()
 ;;       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(require 'scss-mode)
(add-to-list 'ac-modes 'scss-mode) ;; coffee-modeでACを使えるようにする
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))
;;smart-indent-rigid
(add-hook 'haml-mode-hook 'smart-indent-rigidly-mode)
(add-hook 'coffee-mode-hook 'smart-indent-rigidly-mode)
(add-hook 'sass-mode-hook 'smart-indent-rigidly-mode)

(require 'flex-autopair)
(flex-autopair-mode 1)

;; (require 'autopair)
;; (autopair-global-mode 1)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode t)
;; (sp-pair "<%" "%>")

(require 'color-moccur)
;;(global-set-key (kbd "M-o") 'occur-by-moccur)
(setq moccur-split-word t)
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")
;;moccur-edit
;(require 'moccur-edit nil t)

(require 'powerline)
(powerline-default-theme)
;; (set-face-attribute 'mode-line nil
;;                     :foreground "#fff"
;;                     :background "#FF0066"
;;                     :box nil)
(set-face-attribute 'powerline-active1 nil
                    :foreground "#000"
                    :background "#66ccff" ;"#FF6699"
                    :inherit 'mode-line)
(set-face-attribute 'powerline-active2 nil
                    :foreground "#000"
                    :background "#ffaeb9"
                    :inherit 'mode-line)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 最近使ったファイルをメニューに表示
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 3000)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (flycheck-add-next-checker 'javascript-jshint
;;                            'javascript-gjslint)
;; Python
(add-hook 'python-mode-hook 'flycheck-mode)
;; Ruby
(add-hook 'ruby-mode-hook 'flycheck-mode)

;; transient-mark-mode on
(setq-default transient-mark-mode t)
;; 行末の空白を表示
(setq-default show-trailing-whitespace t)
;;現在行を目立たせる
;(setq hl-line-face 'underline) ; 下線
(global-hl-line-mode t)
(set-face-background 'hl-line "#333333");;333333

(require 'ido)
(ido-mode t)
(ido-everywhere 1)
(setq ido-everywhere t)

(require 'undohist)
(undohist-initialize)

(require 'undo-tree)
(global-undo-tree-mode t)	  ;M-(C-)/    C-x u :show tree   d:details
;;(global-set-key (kbd "M-/") 'undo-tree-redo)

;; デフォルトの色づけを変える
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

; 補完 大文字小文字
(setq completion-ignore-case t)
(which-function-mode 1)
 (setq read-file-name-completion-ignore-case t)
; 補完可能なものを随時表示
(icomplete-mode 1)

;;; バックアップファイルを作らない
(setq backup-inhibited t)
(display-time)
;; カーソル位置の桁数をモードライン行に表示する
(column-number-mode 1)
;最初のメッセージを消す;
(setq inhibit-startup-message t)
;選択した領域に色をつける;
(setq transient-mark-mode t)
;カーソルの色;
(set-cursor-color "white")
(when window-system
;アクティブウィンドウと非アクティブウィンドウの透明度;
(add-to-list 'default-frame-alist '(alpha . (100 70)))
(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black")))
;１行ずつスクロール;
(setq scroll-step 1)
(setq font-lock-maximum-decoration t)
;ファイルの最後で改行しない;
(setq next-line-add-newlines nil)
;画面が光る;
;(setq visible-bell t)
;タブの幅;
(setq tab-width 2)
;前の行とインデントをあわせる;
(setq indent-line-function 'indent-relative-maybe)
(global-set-key (kbd "C-@") 'indent-region)
;行番号を表示;
(global-linum-mode t)
(global-set-key [(C c) (n)] 'linum-mode)
;対応する括弧をハイライト表示させる;
(show-paren-mode 1)
;; 括弧
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "#500")
;max-specpdl
(setq max-specpdl-size 6000)
(setq max-lisp-eval-depth 5000)
;;cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
;;backward-kill-line
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-,") 'backward-kill-line)
;;;keybind
(global-set-key [(C h)] 'delete-backward-char)
(global-set-key [(C x)(k)] 'kill-this-buffer)
(global-set-key [(s &)] 'kill-buffer)
(global-set-key [(C x)(t)] 'transpose-chars)
(global-set-key [(C t)] 'other-window)
(global-set-key [(C S v)] 'scroll-down-command)
(global-set-key [(M p)] 'backward-paragraph)
(global-set-key [(M n)] 'forward-paragraph)
(global-set-key [(M h)] 'backward-kill-word)

;;; c ;;;
;;cc-modeの設定（プログラムを書くときのモーdo)
(add-hook 'c-mode-common-hook
(lambda()
;行末の不要なスペースを強調する;
(setq show-trailing-whitespace t)))

;;c++ mode for .cu file ;
(setq auto-mode-alist
      (cons ( cons "\\.cu$" 'c++-mode)
	    auto-mode-alist))

;;tab mode
(when (require 'tabbar nil t)
  (tabbar-mode))
;; グループ化しない
(setq tabbar-buffer-groups-function nil)
;; Firefoxライクなキーバインドに
(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key [(control shift tab)] 'tabbar-backward)

;最後の変更箇所にジャンプする
(require 'goto-chg)
(define-key global-map (kbd "C-8") 'goto-last-change)
(define-key global-map (kbd "C-*") 'goto-last-change-reverse)

;anzu
(global-anzu-mode +1)

;(setq anzu-use-migemo t)
(setq anzu-minimum-input-length 3)
(global-set-key (kbd "C-c r") 'anzu-query-replace)
(global-set-key (kbd "C-c R") 'anzu-query-replace-regexp)

;;(require 'smartrep)
;; ;http://shibayu36.hatenablog.com/entry/2013/12/30/190354
;; ;multiple-cursor.elの設定を調整してみた
;; (require 'expand-region)
;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-,") 'er/expand-region)
;; (global-set-key (kbd "C-M-,") 'er/contract-region)
;; (declare-function smartrep-define-key "smartrep")
;; (global-set-key (kbd "C-M-c") 'mc/edit-lines)
;; (global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
;; (global-unset-key "\C-t")
;; (global-unset-key "\C-i")
;; (smartrep-define-key global-map "C-i"
;;   '(("C-i"      . 'mc/mark-next-like-this)
;;     ("n"        . 'mc/mark-next-like-this)
;;     ("p"        . 'mc/mark-previous-like-this)
;;     ("m"        . 'mc/mark-more-like-this-extended)
;;     ("u"        . 'mc/unmark-next-like-this)
;;     ("U"        . 'mc/unmark-previous-like-this)
;;     ("s"        . 'mc/skip-to-next-like-this)
;;     ("S"        . 'mc/skip-to-previous-like-this)
;;     ("*"        . 'mc/mark-all-like-this)
;;     ("d"        . 'mc/mark-all-like-this-dwim)
;;     ("i"        . 'mc/insert-numbers)
;;     ("o"        . 'mc/sort-regions)
;;     ("O"        . 'mc/reverse-regions)))

;; ;;highlight
;; (require 'highlight-symbol)
;; (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる
;; (global-set-key (kbd "C-3") 'highlight-symbol-at-point)
;; (global-set-key (kbd "C-M-3") 'highlight-symbol-remove-all)

(require 'key-combo)
;; (key-combo-load-default)
(key-combo-define-global (kbd "<") '("<"))

;; ruby
(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (setq ruby-deep-indent-paren-style nil)
	     (defadvice ruby-indent-line (after unindent-closing-paren activate)
	       (let ((column (current-column))
		     indent offset)
		 (save-excursion
		   (back-to-indentation)
		   (let ((state (syntax-ppss)))
		     (setq offset (- column (current-column)))
		     (when (and (eq (char-after) ?\))
				(not (zerop (car state))))
		       (goto-char (cadr state))
		       (setq indent (current-indentation)))))
		 (when indent
		   (indent-line-to indent)
		   (when (> offset 0) (forward-char offset)))))
))

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'ruby-end)
(add-hook 'ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
;;    (electric-pair-mode t)
;;    (electric-indent-mode t)
    (electric-layout-mode t)))

;; ;; rcodetools
;; (require 'rcodetools)
;; (setq rct-find-tag-if-available nil)
;; (defun ruby-mode-hook-rcodetools ()
;;   (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
;;   (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
;;   (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;; smart-compile
(require 'smarter-compile)
(global-set-key (kbd "C-x c") 'smarter-compile)
(global-set-key (kbd "C-x C-x") (kbd "C-x c C-m"))

;;mardkown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ;;==========================================================
;; ;;         web-modeの設定
;; ;;==========================================================

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun web-mode-hook ()
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
   (setq web-mode-comment-style 2)
  ;; 終了タグの自動補完をしない
  (setq web-mode-disable-auto-pairing t)
  (setq web-mode-disable-css-colorization t)
  (setq web-mode-enable-block-faces t)
  (custom-set-faces
   '(web-mode-server-face
     ((t (:background "grey"))))                  ; template Blockの背景色
   '(web-mode-css-face
     ((t (:background "grey18"))))                ; CSS Blockの背景色
   '(web-mode-javascript-face
     ((t (:background "grey36"))))                ; javascript Blockの背景色
   )
  (setq web-mode-enable-heredoc-fontification t)
)
(add-hook 'web-mode-hook  'web-mode-hook)
;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))

(provide 'init)
;;; init.el ends here
