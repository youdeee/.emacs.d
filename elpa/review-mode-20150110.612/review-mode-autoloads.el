;;; review-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "review-mode" "review-mode.el" (22015 34282
;;;;;;  0 0))
;;; Generated autoloads from review-mode.el

(autoload 'review-mode "review-mode" "\
Major mode for editing ReVIEW text.

To see what version of ReVIEW mode your are running, enter `\\[review-version]'.

Key bindings:
\\{review-mode-map}

\(fn)" t nil)

(setq auto-mode-alist (append '(("\\.re$" . review-mode)) auto-mode-alist))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; review-mode-autoloads.el ends here
