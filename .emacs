					; http://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html
(require 'server)
(or (server-running-p)
    (server-start))

					; http://ergoemacs.org/emacs/organize_your_dot_emacs.html
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

					; byte compile if .elc exists
(add-hook 'after-save-hook 'byte-compile-current-buffer)

					; use Dropbox but not MobileOrg
(require 'org)
(let ((BY-org-directory
       (concat
	(file-name-as-directory
	 (getenv "HOME"))
	"Dropbox/org")))
  (if (file-directory-p BY-org-directory)
      (setq org-directory BY-org-directory)))

					; https://www.gnu.org/software/emacs/manual/html_mono/org.html#Activation
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

					; http://emacswiki.org/emacs/BackupDirectory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
					; http://emacswiki.org/emacs/AutoSave
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Desktop/TODO/TODO.org" "~/Dropbox/org/TODO.org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (C . t) (python . t))))
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
