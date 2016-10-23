;;; init-misce.el --- miscellaneous functions -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; kill all buffers except exclu_buffers
(defvar zach-exclu_buffers '("*terminal<[0-9]\\{1,\\}>*" "*scratch*")
  "Exlusive buffers.")

(defun kill-buffers-all ()
  "Kill all active buffers except those names matched in exclu_buffers."
  (interactive)
  (setq list (buffer-list))
  (while list
    (let* ((buffer (car list))
	   (name (buffer-name buffer)))
      (when (and name
	   (not (string-equal name ""))
	   (not (reduce #'(lambda (x y) (or x y)) (mapcar #'(lambda (str) (string-match str name)) zach-exclu_buffers)))
	   (kill-buffer buffer)
	   )))
    (setq list (cdr list))))

;; smooth scrolling setting.
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; miscellaneous key mapping
(global-set-key (kbd "C-c m") 'man)	; man command shortcut

;;; miscellaneous settings
(setq inhibit-startup-message t) ;去掉欢迎界面
(tool-bar-mode 0)           ;去掉极丑的菜单栏....
(scroll-bar-mode 0)         ;去掉滚动条
(setq-default c-basic-offset 4)
(setq tab-width 4)
(global-linum-mode t)    ;; 显示行号
;; paren-mode settings (括号匹配)
(show-paren-mode 1)
;; 字体
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "PingFang SC" :size 13)))
(set-face-attribute 'default
		    nil
		    :height
		    (+ (face-attribute 'default :height) 15))

(provide 'init-misc)
;;; init-misc.el ends here
