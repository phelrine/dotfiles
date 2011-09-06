(require 'flymake)
(require 'flymake-cursor)

(set-face-background 'flymake-errline "red")
(set-face-background 'flymake-warnline "dark slate blue")

(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "pyflakes"  (list local-file))))
(push '("\\.py\\'" flymake-pyflakes-init) flymake-allowed-file-name-masks)

(mapc (lambda (hook) (add-hook hook 'flymake-find-file-hook))
      '(python-mode-hook
	ruby-mode-hook))

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)





