(setq magit-last-seen-setup-instructions "1.4.0")
()
()
()
( 'ac-ne)
(setq ac)
;; ;;ac- 0.8
;; (eval 'ac-stop "auto-complete"
;;   '(progn
;;      (ac-ispell-setup)))
;; (add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)













(require 'point-undo)
(global-set-key (kbd "M-[") 'point-undo)
(global-set-key (kbd "M-]") 'point-redo)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(require 'server)
(unless (server-running-p)
  (server-start))
(defalias 'exit 'save-buffers-kill-emacs)

(require 'indent-guide)
(indent-guide-global-mode)
;;(set-face-background 'indent-guide-face "dimgray")
;;(setq indent-guide-recursive t)

(require 'dired-details)
;; (dired-details-install)
;; (setq dired-details-hidden-string "")
;; (setq di
(require 'lispxmp) nil)
;; (defadvi
(require 'open-junk-file) find-dired-sentinel (after dired-details (proc state) activate)
;;   (ignor
(yas-global-mode 1)
;;     (wit(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp) (process-buffer proc)
;;       (d(global-set-key (kbd "C-x C-z") 'open-junk-file)))))
(require 'lispxmp)(global-unset-key (kbd "C-x i"))
(require 'open-junk-file)
(setq open-junk-file-find-file-function 'find-file)
(setq open-junk-file-format "~/Dropbox/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
;;(custom-set-variables '(yas-trigger-key "H-i"))
(global-unset-key (kbd "C-x i"))(yas-global-mode 1)
ce
h-current-buffere-errors
red-details-hide-link-targetsired-details-activate
(global-set-key (kbd "C-x i i") 'yas-insert-snippet)
(global-set-key (kbd "C-x i n") 'yas-new-snippet)
(global-set-key (kbd "C-x i v") 'yas-visit-snippet-file)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "H-i") 'yas-expand-from-trigger-key)

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
sarch-mode-map (kbdssdddffffdsaasdfsdfsdfff "C-o")occur-from-isearch)	  df
sm-map (kbd "C-c C-ssdddffffdsaasdfsdfsdfffa") 'alhelm-occur)		  df
asdsfffdsaasdfsdfsdfffents-frt t)			  df
selm-completi ng-reassdddffffdsaasdfsdfsdfffd-handlst '(find-alternate-file . nidfl
s-delete-minibufferssdddffffdsaasdfsdfsdfff-contenore helm-emulate-kill-line acdft)
sffer-substring (possdddffffdsaasdfsdfsdfffint) (fd))))			  d
sm-find-files-map (ssdddffffdsaasdfsdfsdfffkbd "TAlm-execute-persistent-action)df
sm-read-file-map (kssdddffffdsaasdfsdfsdfffbd "TABm-execute-persistent-action) df

(require 'flex-autopair)
(flex-autopair-mode 1)

;; (require 'autopair)
;; (autopair-global-mode 1)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode t)
asdfasdff;; (sp-pair "<%" "%>")ddsssas
asdfasdffddsssas
asdfasdff(asdfasdffrequire 'casssdf





asdfasdfaolor-moccur)ddsssasddsssas
asdfasdff;asdfasdff;(global-sasssdf





asdfasdfaet-key (kbd "M-o") 'occur-by-moccur)ddsssasddsssas
asdfasdffaasdfasdffddsssasddsasssdf





asdfasdfassas
asdfasdffaa(add-to-list 'dmocasssdf





asdfasdfacur-exasdfasdffddsssasddsssas
asdfasdffaa(add-to-asdfasdffaasssdf





asdfasdfasdfasdffddsssasddsssasddsssas
asdfasdffaa	      asdfasdasssdf





asdfasdfaffasdfasdffasdfasdffddsssasddsssasddsssasddsssas
asdfasdffddsssas
asdfasasssdf





asdfasdfadff;; (set-face-aasssdf





asdfasdfattribute 'mode-line nilddsssas
asdfasdff;;            asssdf





asdfasdfa         :foreground "#fff"ddsssas
asdfasdff;;            asssdf





asdfasdfa         :background "#FF0066"ddsssas
asdfasdff;;            asssdf





asdfasdfa         :box nil)ddsssas
asdfasdff(set-face-attrasssdf





asdfasdfaibute 'powerline-active1 nilddsssas
asdfasdff              asssdf


dasssdf
dasssdf
dasssdf
dasssdfasdfasdfa      :foreground "#000"ddsssas
dasssdfasdfasdff              asssdf
dasssdf
dasssdf
dasssdf
dasssdf
dasssdf
dasssdfasdfasdfa      :dasssdfbackground "#66ccff" ;"#FF6699"ddsssas
dasssdfasdfasdff       dasssdf             :inherit 'mode-line)ddsssas
dasssdfasdfasdff(set-fadasssdfce-attribute 'powerline-active2 nilddsssas
dasssdfasdfasdff       dasssdf             :foreground "#000"ddsssas
dasssdfasdfasdff       dasssdf             :background "#ffaeb9"ddsssas
dasssdfasdfasdff   aadfasdsssss    dasssdf             :inherit 'mode-line)ddsssas
dasssdfasdfasdffddsaadfasdsssssssasdasssdf
dasssdfasdfasdffdkjaadfasdsssssjask;; dasssdf最近使ったファイルをdkjjaskメニューに表示ddsssas
dasssdfasdfasdff(r0. paaaaaaeaadfasdsssssquire 'dasssdfrecentf)ddsssasdkjjask
dasssdfasdfasdff(r1. paaaaaaeaadfasdssssscentf-mdasssdfode tdkjjask)ddsssas
dasssdfasdfasdff(s2. paaaaaaeaadfasdssssstq recedasssdfntf-max-menu-items 50)sssssssdasdsas
dasssdfasdfasdff(s3. paaaaaaeaadfasdssssstq recedasssdfntf-maxdkjjaskdkjjask-saved-items 3000)sssssssdasdsas
dasssdfasdfasdffss4. paaaaaasaadfasdsssssssssdasdasssdfdsas
dasssdfasdfasdffss5. paaaaaasaadfasdsssssssssdasdasssdfdsasdkjjask
dasssdfasdfasdffdk6. paaaaaajaadfasdsssssjask(require 'undohist)sssssssdasdsasdkjjask
dasssdfasdfasdff(u7. paaaaaanaaaaaaaadfasdsssssdohist-initialize)sssssssdasdsasdkjjask
dasssdfasdfasdffss8. paaaaaasaaaaaaaadfasdsssssssssdasdsas
dasssdfasdfasdff(r9. paaaaaaeaaaaaaaadfasdsssssquire 'undo-treedkjjask)sssssssdasdsas
dasssdfasdfasdff(g10. paaaaaalaadfasdsssssobal-undo-tree-modedkjjaskdkjjask t)sssssssdasdsas
dasssdfasdfasdff;;Maadfaaaaaaasdsssss-(C-)/    C-x udkjjask :show tree   d:detailssssssssdasdsas
dasssdfasdfasdff;;(aadfaaaaaaasdsssssglobal-set-key (kbd "M-/") 'undo-tree-redo)sssssssdasdsas
dasssdfasdfasdffsssaadfaaaaaaasdsssssssssdasdsas
dasssdfasdfasdff;;taadfaaaaaaasdsssssab modesssssssdasdsas
asdfasdff(when (reqaadfasdsssssuire 'tabbar nil t)sssssssdasdsas
asdfasdff  (tabbar-mode))ssssssssssdasdsas
asdfasdff;; グループ化しないssssssssssdasdsas
asdfasdff(setq tabbar-buffersss-groups-function nil)sssssssdasdsas
asdfasdff;; Firefoxライクなsssキーバインドにsssssssdasdsas
asdfasdff(global-set-key [(control tab)]       'tabbar-forward)sssssssdasdsas
asdfasdff(global-set-key [(control shift tab)] 'tabbar-backward)sssssssdasdsas
asdfasdffsssssssdasdsas
asdfasdff;;最後の変更箇所にジャンプするsssssssdasdsas
asdfasdff(require 'goto-chg)sssssssdasdsas
asdfasdff(define-key global-map (kbd "C-8") 'goto-last-change)sssssssdasdsas
asdfasdff(define-key global-map (kbd "C-*") 'goto-last-change-reverse)sssssssdasdsas
asdfasdffsssssssdasdsas
asdfasdff(require 'key-combo)sssssssdasdsas
asdfasdff;; (key-combo-load-default)sssssssdasdsas
asdfasdff(key-combo-define-global (kbd "<") '("<"))ddsssas
asdfasdffddsssas
asdfasdff;; smart-compileddsssas
asdfasdff(require 'smarter-compile)ddsssas
asdfasdff(global-set-key (kbd "C-x c") 'smarter-compile)ddsssas
asdfasdff(global-set-key (kbd "C-x C-x") (kbd "C-x c C-m"))ddsssas
asdfasdffddsssas
asdfasdffddsssas
asdfasdff;; ;;highlightddsssas
asdfasdff;; (require 'highlight-symbol)ddsssas
asdfasdff;; (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれるddsssas
asdfasdff;; (global-set-key (kbd "C-3") 'highlight-symbol-at-point)ddsssas
asdfasdff;; (global-set-key (kbd "C-M-3") 'highlight-symbol-remove-all)ddsssas
asdfasdffddsssas
asdfasdffasdfasdffddsssasddsssas
