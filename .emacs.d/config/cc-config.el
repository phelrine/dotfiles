(require 'hideshow)

(require 'flymake)
(defun flymake-local-file ()
  (file-relative-name (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace)
                      (file-name-directory buffer-file-name)))

(defun flymake-c-init ()
  (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" (flymake-local-file))))

(defun flymake-c++-init ()
  (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" (flymake-local-file))))

;; (push '(".+\\.c$" flymake-c-init) flymake-allowed-file-name-masks)
;; (push '(".+\\.cc$" flymake-c++-init) flymake-allowed-file-name-masks)

(dolist (hook '(c++-mode-hook c-mode-hook))
  (add-hook hook (lambda ()
                   (hs-minor-mode t)
                   (flymake-mode t)
                   )))
