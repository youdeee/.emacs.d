(setq magit-last-seen-setup-instructions "1.4.0")

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
(setq ac-ignore-case nil)

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
(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key [(control shift tab)] 'tabbar-backward)

;;最後の変更箇所にジャンプする
(require 'goto-chg)
(global-set-key (kbd "M-{") 'goto-last-change)
(global-set-key (kbd "M-}") 'goto-last-change-reverse)

(require 'point-undo)
(global-set-key (kbd "M-[") 'point-undo)
(global-set-key (kbd "M-]") 'point-redo)

(require 'key-combo)
;; (key-combo-load-default)
(key-combo-define-global (kbd "<") '("<"))

;; smart-compile
(require 'smarter-compile)
(global-set-key (kbd "C-x c") 'smarter-compile)
(global-set-key (kbd "C-x C-x") (kbd "C-x c C-m"))


;; ;;highlight
;; (require 'highlight-symbol)
;; (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる
;; (global-set-key (kbd "C-3") 'highlight-symbol-at-point)
;; (global-set-key (kbd "C-M-3") 'highlight-symbol-remove-all)

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

