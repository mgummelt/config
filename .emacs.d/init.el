;; load path
(add-to-list 'load-path "~/.emacs.d/src")

;; require
(require 'package)
(require 'pymacs)
(require 'uniquify)
(require 'annot)

;; custom require
(require 'init-autorevert)
(require 'init-browse-url)
(require 'init-css-mode)
(require 'init-desktop)
(require 'init-editing-utils)
(require 'init-ido)
(require 'init-indent)
(require 'init-javascript-mode)
(require 'init-octave-mode)
(require 'init-org)
(require 'init-package)
(require 'init-paren)
(require 'init-prog-mode)
(require 'init-rxjs-mode)
(require 'init-scroll-bar)
(require 'init-simple)
(require 'init-text-mode)
(require 'init-tool-bar)
(require 'init-uniquify)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-baseline-alist (quote (("/tmp/proj1/" . "master"))) t)
 '(grep-command "grep -niIR ")
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face trailing lines-tail)
     (require-final-newline . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
