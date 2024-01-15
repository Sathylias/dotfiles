(use-package doom-themes
  :config (load-theme futuregl/theme-startup t))

;; TODO Maybe move this out of here, in init-ui
(use-package mood-line
  :config
  (mood-line-mode))

(defun futuregl/toggle-dark-theme ()
  (interactive)
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme futuregl/theme-dark t))

(defun futuregl/toggle-light-theme ()
  (interactive)
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme futuregl/theme-light t))

(global-set-key (kbd "<f5>") 'futuregl/toggle-dark-theme)
(global-set-key (kbd "<f6>") 'futuregl/toggle-light-theme)

(provide 'init-themes)
