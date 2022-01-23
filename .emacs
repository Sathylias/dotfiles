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
(use-package moe-theme
  :config (load-theme 'moe-dark t))

(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      initial-buffer-choice "~/.org/main.org"
      show-paren-mode t
      ;;global-linum-mode t
      column-number-mode t)

(global-linum-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode '(nil . 0))
(scroll-bar-mode -1)
(set-face-attribute 'fringe nil :background nil)
(set-face-attribute 'linum nil :background nil)

(set-frame-font "DEC Terminal 12" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defalias 'yes-or-no-p 'y-or-n-p)

;; Evil Mode for easier key bindings
(use-package evil
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
 '(mode-line ((t (:background "#FF4EA3" :foreground "white" :overline t :underline t :height 1.0 :weight bold))))
 '(mode-line-buffer-id ((t (:background "#FF4EA3" :foreground "white" :overline t :underline t :height 1.0 :weight bold)))))
