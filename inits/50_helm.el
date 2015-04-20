(require 'helm)
(require 'helm-config)
(require 'helm-ag)

(helm-mode 1)
(helm-descbinds-mode 1)
;;(setq helm-split-window-default-side 'right)
(setq helm-recentf-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-locate-fuzzy-match t)
;;(setq helm-autoresize-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x f") 'helm-mini)
(global-set-key (kbd "C-c f") 'helm-find-files) ; C-lで上階層 TABで補完
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-c i")   'helm-imenu)
(global-set-key (kbd "C-c a") 'helm-ag)
(global-set-key (kbd "C-x H-m") 'helm-execute-kmacro)
;;(global-set-key (kbd "M-o") 'helm-ag-this-file)
(global-set-key (kbd "M-o") 'helm-occur)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;;(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)
;;(global-set-key (kbd "C-x b")   'helm-buffers-list)
;;(setq helm-css-scss-split-direction 'split-window-horizontally)
;;(global-set-key (kbd "C-c C-;") 'ac-complete-with-helm)
;;(define-key ac-complete-mode-map (kbd "C-c C-;") 'ac-complete-with-helm)



;; mini bufferでもkill ring使えるように
(setq helm-delete-minibuffer-contents-from-point t)
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  (kill-new (buffer-substring (point) (field-end))))

;; find fileのときにTAB押すと新しいファイル作るの防ぐ
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

;; ;; フィルタリフィルタリングふぃるたりんぐふぃるたりんｇふぃるたりんふぃるたりｎふぃるたりふぃるたｒふぃるたふぃるｔふぃるふぃｒふぃｆングのロジックをいい感じ
;; (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
;;   "Transform the pattern to reflect my intention"
;;   (let* ((pattern (ad-get-arg 0))
;;          (input-pattern (file-name-nondirectory pattern))
;;          (dirname (file-name-directory pattern)))
;;     (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
;;     (setq ad-return-value
;;           (concat dirname
;;                   (if (string-match "^\\^" input-pattern)
;;                       ;; '^' is a pattern for basename
;;                       ;; and not required because the directory name is prepended
;;                       (substring input-pattern 1)
;;                     (concat ".*" input-pattern))))))
;; (defun helm-buffers-list-pattern-transformer (pattern)
;;   (if (equal pattern "")
;;       pattern
;;     ;; Escape '.' to match '.' instead of an arbitrary character
;;     (setq pattern (replace-regexp-in-string "\\." "\\\\." pattern))
;;     (let ((first-char (substring pattern 0 1)))
;;       (cond ((equal first-char "*")
;;              (concat " " pattern))
;;             ((equal first-char "=")
;;              (concat "*" (substring pattern 1)))
;;             (t
;;              pattern)))))
;; (add-to-list 'helm-source-buffers-list
;;              '(pattern-transformer helm-buffers-list-pattern-transformer))
