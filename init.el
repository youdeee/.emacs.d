;;; package --- Summary
;;; Commentary:
;;; Author: youdeee

;;; Code:
(eval-when-compile (require 'cl))

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
;;    point-undo
    popup
    popwin
    powerline
    python-mode
    rainbow-mode
    recentf-ext
    review-mode
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
    ;; ruby-block
    ;; ruby-compilation
    ;; ruby-electric
    ;; ruby-end
    ;; ruby-mode
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

(provide 'init)

;;; init.el ends here
