;;; package --- Summary
;;; Commentary:
;;; Author: youdeee

;;; Code:
(eval-when-compile (require 'cl-lib))

;;新しいバイトコンパイルファイルを読み込む
(setq load-prefer-newer t)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(defvar my-package-list
  '(ac-dabbrev
    ;;    ac-ispell
    ;; ac-js2
    ac-python
    ag
    anzu
    auto-complete
    auto-complete-rst
    auto-dictionary
    auto-indent-mode
    auto-save-buffers-enhanced
;;    autopair
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
    ;;foreign-regexp
    git
    git-gutter-fringe
    gitconfig-mode
    gitignore-mode
    google-translate
    goto-chg
    haml-mode
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
    ;;smartparens
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
    zop-to-char
    php-mode
    php-completion
    slime
    ac-slime
    helm
    helm-package
    helm-swoop
    helm-ag
    helm-bm
    helm-descbinds
    helm-dired-recent-dirs
    helm-css-scss
    helm-c-yasnippet
    helm-dash
    helm-flycheck
    helm-gtags
    helm-projectile
    helm-git
    helm-git-files
    helm-git-grep
    helm-ls-git
    ac-helm
    csv-mode
    ;;    helm-migemo
    package-utils
    avy-migemo
    fuzzy
    evil
    fish-mode
    go-mode
    ))
(let ((not-installed
       (cl-loop for package in my-package-list
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

(unless (package-installed-p 'init-loader)
  (package-refresh-contents)
  (package-install 'init-loader))

(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load)

(setq user-emacs-directory "~/.emacs.d/")
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
 '(ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat")
 '(auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/.saves-")
 '(org-agenda-files nil)
 '(org-agenda-restore-windows-after-quit t)
 '(package-selected-packages
   (quote
    (go-mode fish-mode evil fuzzy avy-migemo package-utils csv-mode ac-helm helm-ls-git helm-git-grep helm-git-files helm-git helm-projectile helm-gtags helm-flycheck helm-dash helm-c-yasnippet helm-css-scss helm-dired-recent-dirs helm-descbinds helm-bm helm-ag helm-swoop helm-package helm ac-slime slime php-completion php-mode zop-to-char yasnippet yaml-mode vline wget web-mode w3m viewer undohist undo-tree unicode-fonts ucs-utils thingopt tabbar swift-mode sticky smartrep smart-newline smarter-compile sql-indent slim-mode skewer-mode simple-rtm shell-pop session scss-mode sass-mode rvm ruby-end ruby-block review-mode recentf-ext rainbow-mode rainbow-delimiters python-mode projectile popwin popup point-undo open-junk-file neotree multiple-cursors multi-term multi mkdown migemo mew markdown-mode magit-tramp magit lispxmp less-css-mode key-combo key-chord jump json-mode js2-mode init-loader indent-guide hive highlight-symbol highlight haml-mode goto-chg google-translate gitignore-mode gitconfig-mode git-gutter-fringe git flycheck flex-autopair fill-column-indicator expand-region exec-path-from-shell es-mode epl editorconfig easy-kill dired-details dired-toggle-sudo dired-toggle dash-at-point dash ctags-update csharp-mode color-moccur color-theme coffee-mode cake2 bm bind-key avy auto-yasnippet auto-save-buffers-enhanced auto-indent-mode auto-dictionary auto-complete-rst auto-complete anzu ag ac-python ac-js2 ac-dabbrev)))
 '(projectile-enable-caching t)
 '(projectile-known-projects-file "~/.emacs.d/cache/projectile-bookmarks.eld")
 '(recentf-save-file "~/.emacs.d/cache/.recentf")
 '(session-save-file "~/.emacs.d/cache/.session")
 '(session-use-package t nil (session))
 '(undohist-directory "~/.emacs.d/cache/undohist"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "gray13"))))
 '(helm-ff-directory ((t (:background "dark red" :foreground "white"))))
 '(helm-selection ((t (:background "gray20" :distant-foreground "black"))))
 '(hl-line ((t (:background "gray25"))))
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
