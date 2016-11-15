;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

(smart-newline-mode 1)

(setq magit-last-seen-setup-instructions "1.4.0")

(require 'auto-complete-config)
(require 'fuzzy)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; (custom-set-variables '(ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat"))
(ac-config-default)
(setq ac-use-menu-map t)

(setq ac-auto-start 2)
(setq ac-use-fuzzy t)
(setq ac-ignore-case nil)
(setq ac-modes (append ac-modes '(objc-mode)))
(auto-complete 'ac-persist-help)

(setq ac-delay 0.05)  ;; 0
(setq ac-use-comphist t)  ;; 補完推測機能有効
(setq ac-auto-show-menu 0.05)  ;; 0.8
(setq ac-quick-help-delay 0.5)  ;; n秒後にクイックヘルプを表示
(setq popup-use-optimized-column-computation nil) ;; 最適化無効でメニュー表示崩れ回避
(setq ac-auto-start 1)

(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-modes 'swift-mode)
(add-hook 'markdown-mode-hook
          (lambda ()
            (make-local-variable 'ac-ignore-case)
            (setq ac-ignore-case 'smart)))

;; (require 'company)
;; (global-company-mode)
;; (setq company-idle-delay 0.05) ; デフォルトは0.5
;; (setq company-minimum-prefix-length 2) ; デフォルトは4
;; (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

(require 'server)
(unless (server-running-p)
  (server-start))
(defalias 'exit 'save-buffers-kill-emacs)

(require 'indent-guide)
(indent-guide-global-mode)
;;(set-face-background 'indent-guide-face "dimgray")
;;(setq indent-guide-recursive t)

(require 'lispxmp)

(require 'flex-autopair)
(flex-autopair-mode 1)

;; (require 'autopair)
;; (autopair-global-mode 1)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode t)
;; (sp-pair "<%" "%>")

;; (require 'key-combo)
;; ;; (key-combo-load-default)
;; (key-combo-define-global (kbd "<") '("<"))

(require 'color-moccur)
;;(global-set-key (kbd "M-o") 'occur-by-moccur)
(setq moccur-split-word t)
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")
;;moccur-edit
;;(require 'moccur-edit nil t)

(require 'undohist)
;; (custom-set-variables '(undohist-directory "~/.emacs.d/cache/undohist"))
(undohist-initialize)


(require 'undo-tree)
(global-undo-tree-mode t)
;;M-(C-)/    C-x u :show tree   d:details
;;(global-set-key (kbd "M-/") 'undo-tree-redo)


(setq elscreen-prefix-key "")
(elscreen-start)
(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))
(elscreen-separate-buffer-list-mode 1)
(elscreen-persist-mode 1)

(tabbar-mode 1)
(setq tabbar-use-images nil)
(setq tabbar-buffer-groups-function nil)
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

(desktop-save-mode 1)


(require 'goto-chg)

(require 'point-undo)

(require 'expand-region)

(require 'smarter-compile)

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/Cellar/cmigemo/HEAD/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)

(require 'editorconfig)
(editorconfig-mode 1)

;; caches
(setq eshell-directory-name "~/.emacs.d/cache/eshell/")

;; (custom-set-variables '(projectile-known-projects-file "~/.emacs.d/cache/projectile-bookmarks.eld"))

;; (setq migemo-pattern-alist-file "~/.emacs.d/cache/migemo-pattern")
;; (setq migemo-frequent-pattern-alist-file "~/.emacs.d/cache/migemo-frequent")

;(setq auto-save-file-name-transforms '((".*" ,my-backup-dir t)))
;; (custom-set-variables '(auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/.saves-"))

;; ;;ac-ispell
;; (eval-after-load "auto-complete"
;;   '(progn
;;      (ac-ispell-setup)))
;; (add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
;; (add-hook 'mail-mode-hook 'ac-ispell-ac-setup)
;; (add-hook 'text-mode-hook 'ac-ispell-ac-setup)
;; (add-hook 'markdown-mode-hook 'ac-ispell-ac-setup)

;;(require 'dired-details)
;; (dired-details-install)
;; (setq dired-details-hidden-string "")
;; (setq dired-details-hide-link-targets nil)
;; (defadvice find-dired-sentinel (after dired-details (proc state) activate)
;;   (ignore-errors
;;     (with-current-buffer (process-buffer proc)
;;       (dired-details-activate))))

(require 'evil)

(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))
