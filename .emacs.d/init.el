(setq load-path
      (append (mapcar #'expand-file-name
		      '("~/.emacs.d/"
			"~/.emacs.d/site-lisp/"
			"~/.emacs.d/plugins/yasnippet/"))
	      load-path))

(mapc #'load
      '("config/anything-config"
	"config/auto-install-config"
	"config/auto-complete-config"))

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

(defalias 'qrr 'query-replace-regexp)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'message-box 'message)
