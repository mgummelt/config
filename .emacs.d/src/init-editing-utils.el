(setq scroll-step 1
      tab-width 4)

(setq-default indent-tabs-mode nil)

(menu-bar-mode 0)

(define-key global-map (kbd "C-a") 'back-to-indentation)
(define-key global-map (kbd "C-l") 'other-window)
(define-key global-map (kbd "M-0") 'delete-window)
(define-key global-map (kbd "M-1") 'delete-other-windows)
(define-key global-map (kbd "M-2") 'split-window-below)
(define-key global-map (kbd "M-3") 'split-window-right)
(define-key global-map [f7] 'call-last-kbd-macro)
(define-key global-map (kbd "C-j") (lambda () (interactive) (other-window -1)))
(define-key global-map (kbd "C-M-n") 'end-of-defun)
(define-key global-map (kbd "C-M-p") 'beginning-of-defun)

(global-set-key "\M-p" "\C-u1\C-v")
(global-set-key "\M-n" "\C-u1\M-v")

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(provide 'init-editing-utils)
