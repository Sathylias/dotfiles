;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;;;;;;;;;;;;;;;;;
;; UI Settings ;;
;;;;;;;;;;;;;;;;;

;; Load my favorite theme
;;(use-package moe-theme
;;    :config (load-theme 'moe-dark t))
(setq backup-directory-alist '((".*" . "~/.trash")))
(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      initial-buffer-choice "~/.org/main.org"
      show-paren-mode t
      pop-up-frames t
      global-linum-mode 0
      column-number-mode t
      vc-follow-symlinks t) ;; Don't prompt for following symlinks


;;(global-linum-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
;;(fringe-mode '(nil . 0))
;;(scroll-bar-mode -1)
(set-face-attribute 'fringe nil :background nil)
;;(set-face-attribute 'linum nil :background nil)

;;(set-frame-font "DEC Terminal 12" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defalias 'yes-or-no-p 'y-or-n-p)

;; Todoist Integration
;;(use-package todoist)

;; Evil Mode for easier key bindings
(use-package evil
  :init 
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

;; key-chord for easy keybindings remapping
(use-package key-chord
  :config
  (key-chord-mode 1)           
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode hook definitions ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun shell-mode-setup ()
  (setq sh-indentation 2))

(add-hook 'sh-mode-hook #'shell-mode-setup)

;; ORG Mode Stuff
(setq org-todo-keywords
  '((sequence "TODO"
      "STARTED"
      "DONE")))

;; Automatically change TODO entry to DONE when all children are marked as DONE
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-todo-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

;; Helper function to toggle our main Org file 
(defun toggle-buffer-org ()
  (interactive)
  (let* ((org-file (expand-file-name (concat "~/" ".org"))))
    (find-file org-file)))

(defun toggle-buffer-side ()
  (interactive)
  (let* ((width (/ (window-total-width) 4))
	 (org-file (expand-file-name (concat "~/" ".org"))))
    (split-window-horizontally (+ width))
    (dired org-file)))

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
 '(package-selected-packages '(todoist key-chord use-package moe-theme evil)))
