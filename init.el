;;; package --- Summary
;;; Commentary:
;;; Author: youdeee

;;; Code:
(eval-when-compile (require 'cl))

;;新しいバイトコンパイルファイルを読み込む
(setq load-prefer-newer t)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(defvar my-package-list
  '(ac-dabbrev
    ac-helm
;;    ac-ispell
    ac-js2
    ag
    auto-complete
    auto-complete-rst
    auto-dictionary
    auto-indent-mode
    autopair
    auto-yasnippet
    anzu
    coffee-mode
    color-theme
    color-moccur
    dash-at-point
    dired-toggle
    dired-details
    editorconfig
    epl
    es-mode
    exec-path-from-shell
    expand-region
    fill-column-indicator
    flex-autopair
    flycheck
    git
    google-translate
    goto-chg
    haml-mode
    helm
    helm-ag
    helm-descbinds
    helm-css-scss
    helm-c-moccur
    helm-c-yasnippet
    helm-dash
    helm-git
    helm-git-grep
    helm-gtags
    helm-ls-git
    helm-migemo
    helm-package
    highlight
    highlight-symbol
    hive
;;    ido-yes-or-no
    indent-guide
    init-loader
    js2-mode
    json-mode
    jump
    key-combo
    less-css-mode
    lispxmp
    magit
    magit-tramp
    markdown-mode
    mew
    migemo
    mkdown
    multi
    multi-term
    multiple-cursors
    open-junk-file
    php-completion
    php-mode
    point-undo
    popup
    popwin
    powerline
    python-mode
    rainbow-mode
    recentf-ext
    review-mode
    ruby-block
    ruby-end
    ruby-mode
    rvm
    sass-mode
    scss-mode
    session
    shell-pop
    simple-rtm
    skewer-mode
    slim-mode
    sql-indent
    smarter-compile
    smart-newline
    smartparens
    smartrep
    sticky
    swift-mode
    tabbar
    ucs-utils
    unicode-fonts
    undo-tree
    undohist
    w3m
    web-mode
    wget
    vline
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
    ;; rinari
    ;; rspec-mode
    ;; ruby-compilation
;; inf-ruby

;; ;; php-completion
;; ;; (depends-on "php-completion"
;; ;;         :git "https://github.com/suzuki/php-completion.git"
;; ;;         :branch "develop"
;; ;;         :files ("*.el" "phpcmp-index-of-*"))

(unless (package-installed-p 'init-loader)
  (package-refresh-contents)
  (package-install 'init-loader))

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load)

;; ;; load-path
;; (defun add-to-load-path (&rest paths)
;;   (let (path)
;;     (dolist (path paths paths)
;;       (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
;; 	(add-to-list 'load-path default-directory)
;; 	(if (fboundp 'normal-top-level-add-subdir-to-load-path)
;; 	    (normal-top-level-add-subdirs-to-load-path))))))
;;(add-to-load-path "elisp")
;;(add-to-list 'load-path "~/.emacs.d/elisp/")

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter " az")
 '(anzu-search-threshold 500)
 '(anzu-use-migemo nil)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(fci-rule-color "#d6d6d6")
 '(session-use-package t nil (session))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil)
 '(yas-prompt-functions (quote (my-yas/prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "gray50" :distant-foreground "black"))))
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-face ((t (:background "grey18"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-javascript-face ((t (:background "grey36"))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-server-face ((t (:background "grey")))))
