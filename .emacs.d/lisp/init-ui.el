(setq inhibit-splash-screen t
      initial-buffer-choice "~/.org/main.org"
      show-paren-mode t
      column-number-mode t
      vc-follow-symlinks t) ;; Don't prompt when following symlinks

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

;; FIXME: Move this to init-completion.el
(use-package company
  :ensure t
  :config
  (setq company-global-modes '(not eshell-mode))
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

;; Spacious padding because 
(use-package spacious-padding
  :ensure t
  :config
  (setq spacious-padding-widths
	(plist-put spacious-padding-widths :mode-line-width 2))
  :hook
  (after-init . spacious-padding-mode))

(set-frame-font "-SAJA-CaskaydiaCove Nerd Font-*-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-ui)
