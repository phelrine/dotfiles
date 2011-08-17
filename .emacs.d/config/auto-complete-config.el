(require 'auto-complete-config)
(require 'cedet)
(require 'yasnippet)
(require 'yasnippet-config)

(yas/setup "~/.emacs.d/plugins/yasnippet")

(if (fboundp 'semantic-load-enable-code-helpers)
    (semantic-load-enable-code-helpers))

(ac-config-default)
(add-hook 'c-mode-common-hook 
	  (lambda ()
	    (add-to-list 'ac-sources 'ac-source-semantic)))

(global-auto-complete-mode t)
