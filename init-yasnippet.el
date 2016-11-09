;;; init-yasnippet.el --- yasnippet init file -*- lexical-binding: t; -*-

;;; Commentary:

;; yasnippet initialization file

;;; Code:

(require 'yasnippet)
(require 'company)

(defvar zach-yasnippet-dir (expand-file-name "~/.emacs.d/snippets")
  "Personal snippets.")

(if (and (file-exists-p zach-yasnippet-dir) (not (member zach-yasnippet-dir yas-snippet-dirs)))
	 (add-to-list 'yas-snippet-dirs zach-yasnippet-dir))

(yas-reload-all)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)
(yas-global-mode t)

;; company mode
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(add-hook 'rust-mode-hook 'company-mode)
(add-hook 'asm-mode-hook 'company-mode)
(add-hook 'cmake-mode-hook 'company-mode)
(add-hook 'toml-mode-hook 'company-mode)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here

