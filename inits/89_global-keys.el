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
(global-set-key (kbd "C-c C-f") 'fci-mode)
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

(defun start-and-end-macro (arg)
  (interactive "p")
 (if (or defining-kbd-macro executing-kbd-macro)
     (kmacro-end-macro arg)
   (kmacro-start-macro arg)))
(global-set-key (kbd "C-x m") 'start-and-end-macro)

(defun my/filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (let* ((no-kill-buffer-names
          ;; 消さないバッファ名を指定
          (list (buffer-name (current-buffer))
;;                "*Messages*" "*Compile-Log*" "*Help*"
                "*init log*" "*Ibuffer*" "*scratch*"
                "*MULTI-TERM-DEDICATED*"))
         (interested-buffers
          (my/filter
           '(lambda (buffer)
              (and
               ;; donk kill buffers who has the windows displayed in
               (not (get-buffer-window (buffer-name buffer)))
               ;; dont kill hidden buffers (hidden buffers' name starts with SPACE)
               (not (string-match "^ " (buffer-name buffer)))
               ;; dont kill buffers who have running processes
               (let ((proc (get-buffer-process buffer)))
                 (if proc
                     (equal 'exit
                            (process-status
                             (get-buffer-process buffer)))
                   t))))
           (buffer-list)))
         (buffers-to-kill
          (set-difference interested-buffers
                          (mapcar '(lambda (buffer-name)
                                     (get-buffer buffer-name))
                                  no-kill-buffer-names))))
    (mapc 'kill-buffer buffers-to-kill)))
(global-set-key (kbd "C-c C-b C-b") 'kill-other-buffers)

(defun kill-*-buffer ()
  (interactive);;
  (dolist (buffer (list "*helm mini*" "*helm*" "*helm M-x*" "*helm occur*"
			"*helm-ag*" "*Helm Find Files*" "*Helm Help*"
			"*Compile-Log*" "*Help*"
                "*init log*" "*Ibuffer*" "*Backtrace*"
                "*MULTI-TERM-DEDICATED*"))
    (if (get-buffer buffer)
	(kill-buffer buffer))) )
(global-set-key (kbd "M-k") 'kill-*-buffer)
