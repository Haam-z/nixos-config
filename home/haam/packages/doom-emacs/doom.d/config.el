(setq user-full-name "Haam"
      user-mail-address "hamzazarouk@gmail.com")
(setq doom-theme 'doom-tokyo-night)
(setq doom-font (font-spec :family "Fira Code Nerd Font" :size 18 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 13))
(setq display-line-numbers-type 'relative)

(add-hook-ellipsis " ▼ "
      org-log-done 'time
      org-journal-dir "~/Org/journal/"
      org-journal-date-format "%B %d, %Y (%A) "
      org-journal-file-format "%Y-%m-%d.org"
      org-hide-emphasis-markers t)
(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)

(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
