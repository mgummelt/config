(provide 'init-org)

(defun find-org-file-recursively (directory &optional filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  (interactive "DDirectory name: ")
  ;; Bind variables
  ;; (if (not (boundp 'directory))
  ;;     (setq directory (read-directory-name "Directory to search: ")))
  (let* (org-file-list
         (case-fold-search t); filesystems are case sensitive
         (fileregex (if filext (format "^[^.#].*\\.\\(%s$\\)" filext)
                      "^[^.#].*\\.\\(org$\\|org_archive$\\)"))
         (cur-dir-list (directory-files directory t "^[^.#].*"))) ; exclude .*
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
        (if (string-match fileregex file-or-dir) ; org files
            (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
        (dolist (org-file (find-org-file-recursively file-or-dir filext)
                          org-file-list) ; add files found to result
          (add-to-list 'org-file-list org-file)))))))

;; org-indent-mode sets org-hide-leading-stars to t
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c C-q") 'org-insert-heading)))
(add-hook 'org-mode-hook (lambda () (local-set-key
                                     (kbd "C-j")
                                     (lambda () (interactive) (other-window -1)))))

(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map [f6] (lambda () (interactive) (org-agenda nil "a")))
(define-key global-map [f5] (lambda () (interactive) (org-agenda nil "s")))
(define-key global-map [f4] (lambda () (interactive) (org-capture nil "o")))

(setq org-agenda-files '("/home/mgummelt/encrypted/org/calendar.org")
      org-agenda-span 'week
      org-agenda-start-on-weekday nil
      org-capture-templates '(("o" "calendar" entry (file+datetree "~/encrypted/org/calendar.org")
                               "* TODO %?\nSCHEDULED: %t\n" :unnarrowed t)
                              ("i" "idea" entry (file+headline "~/notes/business/startups.org" "new ideas") "* %?")
                              ("s" "scratch" plain (file "~/encrypted/org/scratch.org"))
                              ("c" "chore" entry (file "~/encrypted/org/chores.org") "* %?"))
      org-effort-durations '(("h" . 60)
                             ("d" . 1440)
                             ("w" . 10080)
                             ("m" . 43200)
                             ("y" . 518400))
      org-export-with-section-numbers 0
      org-hide-leading-stars nil
      org-html-postamble nil
      org-indent-indentation-per-level 1
      org-log-done 'time
      org-reverse-note-order t
      org-time-clocksum-use-effort-durations t
      org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)" "FAIL(f)" "VOID(v)" )))

(setq-default org-archive-location "~/encrypted/org/.archive/%s::")
