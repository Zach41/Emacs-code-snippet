;;; init-dumbj --- dumb jump configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; dumb jump comfiguration

;;; Code:

(require 'dumb-jump)

(add-hook 'python-mode-hook 'dumb-jump-mode)
(setq dumb-jump-selector 'ivy)

(define-key dumb-jump-mode-map (kbd "M-.") 'dumb-jump-go)
(define-key dumb-jump-mode-map (kbd "M-,") 'dumb-jump-back)

(provide 'init-dumbj)

;;; init-dumbj ends here
