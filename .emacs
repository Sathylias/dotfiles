(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

(use-package moe-theme
  :config (load-theme 'moe-dark t))

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
      pop-up-frames t ;;For Windows, this should be set to false
      column-number-mode t
      vc-follow-symlinks t) ;; Don't prompt for following symlinks

(global-linum-mode 1)
(setq linum-format "%3d \u2502 ")
(setq-default left-fringe-width  10)

(setq-default
 default-frame-alist
 '((fullscreen . maximized)
   (menu-bar-lines . 0)
   (scroll-bar-mode -1)
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

;;(setq org-todo-keywords '((sequence "TODO" "STARTED" "DONE")))
(setq org-log-done 'time)

;; Automatically change TODO entry to DONE when all children are marked as DONE
;;(defun org-summary-todo (n-done n-not-done)
;;  "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;  (let (org-log-done org-todo-log-states)   ; turn off logging
;;    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;;(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "white" :height 1.0 :weight bold))))
 '(mode-line-buffer-id ((t (:foreground "white" :height 1.0 :weight bold)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(terraform-mode mood-line key-chord use-package moe-theme evil)))
