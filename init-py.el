;;; init-py.el --- python env config -*- lexical-binding: t; -*-

;;; Commentary:
;;python environment configuration

;;; Code:
(require 'elpy)

(elpy-enable)

(define-key elpy-mode-map (kbd "M-,") 'pop-tag-mark)

(provide 'init-py)
;;; init-py.el ends here
