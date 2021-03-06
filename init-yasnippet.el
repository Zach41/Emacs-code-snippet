;;; init-yasnippet.el --- yasnippet init file -*- lexical-binding: t; -*-

;;; Commentary:

;; yasnippet initialization file

;;; Code:

(require 'yasnippet)

(defvar zach-yasnippet-dir (expand-file-name "~/.emacs.d/snippets")
  "Personal snippets.")

(if (and (file-exists-p zach-yasnippet-dir) (not (member zach-yasnippet-dir yas-snippet-dirs)))
	 (add-to-list 'yas-snippet-dirs zach-yasnippet-dir))

(yas-reload-all)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)
(define-key yas-minor-mode-map (kbd "C-c C-t") 'yas-insert-snippet)

(yas-global-mode t)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here

