;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(ns-set-resource nil "ApplePressAndHoldEnabled" "NO")
(package-initialize)

(require 'server)
(or (server-running-p)
    (server-start))


(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)


; https://emacs.stackexchange.com/a/79472
(let ((save-files-directory
          (file-name-concat user-emacs-directory
                               "auto-save/"))) ;;; <-- add trailing slash 
  (make-directory save-files-directory :parents)
  (setq auto-save-file-name-transforms
	`((".*" ,save-files-directory t)))
  (setq lock-file-name-transforms
  `((".*" ,save-files-directory t))))


(display-time-mode 1)


;; OSX compatible bindings
(when (memq window-system '(mac ns x))
  (global-set-key [home] 'beginning-of-line-text)
  (global-set-key [end] 'move-end-of-line)
  (global-set-key (kbd "<M-right>") 'right-word)
  (global-set-key (kbd "<M-left>") 'left-word)
  (global-set-key (kbd "<M-up>") nil) ; 'backward-up-list)
  (global-set-key (kbd "<M-down>") nil) ; 'forward-list)
  (global-set-key (kbd "<M-delete>") 'kill-word))

(recentf-mode 1)

(add-hook 'org-mode-hook 'flyspell-mode)

(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
(add-to-list 'ispell-skip-region-alist '("PROPERTIES" . ":END:"))
