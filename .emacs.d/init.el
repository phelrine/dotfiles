(let* ((home (getenv "HOME"))
       (eprefix (concat home "/Gentoo")))
  (setq exec-path `(,(concat home "/bin") ,(concat eprefix "/usr/bin") ,(concat eprefix "/bin") "/usr/local/bin" ,@exec-path))
  (setenv "PATH" (concat home "/bin:" eprefix "/usr/bin:" eprefix "/bin:" "/usr/local/bin:" (getenv "PATH")))
  (setenv "LANG" "C"))

(setq load-path
      (append (mapcar
               #'expand-file-name
               '("~/.emacs.d/site-lisp/" "~/.emacs.d/yasnippet/"))
              load-path))
(let ((default-directory  "~/.emacs.d/modules/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (normal-top-level-add-subdirs-to-load-path))
         load-path)))

(require 'yasnippet-config)
(require 'auto-complete-config)
(require 'cedet)
(require 'open-junk-file)
(require 'switch-window)
(require 'undo-tree)
(global-undo-tree-mode)

(require 'dropdown-list)
(yas/setup "~/.emacs.d/yasnippet")
(setq yas/prompt-functions '(yas/dropdown-prompt yas/completing-prompt))

(if (fboundp 'semantic-load-enable-code-helpers)
    (semantic-load-enable-code-helpers))

(ac-config-default)
(add-hook 'find-file-hook 'auto-complete-mode)

(let ((config-dir "~/.emacs.d/config/"))
  (mapc (lambda (config)
          (load (concat config-dir (replace-regexp-in-string "\\.el$" "" config))))
        (directory-files config-dir nil "\\.el$")))

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
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  nil)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'other-window)
(windmove-default-keybindings)

(require 'jaunte)
(global-set-key (kbd "C-c C-j") 'jaunte)

(require 'hideshow)
(global-set-key (kbd "C-t") 'hs-toggle-hiding)

(require 'anything-startup)
(setq anything-enable-shortcuts 'alphabet)
(global-set-key (kbd "C-x C-b") 'anything-buffers+)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

(autoload 'dmacro-exec "dmacro" nil t)
(defconst *dmacro-key* (kbd "<f5>") "繰返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)

(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(require 'saveplace)
(setq-default save-place t)

(require 'savehist)
(savehist-mode 1)
(setq history-length 5000)

(setq make-backup-files nil)
(setq-default tab-width 4
              indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-auto-revert-mode 1)

(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

(defalias 'qrr 'query-replace-regexp)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'message-box 'message)

(when (eq (window-system) 'ns)
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("Hiragino_Kaku_Gothic_ProN" . "iso10646-1"))
  (set-fontset-font "fontset-default"
                    'katakana-jisx0201
                    '("Hiragino_Kaku_Gothic_ProN" . "iso10646-1")))

