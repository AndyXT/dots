(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visual-bell t)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 150)

(load-theme 'tango-dark)

(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(setq org-directory "/home/axtreto/tools/emacs-from-scratch/org")
(setq org-capture-templates
      '(("t" "todo" entry (file+headline (lambda()
					   (expand-file-name
					    (format-time-string "%Y-%m-%d-GTD.org")
					    org-directory))
					 "Tasks")
	 "* TODO %<%Y%m%d%H%M%S> %^{Task Name}\n- %?\n %i\n %a")
	("j" "Journal" entry (file+olp+datetree (lambda()
					   (expand-file-name
					    (format-time-string "%Y-%m-journal.org")
					    org-directory)))
         "* %?\nEntered on %U\n  %i\n  %a")))
(add-to-list 'org-capture-templates
             '("p" "project" plain
               (file (lambda() (expand-file-name
				(format "%s-%s.org" (format-time-string "%Y-%m-%d") (read-string "Name: "))
				org-directory)))
               "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"))
(define-key global-map (kbd "C-c t")
  (lambda () (interactive) (org-capture nil "t")))
(define-key global-map (kbd "C-c j")
  (lambda () (interactive) (org-capture nil "j")))
(define-key global-map (kbd "C-c p")
  (lambda () (interactive) (org-capture nil "p")))
