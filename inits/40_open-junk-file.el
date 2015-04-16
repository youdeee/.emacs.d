(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file)
(setq open-junk-file-format "~/Dropbox/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
(setq open-junk-file-find-file-function 'find-file)
