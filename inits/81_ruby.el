(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(setq ruby-insert-encoding-magic-comment nil)

;; ruby-modeのインデントを改良する
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'ruby-end)
(add-hook 'ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))

;; ;; rcodetools
;; (require 'rcodetools)
;; (setq rct-find-tag-if-available nil)
;; (defun ruby-mode-hook-rcodetools ()
;;   (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
;;   (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
;;   (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

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
;; 		     (when (and (eq (char-after) ?\))
;; 				(not (zerop (car state))))
;; 		       (goto-char (cadr state))
;; 		       (setq indent (current-indentation)))))
;; 		 (when indent
;; 		   (indent-line-to indent)
;; 		   (when (> offset 0) (forward-char offset)))))
;; ))

