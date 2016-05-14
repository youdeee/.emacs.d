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
    ac-python
    ag
    anzu
    auto-complete
    auto-complete-rst
    auto-dictionary
    auto-indent-mode
    auto-save-buffers-enhanced
    autopair
    auto-yasnippet
    avy
    bind-key
    bm
    cake2
    coffee-mode
    color-theme
    color-moccur
    csharp-mode
    ctags-update
    dash
    dash-at-point
    dired-toggle
    dired-toggle-sudo
    dired-details
    easy-kill
    editorconfig
    epl
    es-mode
    exec-path-from-shell
    expand-region
    fill-column-indicator
    flex-autopair
    flycheck
    foreign-regexp
    git
    git-gutter-fringe
    gitconfig-mode
    gitignore-mode
    google-translate
    goto-chg
    haml-mode
    helm
    helm-ag
    helm-bm
    helm-descbinds
    helm-css-scss
    helm-c-moccur
    helm-c-yasnippet
    helm-dash
    helm-flycheck
    helm-git
    helm-git-files
    helm-git-grep
    helm-gtags
    helm-projectile
    helm-ls-git
    helm-migemo
    helm-package
    helm-swoop
    highlight
    highlight-symbol
    hive
;;    ido-yes-or-no
    indent-guide
    init-loader
    js2-mode
    json-mode
    jump
    key-chord
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
    neotree
;;    omnisharp
    open-junk-file
    php-completion
    php-mode
    point-undo
    popup
    popwin
    projectile
    python-mode
    rainbow-delimiters
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
    thingopt
    ucs-utils
    unicode-fonts
    undo-tree
    undohist
    viewer
    w3m
    web-mode
    wget
    vline
    yaml-mode
    yasnippet
    zop-to-char))
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
 '(foreign-regexp/regexp-type (quote ruby))
 '(org-agenda-files nil)
 '(projectile-enable-caching t)
 '(reb-re-syntax (quote foreign-regexp))
 '(session-use-package t nil (session))
 '(yas-prompt-functions (quote (my-yas/prompt))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "gray13" :foreground "White"))))
 '(helm-ff-directory ((t (:background "dark red" :foreground "white"))))
 '(helm-selection ((t (:background "gray20" :distant-foreground "black"))))
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
 '(web-mode-server-face ((t (:background "grey"))))
 '(whitespace-tab ((t (:background "gray5" :foreground "#969896")))))
(put 'upcase-region 'disabled nil)
