(require 'recentf)

(recentf-mode t)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 3000)
(custom-set-variables '(recentf-save-file "~/.emacs.d/.recentf"))
(setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
(setq recentf-auto-cleanup 'never)
(run-with-idle-timer 30 t '(lambda ()          ;; 30秒ごとに .recentf を保存
   (with-suppressed-message (recentf-save-list))))
(require 'recentf-ext)
