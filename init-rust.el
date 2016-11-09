;;; init-rust.el --- Rust initialization -*- lexical-binding: t; -*-

;;; Commentary:
;; dev environment for Rust

;;; Code:
(require 'company)
(require 'racer)
(require 'toml-mode)

(setq auto-mode-alist
	  (append
	   '(("\\.rs\\'" . rust-mode))
	   auto-mode-alist))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)

;; rustfmt
;; (add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
(define-key rust-mode-map (kbd "C-c C-f") #'rust-format-buffer)

;; rust racer
(setq racer-rust-src-path (expand-file-name "~/rust-1.12.1/src"))
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(provide 'init-rust)
;;;  init-rust.el ends here
