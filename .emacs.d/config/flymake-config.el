(require 'flymake)
(require 'flymake-cursor)

(set-face-background 'flymake-errline "tomato")
(set-face-background 'flymake-warnline "gold")

(add-hook 'find-file-hook 'flymake-find-file-hook)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes"  (list local-file))))
(push '("\\.py\\'" flymake-pyflakes-init) flymake-allowed-file-name-masks)



