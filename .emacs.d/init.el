;; load path
(add-to-list 'load-path "~/.emacs.d/src")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; file path modes
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

;; el-get
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; requires
(require 'color-theme-tomorrow)
(require 'pymacs)
(require 'uniquify)

;; python
(setq python-shell-interpreter "ipython"
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; rope is making file saving very slow
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport 't
;;       ropemacs-confirm-saving nil
;;       ropemacs-guess-project 't)
;; (define-key ropemacs-local-keymap (kbd "M-.") 'rope-goto-definition)
;; (define-key ropemacs-local-keymap (kbd "M-*") 'rope-pop-mark)

;; colors
(color-theme-tomorrow--define-theme night)

;; hooks
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'prog-mode-hook (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; variables
(setq scroll-step 1
      backup-inhibited t
      make-backup-files nil
      uniquify-buffer-name-style 'post-forward
      standard-indent 2)

(setq-default indent-tabs-mode nil
              tab-width 4
              auto-save-mode nil
              auto-save-default nil
              org-archive-location "~/org/.archive/%s::"
              require-final-newline t)

;; minor modes
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode 1)
(global-auto-revert-mode 1)
(ido-mode 1)
;;(global-auto-complete-mode t)
(show-paren-mode 1)
;(desktop-save-mode 1)

;; keybindings
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

;; org mode
;; move this to dropbox
(load "org_ext.el")
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map [f6] (lambda () (interactive) (org-agenda nil "a")))
(define-key global-map [f5] (lambda () (interactive) (org-agenda nil "s")))
(define-key global-map [f4] (lambda () (interactive) (org-capture nil "o")))

(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c C-q") 'org-insert-heading)))
(add-hook 'org-mode-hook (lambda () (local-set-key
                                     (kbd "C-j")
                                     (lambda () (interactive) (other-window -1)))))
(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-hide-leading-stars nil
      org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)" "FAIL(f)" "VOID(v)" ))
      org-log-done 'time
      org-agenda-span 'week
      org-agenda-files (find-org-file-recursively "~/org")
      org-agenda-start-on-weekday nil
      org-reverse-note-order t
      org-indent-indentation-per-level 1
      browse-url-generic-program (executable-find "google-chrome")
      browse-url-browser-function 'browse-url-generic
      org-capture-templates '(("o" "other" entry (file+datetree "~/org/calendar.org")
                               "* TODO %?\n%^t\n" :unnarrowed t)
                              ("i" "idea" entry (file+headline "~/org/notes/business/startups.org" "new ideas") "* %?")))

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; web mode
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
(setq web-mode-markup-indent-offset 2)






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-baseline-alist (quote (("/tmp/proj1/" . "master"))) t)
 '(grep-command "grep -niIR ")
 '(org-agenda-files (quote ("/home/mgummelt/org/tmp/people.org" "/home/mgummelt/org/tmp/plan.org" "/home/mgummelt/org/tmp/scratch.org" "/home/mgummelt/org/tmp/work.org" "/home/mgummelt/org/projects/habits.org" "/home/mgummelt/org/projects/old/whiplaugh.org_archive" "/home/mgummelt/org/projects/old/whiplaugh.org" "/home/mgummelt/org/projects/old/sys_admin.org" "/home/mgummelt/org/projects/old/socialsearch.org" "/home/mgummelt/org/projects/old/smack.org" "/home/mgummelt/org/projects/old/python_type_checking.org" "/home/mgummelt/org/projects/old/privatebox.org" "/home/mgummelt/org/projects/old/mongo_indexing.org" "/home/mgummelt/org/projects/old/lifting.org" "/home/mgummelt/org/projects/old/housing.org" "/home/mgummelt/org/projects/old/editor.org" "/home/mgummelt/org/projects/old/dns.org" "/home/mgummelt/org/projects/old/cs244final.org" "/home/mgummelt/org/projects/old/bolt.org" "/home/mgummelt/org/projects/old/bitcoin.org" "/home/mgummelt/org/projects/old/art-of-virtue.org" "/home/mgummelt/org/notes/books.org" "/home/mgummelt/org/notes/business/startups.org" "/home/mgummelt/org/notes/business/people.org" "/home/mgummelt/org/notes/business/finances.org" "/home/mgummelt/org/notes/business/economics.org" "/home/mgummelt/org/notes/class.org" "/home/mgummelt/org/notes/cs/tools.org" "/home/mgummelt/org/notes/cs/theory.org" "/home/mgummelt/org/notes/cs/security.org" "/home/mgummelt/org/notes/cs/programming.org" "/home/mgummelt/org/notes/cs/os/operating_systems/linux.org" "/home/mgummelt/org/notes/cs/os/os.org" "/home/mgummelt/org/notes/cs/os/tools/mesos.org" "/home/mgummelt/org/notes/cs/os/tools/docker.org" "/home/mgummelt/org/notes/cs/os/tools/aws.org" "/home/mgummelt/org/notes/cs/networking.org_archive" "/home/mgummelt/org/notes/cs/networking.org" "/home/mgummelt/org/notes/cs/machine_learning.org" "/home/mgummelt/org/notes/cs/languages.org" "/home/mgummelt/org/notes/cs/hardware.org" "/home/mgummelt/org/notes/cs/databases.org" "/home/mgummelt/org/notes/design.org" "/home/mgummelt/org/notes/fashion.org" "/home/mgummelt/org/notes/health/sex.org" "/home/mgummelt/org/notes/health/nutrition.org" "/home/mgummelt/org/notes/health/lifting.org" "/home/mgummelt/org/notes/health/foods.org" "/home/mgummelt/org/notes/health/anatomy.org" "/home/mgummelt/org/notes/history/technology.org" "/home/mgummelt/org/notes/history/science.org" "/home/mgummelt/org/notes/learning.org" "/home/mgummelt/org/notes/math/vector-calculus.org" "/home/mgummelt/org/notes/math/logic.org" "/home/mgummelt/org/notes/math/combinatorics.org" "/home/mgummelt/org/notes/math/calculus.org" "/home/mgummelt/org/notes/math/algebra.org" "/home/mgummelt/org/notes/science/biology.org" "/home/mgummelt/org/notes/self/values.org" "/home/mgummelt/org/notes/self/questions.org" "/home/mgummelt/org/notes/self/methods.org" "/home/mgummelt/org/notes/social/p.org" "/home/mgummelt/org/notes/social/argument.org" "/home/mgummelt/org/notes/work/work.org_archive" "/home/mgummelt/org/notes/work/will.org" "/home/mgummelt/org/notes/work/problems.org" "/home/mgummelt/org/notes/work/ideas.org" "/home/mgummelt/org/notes/work/features.org" "/home/mgummelt/org/notes/writing.org" "/home/mgummelt/org/interests.org" "/home/mgummelt/org/essays/next_step.org" "/home/mgummelt/org/chores.org" "/home/mgummelt/org/calendar.org")))
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
