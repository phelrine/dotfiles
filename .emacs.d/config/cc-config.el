(require 'hideshow)

(dolist (hook '(c++-mode-hook c-mode-hook))
  (add-hook hook (lambda ()
                   (hs-minor-mode t)
                   (hs-hide-all))))
