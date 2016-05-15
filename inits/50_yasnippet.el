(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        yas-installed-snippets-dir))

(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(push '("emacs.+/snippets/" . snippet-mode) auto-mode-alist)
(yas-global-mode 1)


;;(require 'yasnippet)
;;(yas-global-mode 1)

;; (defun my-yas/prompt (prompt choices &optional display-fn)
;;   (let* ((names (loop for choice in choices
;;                       collect (or (and display-fn (funcall display-fn choice))
;;                                   choice)))
;;          (selected (helm-other-buffer
;;                     `(((name . ,(format "%s" prompt))
;;                        (candidates . names)
;;                        (action . (("Insert snippet" . (lambda (arg) arg))))))
;;                     "*helm yas/prompt*")))
;;     (if selected
;;         (let (((not  ) (position selected names :test 'equal)))
;;           (nth n choices))
;;       (signal 'quit "user quit!"))))
