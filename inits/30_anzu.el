(global-anzu-mode +1)

;;(setq anzu-use-migemo t)
;;(setq anzu-minimum-input-length 3)

(custom-set-variables
 '(anzu-mode-lighter " az")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 500)
 '(anzu-use-migemo nil)
 )

;; set-key
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c R") 'anzu-query-replace-at-cursor-thing)
