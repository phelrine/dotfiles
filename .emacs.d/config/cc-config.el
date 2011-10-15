(require 'hideshow)

(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c c") 'compile)
            (hs-minor-mode t)))
