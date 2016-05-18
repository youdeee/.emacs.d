(require 'highlight-symbol)

(setq highlight-symbol-colors '("#D500F9" "#3D5AFE" "#76FF03" "#FF9100" "#ff1744" "#00E5FF"))

;; (defun highlight-symbol-or-region (highlight-symbol &rest args)
;;   (cond ((and (called-interactively-p 'interactive) transient-mark-mode (not mark-active))
;;          (apply highlight-symbol args))
;;         (t
;;          (let ((reg (buffer-substring (mark) (point))))
;;            (if (highlight-symbol-symbol-highlighted-p reg)
;;                (highlight-symbol-remove-symbol reg)
;;              (highlight-symbol-add-symbol reg)
;;              (when (member 'explicit highlight-symbol-occurrence-message)
;;                (highlight-symbol-count reg t)))
;;            (highlight-symbol-add-symbol reg))
;;          )))
;; (advice-add #'highlight-symbol :around #'highlight-symbol-or-region)

;;"yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"
;;("DarkOrange" "DodgerBlue1" "DeepPink1"))

;; (require 'auto-highlight-symbol)
;; (global-auto-highlight-symbol-mode t )
