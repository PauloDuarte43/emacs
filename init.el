(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e3bf16af35586816b824bea36188215319b1cceb208d3518700d876c4c1a9cc7" "6c0a087a4f49c04d4002393ffd149672f70e4ab38d69bbe8b39059b61682b61c" "251348dcb797a6ea63bbfe3be4951728e085ac08eee83def071e4d2e3211acc3" default)))
 '(org-todo-keywords (quote ((sequence "TODO" "DOING" "DONE"))))
 '(package-selected-packages
   (quote
    (jedi rainbow-mode web-mode mustang-theme auto-package-update auto-complete airline-themes)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Packages.
(require 'package)
;;; either the stable version:
(add-to-list 'package-archives
;  ;; choose either the stable or the latest git version:
;  ;; '("melpa-stable" . "http://melpa-stable.org/packages/")
'("melpa-unstable" . "http://melpa.org/packages/"))
(package-initialize)

(setq history-length 500)
(savehist-mode 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(show-paren-mode 1)
(global-undo-tree-mode)
(global-auto-complete-mode t)
(setq js-switch-indent-offset 4)
(add-hook 'css-mode-hook
          (defun elmord/css-mode-hook ()
            (rainbow-mode 1)))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(setq org-log-done 'time)

(require 'web-mode)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-engines-alist
      '(("django"    . "cms_delivery_templates"))
)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'airline-themes)
(load-theme 'airline-cool)
(load-theme 'mustang)

;; Kill all unmodified buffers.
(require 'cl)
(defun ask-and-kill-unmodified-buffers ()
  (interactive)
  (let ((killed (remove-if #'buffer-modified-p (buffer-list))))
    (when (y-or-n-p (message "Kill %d buffers? %s" (length killed) killed))
      (mapc #'kill-buffer killed)
      (message "%d buffers killed: %s" (length killed) killed))))
(global-set-key (kbd "C-x K") 'ask-and-kill-unmodified-buffers)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
