;;; Load ESS
(add-to-list 'load-path "/Users/Mike/.emacs.d/elpa/ess-20150529.1125/lisp")
(load "ess-site")

;;; Enable polymode for .Rmd editing
(setq load-path
      (append '("/Users/Mike/.emacs.d/elpa/polymode-20150523.1626"  "/Users/Mike/.emacs.d/elpa/polymode-20150523.1626/modes")
              load-path))
(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;;; Enable ein
(require 'ein)
(setq ein:use-auto-complete t)

(provide 'init-local)

;;; Less obtrusive visible bell
(defun my-terminal-visible-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell       nil
      ring-bell-function #'my-terminal-visible-bell)

;;; init-local.el ends here
