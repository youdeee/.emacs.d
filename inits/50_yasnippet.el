(yas-global-mode 1)

(global-unset-key (kbd "C-x i"))
(global-set-key (kbd "C-x i i") 'yas-insert-snippet)
(global-set-key (kbd "C-x i n") 'yas-new-snippet)
(global-set-key (kbd "C-x i e") 'yas-visit-snippet-file)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "H-i") 'yas-expand-from-trigger-key)

(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  choice)))
         (selected (helm-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*helm yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))