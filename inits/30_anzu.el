(global-anzu-mode +1)

(setq anzu-use-migemo t)
(setq anzu-minimum-input-length 2)
(setq anzu-mode-lighter " az")
(setq anzu-deactivate-region t)
(setq anzu-search-threshold 500)

;; set-key
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c C-r") 'anzu-query-replace-at-cursor-thing)
