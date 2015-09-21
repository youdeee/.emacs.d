(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)

(custom-set-variables
 '(projectile-enable-caching t))
(projectile-global-mode t)
