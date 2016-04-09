(require 'csharp-mode)
(setq auto-mode-alist
   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; C#モードフック
(add-hook 'csharp-mode-hook
          '(lambda()
             (setq comment-column 40)
             (setq c-basic-offset 4)
             ;; (font-lock-add-magic-number)
             ;; オフセットの調整
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             (auto-complete-mode)
             (flymake-mode)
             )
          )

;; ;; Gtags設定
;; (require 'gtags)
;; (global-set-key (kbd "C-'") 'gtags-find-tag-other-window)  ; (別バッファで)関数の定義元(関数の実体)へジャンプ
;; (global-set-key (kbd "C-M-'") 'gtags-find-tag)             ; 変数等のジャンプ

;; ;; Flymake
;; (defun flymake-csharp-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "~/.emacs.d/bin/csharp-checker" (list local-file))))
;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.cs$" flymake-csharp-init))
;; (add-to-list 'flymake-err-line-patterns
;;              '("cs\(\\([0-9]+\\),\\([0-9]+\\)\)\: \\(error\\|warning\\) \\(.+\\)$" nil 1 2 4))
;; (add-to-list 'flymake-err-line-patterns
;;              '("LineNumber=\\([0-9]+\\) .* RuleId=\\(.+\\)</Violation" nil 1 1 2))
