(require 'popwin)
(popwin-mode 1)
(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
(setq popwin:popup-window-height 0.55)
;;(setq popwin:close-popup-window-if-necessary t)
;;(setq popwin:adjust-other-windows t)
