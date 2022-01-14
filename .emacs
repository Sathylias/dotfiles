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

;; Load my favorite theme
(use-package moe-theme
  :config (load-theme 'moe-dark t))

;; Get rid of what we don't need
(setq inhibit-startup-message t)
(setq initial-buffer-choice "~/.org")
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Evil Mode for easier key bindings
(use-package evil
  :config
  (evil-mode 1))

;; keu-chord for easy keybindings remapping
(use-package key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(custom-set-variables
 '(package-selected-packages '(key-chord evil moe-theme use-package)))
(custom-set-faces
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#303030" :foreground "#c6c6c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 99 :width normal :family "DEC Terminal")))))
