;;; init-gtags.el --- gtags initialization -*- lexical-binding: t; -*-

;;; Commentary:
;; gtags initialization

;;; Code:

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode)
	      (ggtags-mode t))))

(provide 'init-gtags)
;;; init-gtags.el ends here
