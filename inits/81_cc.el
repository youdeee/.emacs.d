(defun custom-c-mode-hook ()
  (define-key c-mode-base-map ";" nil)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4))

(add-hook 'c-mode-hook 'custom-c-mode-hook)
(add-hook 'c++-mode-hook 'custom-c-mode-hook)
