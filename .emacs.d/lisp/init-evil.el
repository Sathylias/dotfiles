(use-package evil
  :init 
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  :bind (:map evil-insert-state-map
	      ("C-i" . evil-normal-state)
	      ))

(provide 'init-evil)

