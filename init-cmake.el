;;; init-cmake --- cmake mode configs -*- lexical-binding: t; -*-

;;; Commentary:

;; cmake configuration

;;; Code:

;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

;; cmake-font-lock
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

(provide 'init-cmake)
;;; init-cmake ends here
