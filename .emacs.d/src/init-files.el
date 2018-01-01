(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-files)
