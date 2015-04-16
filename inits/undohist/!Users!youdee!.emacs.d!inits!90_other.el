
((digest . "220c1f7426a3c558c72f7634e4f0b8a5") (undo-list nil (2845 . 2847) (t 21806 40117 0 0) nil ("					" . -2388) ((marker . 2388) . -1) 2394 nil (2393 . 2394) (t 21806 39891 0 0) nil ("
" . -2970) ((marker . 3641) . -1) ((marker . 270) . -1) ((marker . 270) . -1) ((marker . 2968) . -1) nil ("
" . -2971) nil (";; 最近使ったファイルをメニューに表示
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 3000)
" . 2971) ((marker . 163) . -90) ((marker . 163) . -90) ((marker . 143) . -126) ((marker . 143) . -126) ((marker . 210) . -57) ((marker . 210) . -57) ((marker . 245) . -40) ((marker . 245) . -40) ((marker) . -126) nil ("(require 'open-junk-file)
(global-set-key (kbd \"C-x C-z\") 'open-junk-file)
(setq open-junk-file-format \"~/Dropbox/junk/%Y/%m/%Y-%m-%d-%H%M%S.\")
(setq open-junk-file-find-file-function 'find-file)

" . 1437) ((marker) . -197) 1634 (t 21806 39827 0 0) nil ("
" . -866) ((marker . 3641) . -1) ((marker . 2968) . -1) nil ("(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
" . 867) ((marker) . -83) nil ("(helm-mode 1)
(helm-descbinds-mode 1)
(setq helm-split-window-default-side 'right)
(require 'helm-ag)
(global-set-key (kbd \"M-x\") 'helm-M-x)
(global-set-key (kbd \"C-x f\") 'helm-mini)
(global-set-key (kbd \"C-c C-f\") 'helm-find-files)
(global-set-key (kbd \"C-c s\") 'helm-ag)
(global-set-key (kbd \"M-y\")     'helm-show-kill-ring)
(global-set-key (kbd \"C-c i\")   'helm-imenu)
(global-set-key (kbd \"C-x b\")   'helm-buffers-list)
(define-key helm-map (kbd \"C-h\") 'delete-backward-char)
(global-set-key (kbd \"M-o\") 'helm-occur)
(define-key isearch-mode-map (kbd \"C-o\") 'helm-occur-from-isearch)
(define-key helm-map (kbd \"C-c C-a\") 'all-from-helm-occur)
(setq helm-css-scss-split-direction 'split-window-horizontally)
;;(global-set-key (kbd \"C-c C-;\") 'ac-complete-with-helm)
;;(define-key ac-complete-mode-map (kbd \"C-c C-;\") 'ac-complete-with-helm)

;; Disable helm in some functions
(setq helm-delete-minibuffer-contents-from-point t)
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  (kill-new (buffer-substring (point) (field-end))))
(define-key helm-find-files-map (kbd \"TAB\") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd \"TAB\") 'helm-execute-persistent-action)
" . 2231) ((marker . 1950) . -1011) ((marker . 163) . -931) ((marker . 163) . -931) ((marker . 143) . -1011) ((marker . 143) . -1011) ((marker . 84) . -1095) ((marker . 84) . -1095) ((marker . 52) . -1148) ((marker . 52) . -1148) ((marker . 51) . -1225) ((marker . 51) . -1225) ((marker . 1) . -1301) ((marker . 1) . -1301) ((marker . 1) . -521) ((marker) . -1301) 3532 (t 21806 30790 0 0) nil (";;mardkown-mode
(autoload 'markdown-mode \"markdown-mode\"
  \"Major mode for editing Markdown files\" t)
(add-to-list 'auto-mode-alist '(\"\\\\.text\\\\'\" . markdown-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.markdown\\\\'\" . markdown-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.md\\\\'\" . markdown-mode))

;; ;;==========================================================
;; ;;         web-modeの設定
;; ;;==========================================================

(require 'web-mode)
(add-to-list 'auto-mode-alist '(\"\\\\.html?\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.phtml\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.tpl\\\\.php\\\\'\" . web-mode))
;;(add-to-list 'auto-mode-alist '(\"\\\\.php\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.[gj]sp\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.as[cp]x\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.erb\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.mustache\\\\'\" . web-mode))
(add-to-list 'auto-mode-alist '(\"\\\\.djhtml\\\\'\" . web-mode))

(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  (setq web-mode-comment-style 2)
  ;; 終了タグの自動補完をしない
  ;; (setq web-mode-disable-auto-pairing t)
  ;; (setq web-mode-disable-css-colorization t)
  (setq web-mode-enable-block-faces t)
  (custom-set-faces
   '(web-mode-server-face
     ((t (:background \"grey\"))))                  ; template Blockの背景色
   '(web-mode-css-face
     ((t (:background \"grey18\"))))                ; CSS Blockの背景色
   '(web-mode-javascript-face
     ((t (:background \"grey36\"))))                ; javascript Blockの背景色
   )
  (setq web-mode-enable-heredoc-fontification t)
  )
(add-hook 'web-mode-hook  'web-mode-hook)
;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground \"#D9333F\"))))
 '(web-mode-css-at-rule-face ((t (:foreground \"#FF7F00\"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground \"#FF7F00\"))))
 '(web-mode-css-rule-face ((t (:foreground \"#A0D8EF\"))))
 '(web-mode-doctype-face ((t (:foreground \"#82AE46\"))))
 '(web-mode-html-attr-name-face ((t (:foreground \"#C97586\"))))
 '(web-mode-html-attr-value-face ((t (:foreground \"#82AE46\"))))
 '(web-mode-html-tag-face ((t (:foreground \"#E6B422\" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground \"#D9333F\")))))

(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
;;(add-hook 'html-mode-hook 'rainbow-mode)
" . 5497) nil (";; ;; ruby
;; (require 'ruby-mode)
;; (autoload 'ruby-mode \"ruby-mode\" \"Major mode for ruby files\" t)
;; (add-to-list 'auto-mode-alist '(\"\\\\.rb\" . ruby-mode))
;; (add-to-list 'auto-mode-alist '(\"Capfile$\" . ruby-mode))
;; (add-to-list 'auto-mode-alist '(\"Gemfile$\" . ruby-mode))
;; (add-to-list 'interpreter-mode-alist '(\"ruby\" . ruby-mode))


;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (setq tab-width 2)
;;              (setq ruby-indent-level tab-width)
;;              (setq ruby-deep-indent-paren-style nil)
;; 	     (defadvice ruby-indent-line (after unindent-closing-paren activate)
;; 	       (let ((column (current-column))
;; 		     indent offset)
;; 		 (save-excursion
;; 		   (back-to-indentation)
;; 		   (let ((state (syntax-ppss)))
;; 		     (setq offset (- column (current-column)))
;; 		     (when (and (eq (char-after) ?\\))
;; 				(not (zerop (car state))))
;; 		       (goto-char (cadr state))
;; 		       (setq indent (current-indentation)))))
;; 		 (when indent
;; 		   (indent-line-to indent)
;; 		   (when (> offset 0) (forward-char offset)))))
;; ))

;; (require 'ruby-block)
;; (ruby-block-mode t)
;; (setq ruby-block-highlight-toggle t)

;; (require 'ruby-end)
;; (add-hook 'ruby-mode-hook
;;   '(lambda ()
;;     (abbrev-mode 1)
;; ;;    (electric-pair-mode t)
;; ;;    (electric-indent-mode t)
;;     (electric-layout-mode t)))

;; ;; rcodetools
;; (require 'rcodetools)
;; (setq rct-find-tag-if-available nil)
;; (defun ruby-mode-hook-rcodetools ()
;;   (define-key ruby-mode-map \"\\M-\\C-i\" 'rct-complete-symbol)
;;   (define-key ruby-mode-map \"\\C-c\\C-t\" 'ruby-toggle-buffer)
;;   (define-key ruby-mode-map \"\\C-c\\C-f\" 'rct-ri))
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

" . 5353) nil (";; (require 'flycheck)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; ;; (flycheck-add-next-checker 'javascript-jshint
;; ;;                            'javascript-gjslint)
;; ;; Python
;; (add-hook 'python-mode-hook 'flycheck-mode)
;; ;; Ruby
;; (add-hook 'ruby-mode-hook 'flycheck-mode)

" . 4680) nil ("(add-to-list 'auto-mode-alist '(\"\\\\.js$\" . js2-mode))
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))

;;  ;;js3-mode
;;  (custom-set-variables
;;   '(anzu-deactivate-region t)
;;   '(anzu-mode-lighter \"\")
;;   '(anzu-search-threshold 1000)
;;   '(js3-auto-indent-p t)
;;   '(js3-lazy-commas t)
;;   '(js3-lazy-dots t)

;; ;;  '(coffee-tab-width 2)
;; ;;  '(js3-curly-indent-offset 0)
;; ;;  '(js3-expr-indent-offset 2)
;; ;;  '(js3-indent-on-enter-key t)
;; ;;  '(js3-lazy-operators t)
;; ;;  '(js3-paren-indent-offset 2)
;; ;;  '(js3-square-indent-offset 2)
;;   )
;; (autoload 'js3-mode \"js3-mode\" nil t)
;; (add-to-list 'auto-mode-alist '(\"\\\\.js$\" . js3-mode))

;;coffee-mode tab
;; (add-to-list 'ac-modes 'coffee-mode) ;; coffee-modeでACを使えるようにする
;; (add-hook 'coffee-mode-hook
;;   '(lambda ()
;;     (add-to-list 'ac-dictionary-files \"~/.emacs.d/dict/javascript-mode\")
;; ))

;; (require 'slim-mode)
;; (add-to-list 'ac-modes 'slim-mode) ;; coffee-modeでACを使えるようにする
;; (add-hook 'slim-mode-hook
;;   '(lambda ()
;;     (add-to-list 'ac-dictionary-files \"~/.emacs.d/dict/ruby-mode\")
;; ))

;; (require 'sass-mode)
;; (add-to-list 'ac-modes 'sass-mode) ;; coffee-modeでACを使えるようにする

;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '(\"\\\\.yml$\" . yaml-mode))
;;  ;; (add-hook 'yaml-mode-hook
;;  ;;    '(lambda ()
;;  ;;       (define-key yaml-mode-map \"\\C-m\" 'newline-and-indent)))

;; (require 'scss-mode)
;; (add-to-list 'ac-modes 'scss-mode) ;; coffee-modeでACを使えるようにする
;; (add-to-list 'auto-mode-alist '(\"\\\\.scss$\" . scss-mode))
;; (defun scss-custom ()
;;   \"scss-mode-hook\"
;;   (and
;;    (set (make-local-variable 'css-indent-offset) 2)
;;    (set (make-local-variable 'scss-compile-at-save) nil)
;;    )
;;   )
;; (add-hook 'scss-mode-hook
;;   '(lambda() (scss-custom)))
;; ;;smart-indent-rigid
;; (add-hook 'haml-mode-hook 'smart-indent-rigidly-mode)
;; (add-hook 'coffee-mode-hook 'smart-indent-rigidly-mode)
;; (add-hook 'sass-mode-hook 'smart-indent-rigidly-mode)

" . 3533) 5799 nil (8262 . 8263) (t 21806 30574 0 0) nil ("
" . -7824) nil ("
" . -7825) nil (";; ;http://shibayu36.hatenablog.com/entry/2013/12/30/190354
;; ;multiple-cursor.elの設定を調整してみた
;; (require 'multiple-cursors)
;; (declare-function smartrep-define-key \"smartrep\")
;; (global-set-key (kbd \"C-M-c\") 'mc/edit-lines)
;; (global-set-key (kbd \"C-M-r\") 'mc/mark-all-in-region)
;; (smartrep-define-key global-map \"C-i\"
;;   '((\"C-i\"      . 'mc/mark-next-like-this)
;;     (\"n\"        . 'mc/mark-next-like-this)
;;     (\"p\"        . 'mc/mark-previous-like-this)
;;     (\"m\"        . 'mc/mark-more-like-this-extended)
;;     (\"u\"        . 'mc/unmark-next-like-this)
;;     (\"U\"        . 'mc/unmark-previous-like-this)
;;     (\"s\"        . 'mc/skip-to-next-like-this)
;;     (\"S\"        . 'mc/skip-to-previous-like-this)
;;     (\"*\"        . 'mc/mark-all-like-this)
;;     (\"d\"        . 'mc/mark-all-like-this-dwim)
;;     (\"i\"        . 'mc/insert-numbers)
;;     (\"o\"        . 'mc/sort-regions)
;;     (\"O\"        . 'mc/reverse-regions)))" . 7826) nil (";;(require 'smartrep)
" . 7826) 7848 nil undo-tree-canary))
