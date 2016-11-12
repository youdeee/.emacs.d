(require 'recentf)

(recentf-mode t)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 3000)
;; (custom-set-variables '(recentf-save-file "~/.emacs.d/cache/.recentf"))
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 'never)
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

(require 'recentf-ext)
