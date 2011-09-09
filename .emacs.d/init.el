(setq exec-path `(,(concat (getenv "HOME") "/bin") "/opt/local/bin" ,@exec-path))
(setenv "PATH" (concat (getenv "HOME") "/bin:/opt/local/bin:" (getenv "PATH")))

(setq load-path
      (append (mapcar 
               #'expand-file-name
               '("~/.emacs.d/"
                 "~/.emacs.d/site-lisp/"
                 "~/.emacs.d/plugins/yasnippet/"
                 "~/.emacs.d/plugins/coffee-mode/"))
              load-path))

(require 'yasnippet-config)
(require 'auto-complete-config)
(require 'cedet)

(yas/setup "~/.emacs.d/plugins/yasnippet")
(if (fboundp 'semantic-load-enable-code-helpers)
    (semantic-load-enable-code-helpers))

(ac-config-default)
(add-hook 'c-mode-common-hook 
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-semantic)))
(global-auto-complete-mode t)

(mapc #'load
      '("config/anything-config"
        "config/auto-install-config"
        "config/flymake-config"
        "config/ruby-config"
        "config/coffee-config"))

(progn
  (show-paren-mode 1)
  (global-hl-line-mode 1)
  (set-background-color "gray90")
  (set-face-background 'hl-line "violet")
  (set-face-underline-p 'hl-line "black")
  (display-time)
  (line-number-mode 1)
  (column-number-mode 1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  nil)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'other-window)

(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(require 'saveplace)
(setq-default save-place t)

(require 'savehist)
(savehist-mode 1)
(setq history-length 5000)

(setq backup-inhibited t)
(setq-default tab-width 4 
              indent-tabs-mode nil)

(defalias 'qrr 'query-replace-regexp)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'message-box 'message)
