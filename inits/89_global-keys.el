;;keybind
(global-set-key (kbd "H-i") 'indent-for-tab-command)
(global-set-key [(C h)] 'delete-backward-char)
(global-set-key [(C x)(k)] 'kill-this-buffer)
(global-set-key [(s &)] 'kill-buffer)
(global-set-key [(C S v)] 'scroll-down-command)
(global-set-key [(M p)] 'backward-paragraph)
(global-set-key [(M n)] 'forward-paragraph)
(global-set-key [(M h)] 'backward-kill-word)
(global-set-key (kbd "C-x 5 o") 'transpose-chars)
(global-set-key [(C x) (t)] 'other-frame)
(global-set-key (kbd "s-u") 'browse-url-of-file)
(global-set-key (kbd "M-SPC") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c f") 'fci-mode)
(global-set-key (kbd "s-f") 'auto-fill-mode)
;;(global-set-key (kbd "C-@") 'indent-region)
;;s-f findfile
;;s- whitespace

(defun make-window-when-unsplit ()
  (interactive)
  (if (one-window-p)
      (split-window-right)
    (other-window 1)
    ))
(global-set-key [(C t)] 'make-window-when-unsplit)

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-,") 'backward-kill-line)
