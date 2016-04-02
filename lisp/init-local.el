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

;;; Less obtrusive visible bell
(defun my-terminal-visible-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell       nil
      ring-bell-function #'my-terminal-visible-bell)

;;; Load tide for TypeScript
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode-on)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; Tide can be used along with web-mode to edit tsx files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (company-mode-on))))

(provide 'init-local)
;;; init-local.el ends here
