(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://melpa-stable.milkbox.net/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Helm Configuration
(use-package setup-helm)
(use-package helm-gtags
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
  (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
  (define-key helm-gtags-mode-map (kbd "M-m") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (setq
   helm-gtags-ignore-case t
   helm-gtags-auto-update t
   helm-gtags-use-input-at-cursor t
   helm-gtags-pulse-at-cursor t
   helm-gtags-prefix-key "\C-cg"
   helm-gtags-suggested-key-mapping t))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (setq
   evil-emacs-state-cursor '("red" box)
   evil-normal-state-cursor '("green" box)
   evil-visual-state-cursor '("orange" box)
   evil-insert-state-cursor '("red" bar)
   evil-replace-state-cursor '("red" bar)
   evil-operator-state-cursor '("red" hollow)))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

;; C/C++ Config
(use-package company-c-headers
  :ensure t)
(use-package cc-mode
  :ensure t)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-backends (delete 'company-semantic company-backends))
  (add-hook 'cc-mode-hook
            (add-to-list 'company-backends 'company-c-headers)))

;; Python Config
(use-package company-jedi
  :defer t
  :ensure t
  :config
  (setq jedi:complete-on-dot t)
  (setq jedi:get-in-function-call-delay 0.2))
(use-package python-mode
  :bind
  ("<S-down-mouse-1>" . goto-definition-at-point)
  ("<S-down-mouse-3>" . quick-pydoc)
  :functions jedi:goto-definition
  :init
  (setq-default python-shell-completion-native-enable nil)
(defun goto-definition-at-point (event)
    "Move the point to the clicked position
     and jedi:goto-definition the thing at point."
    (interactive "e")
    (let ((es (event-start event)))
      (select-window (posn-window es))
      (goto-char (posn-point es))
      (jedi:goto-definition)))
(defun quick-pydoc (event)
  "Move the point to the clicked position
     and pydoc the thing at point."
  (interactive "e")
  (let ((es (event-start event)))
    (select-window (posn-window es))
    (goto-char (posn-point es))
    (pydoc-at-point)))
(add-hook 'python-mode-hook
          (lambda ()
            (when (derived-mode-p 'python-mode)
              (add-to-list 'company-backends 'company-jedi)))))

(use-package flycheck-pos-tip
  :ensure t)
(use-package flycheck                                                  
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'c++-mode-hook
            (lambda () (setq flycheck-clang-language-standard "c++11")))
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
  (setq flycheck-checkers (delq 'html-tidy flycheck-checkers))
  (setq flycheck-standard-error-navigation nil)
  (global-flycheck-mode t)
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode)))
(when (display-graphic-p (selected-frame))
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))

;; Custom Configuration
(global-linum-mode t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-c ;") 'iedit-mode)
(global-set-key (kbd "M-x") 'helm-M-x)
(set-default 'tab-always-indent 'complete)
(global-set-key (kbd "C-x C-p") 'company-complete)
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "bsd")
(show-paren-mode t)
(setq evil-move-cursor-back nil)
(setq gdb-many-windows t)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
;;(company-quickhelp-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/5.4.0/" "/usr/include/c++/5/")))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(display-battery-mode t)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(menu-bar nil)
 '(package-selected-packages
   (quote
    (company-c-headers flycheck-pos-tip helm-gtags helm use-package better-defaults iedit company-quickhelp flycheck key-chord evil)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 105 :width normal))))
 '(company-tooltip ((t (:background "black" :foreground "white"))))
 '(fringe ((t (:background "black"))))
 '(linum ((t (:inherit whitet))))
 '(mode-line ((t (:background "black" :foreground "white" :overline t :underline t :height 1.0))))
 '(org-todo ((t (:foreground "red" :weight bold)))))
