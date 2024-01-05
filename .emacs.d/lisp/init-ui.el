(setq ;;inhibit-startup-message t
      inhibit-splash-screen t
      ;;inhibit-startup-echo-area-message t
      ;;initial-buffer-choice "~/.org/main.org"
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

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

;;(set-frame-font "CaskaydiaCove Nerd Font 10" "Regular" nil t)
(set-frame-font "-SAJA-CaskaydiaCove Nerd Font-semilight-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-ui)
