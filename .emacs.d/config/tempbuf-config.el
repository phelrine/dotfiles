(require 'tempbuf)

(dolist (hook '(view-mode-hook
                apropos-mode-hook
                magit-mode-hook
                dired-mode-hook
                find-file-hook))
  (add-hook hook 'turn-on-tempbuf-mode))
