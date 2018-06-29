					; http://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html
(require 'server)
(or (server-running-p)
    (server-start))

					; http://ergoemacs.org/emacs/organize_your_dot_emacs.html
(require 'bytecomp)
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

					; byte compile if .elc exists
(add-hook 'after-save-hook 'byte-compile-current-buffer)

;(add-to-list 'load-path "d:/Cygwin/opt/elisp/org-mode/lisp")
;(add-to-list 'load-path "d:/Cygwin/opt/elisp/org-mode/contrib/lisp" t)

					; use Dropbox but not MobileOrg
(require 'org)
(let ((BY-org-directory
       (concat
	(file-name-as-directory 
	 (getenv "USERPROFILE"))
	"Dropbox/org")))
  (if (file-directory-p BY-org-directory)
      (setq org-directory BY-org-directory)))

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
 '(org-agenda-files (quote ("c:/Users/byuan/Dropbox/org/TODO.org")))
 '(org-ascii-charset (quote utf-8))
 '(org-ascii-table-use-ascii-art t)
 '(org-ascii-text-width 1024)
 '(org-export-backends (quote (ascii odt confluence)))
 '(org-export-copy-to-kill-ring (quote if-interactive))
 '(org-export-preserve-breaks t)
 '(org-export-show-temporary-export-buffer nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(require 'cl)
;(require 'ox-confluence)
