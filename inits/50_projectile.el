(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile)

(projectile-global-mode t)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
