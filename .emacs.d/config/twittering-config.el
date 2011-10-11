(require 'twittering-mode)

(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-scroll-mode t)
(setq twittering-display-remaining t)

(require 'inertial-scroll)
(add-hook 'twittering-mode-hook
          (lambda ()
            (local-set-key (kbd "<wheel-up>") 'inertias-down-wheel)
            (local-set-key (kbd "<wheel-down>") 'inertias-up-wheel)
            (local-set-key (kbd "<mouse-4>") 'inertias-down-wheel)
            (local-set-key (kbd "<mouse-5>") 'inertias-up-wheel)
            (local-set-key (kbd "M-v") 'inertias-down)
            (local-set-key (kbd "C-v") 'inertias-up)
            ))
