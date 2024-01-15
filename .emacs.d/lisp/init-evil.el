(use-package evil
  :config
  (evil-mode 1))
  ;;:bind (:map evil-insert-state-map
	      ;;("C-i" . evil-normal-state)
	      ;;))

(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

(provide 'init-evil)

