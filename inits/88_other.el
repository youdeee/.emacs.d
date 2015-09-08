;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)

(smart-newline-mode 1)

(setq magit-last-seen-setup-instructions "1.4.0")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
(setq ac-modes (append ac-modes '(objc-mode)))
(auto-complete 'ac-persist-help)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(setq ac-auto-show-menu 0.8)
(define-key ac-completing-map "\M-/" 'ac-stop)
(setq ac-ignore-case nil)

(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(setq ac-use-fuzzy t)          ;; 曖昧マッチ

(require 'server)
(unless (server-running-p)
  (server-start))
(defalias 'exit 'save-buffers-kill-emacs)

(require 'indent-guide)
(indent-guide-global-mode)
;;(set-face-background 'indent-guide-face "dimgray")
;;(setq indent-guide-recursive t)

(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)


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
;;(require 'moccur-edit nil t)

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

(require 'undohist)
(undohist-initialize)

(require 'undo-tree)
(global-undo-tree-mode t)
;;M-(C-)/    C-x u :show tree   d:details
;;(global-set-key (kbd "M-/") 'undo-tree-redo)

;;tab mode
(when (require 'tabbar nil t)
  (tabbar-mode))
(setq tabbar-buffer-groups-function nil)

(require 'goto-chg)

(require 'point-undo)

(require 'expand-region)

(require 'key-combo)
;; (key-combo-load-default)
(key-combo-define-global (kbd "<") '("<"))

;; smart-compile
(require 'smarter-compile)

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

;; Set your installed path
(setq migemo-dictionary "/usr/local/Cellar/cmigemo/HEAD/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)


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

