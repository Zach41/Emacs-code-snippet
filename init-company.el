;;; init-company.el --- company-mode setups -*- lexical-binding: t; -*-

;;; Commentary:
;; company-mode setups
;;; Code:
(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(add-hook 'rust-mode-hook 'company-mode)
(add-hook 'asm-mode-hook 'company-mode)
(add-hook 'cmake-mode-hook 'company-mode)
(add-hook 'toml-mode-hook 'company-mode)
(add-hook 'python-mode-hook 'company-mode)

(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(provide 'init-company)
;;; company-mode ends here
