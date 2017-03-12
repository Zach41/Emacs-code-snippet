;;; init-go --- setups for go environment -*- lexical-binding: t; -*-

;;; Commentary:
;; Go Language environment setups

;;; Code:

;; (require 'go-mode-autoloads)

(require 'go-mode)
(require 'company)
;; (require 'flymake-go)
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda ()
			   (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'before-save-hook 'gofmt-before-save)

;; (defvar golang-goto-stack '())

;; (defun golang-jump-to-definition ()
;;   (interactive)
;;   (add-to-list 'golang-goto-stack
;;                (list (buffer-name) (point)))
;;   (godef-jump (point) nil))

;; (defun golang-jump-back ()
;;   (interactive)
;;   (let ((p (pop golang-goto-stack)))
;;     (if p (progn
;;             (switch-to-buffer (nth 0 p))
;;             (goto-char (nth 1 p))))))

(defun go-mode-setup ()
  "Setup for go-mode."
  (go-eldoc-setup)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (setq tab-width 4)
  (setq indent-tabs-mode 1))

(add-hook 'go-mode-hook 'go-mode-setup)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))
(provide 'init-go)
;;; init-go ends here
