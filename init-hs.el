;;; init-hs --- hide show minor mode setups -*- lexical-binding: t; -*-

;;; Commentary:
;; setups for hide-show minor mode

;;; Code:
(load-library "hideshow")

(global-set-key (kbd "C-c h") 'hs-toggle-hiding)

(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'rust-mode-hook 'hs-minor-mode)

;; Hide the comments too when you do a 'hs-hide-all'
(setq hs-hide-comments nil)
;; Set whether isearch opens folded comments, code, or both
;; where x is code, comments, t (both), or nil (neither)
(setq hs-isearch-open 't)

(provide 'init-hs)
;;; init-hs ends here
