(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

(use-package doom-themes
  :config (load-theme 'doom-xcode t))

(use-package mood-line
  :config
  (mood-line-mode))

(defun reload-config()
  (interactive)
  (load-file "~/.emacs"))

(defun edit-config()
  (interactive)
  (find-file "~/.emacs"))

(setq backup-directory-alist '((".*" . "~/.trash")))
(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      initial-buffer-choice "~/.org/main.org"
      show-paren-mode t
      column-number-mode t
      vc-follow-symlinks t) ;; Don't prompt for following symlinks

(global-display-line-numbers-mode t)
(scroll-bar-mode -1)

(setq-default
 default-frame-alist
 '((fullscreen . maximized)
   (menu-bar-lines . 0)
   (tool-bar-lines . 0)))

(set-face-attribute 'fringe nil :background nil)
;;(set-face-attribute 'linum nil :background nil)
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package evil
  :init 
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

(use-package key-chord
  :config
  (key-chord-mode 1)           
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(defun shell-mode-setup ()
  (setq sh-indentation 2))

(add-hook 'sh-mode-hook #'shell-mode-setup)
(set-frame-font "Cascadia Code 10" nil t)
;;(setq org-todo-keywords '((sequence "TODO" "STARTED" "DONE")))
(setq org-log-done 'time)

;; Automatically change TODO entry to DONE when all children are marked as DONE
;;(defun org-summary-todo (n-done n-not-done)
;;  "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;  (let (org-log-done org-todo-log-states)   ; turn off logging
;;    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;;(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" default))
 '(package-selected-packages '(doom-themes mood-line moe-theme key-chord evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
