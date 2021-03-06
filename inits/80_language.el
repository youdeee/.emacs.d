(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
;; (flycheck-add-next-checker 'javascript-jshint
;;                            'javascript-gjslint)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;; (add-hook 'js2-jsx-mode-hook 'flycheck-mode)
;; (setq js2-basic-offset 2)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(defun no-line-break ()
  (setq-local electric-layout-rules
              '((?\{ . after) (?\} . before))))
(add-hook 'js2-mode-hook 'no-line-break)

;;  ;;js3-mode
;;  (custom-set-variables
;;   '(anzu-deactivate-region t)
;;   '(anzu-mode-lighter "")
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
;; (autoload 'js3-mode "js3-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;;coffee-mode tab
;; (add-to-list 'ac-modes 'coffee-mode) ;; coffee-modeでACを使えるようにする
;; (add-hook 'coffee-mode-hook
;;   '(lambda ()
;;     (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/javascript-mode")
;; ))

;; (require 'slim-mode)
;; (add-to-list 'ac-modes 'slim-mode) ;; coffee-modeでACを使えるようにする
;; (add-hook 'slim-mode-hook
;;   '(lambda ()
;;     (add-to-list 'ac-dictionary-files "~/.emacs.d/dict/ruby-mode")
;; ))

;; (require 'sass-mode)
;; (add-to-list 'ac-modes 'sass-mode) ;; coffee-modeでACを使えるようにする

;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;  ;; (add-hook 'yaml-mode-hook
;;  ;;    '(lambda ()
;;  ;;       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.\\(scss\\|css\\)\\'" . scss-mode))
(add-hook 'scss-mode-hook 'custom-scss-mode-hook)
;; (add-hook 'scss-mode-hook 'ac-css-mode-setup)
;; (add-hook 'scss-mode-hook 'auto-complete-mode)
;; (add-to-list 'ac-modes 'scss-mode)

(defun custom-scss-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq css-indent-offset 2)
 (setq scss-compile-at-save nil))

;; (defun scss-custom ()
;;   "scss-mode-hook"
;;   (and
;;    (set (make-local-variable 'css-indent-offset) 2)
;;    (set (make-local-variable 'scss-compile-at-save) nil)))
;; (add-hook 'scss-mode-hook
;;   '(lambda() (scss-custom)))
;; ;;smart-indent-rigid
;; (add-hook 'haml-mode-hook 'smart-indent-rigidly-mode)
;; (add-hook 'coffee-mode-hook 'smart-indent-rigidly-mode)
;; (add-hook 'sass-mode-hook 'smart-indent-rigidly-mode)


;;mardkown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))

(defun custom-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  (setq web-mode-comment-style 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-block-padding 2)
  ;; 終了タグの自動補完をしない
  ;; (setq web-mode-disable-auto-pairing t)
  ;; (setq web-mode-disable-css-colorization t)
  (setq web-mode-enable-block-faces t)
  (setq web-mode-enable-heredoc-fontification t)
  (setq indent-tabs-mode nil))
(add-hook 'web-mode-hook  'custom-web-mode-hook)

(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
(add-hook 'emacs-lisp-mode 'rainbow-mode)
;;(add-hook 'html-mode-hook 'rainbow-mode)

(setq inferior-lisp-program "clisp")
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))
(require 'ac-slime)
;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;(add-hook emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)
