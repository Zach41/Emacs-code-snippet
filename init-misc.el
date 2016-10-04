;;; -*- lexical-binding: t; -*-

;; kill all buffers except exclu_buffers
(defvar exclu_buffers '("*terminal<[0-9]\\{1,\\}>*" "*scratch*")
  "Exlusive buffers.")

(defun kill-buffers-all ()
  "Kill all active buffers except those names matched in exclu_buffers"
  (interactive)
  (setq list (buffer-list))
  (while list
    (let* ((buffer (car list))
	   (name (buffer-name buffer)))
      (when (and name
	   (not (string-equal name ""))
	   (not (reduce #'(lambda (x y) (or x y)) (mapcar #'(lambda (str) (string-match str name)) exclu_buffers)))
	   (kill-buffer buffer)
	   )))
    (setq list (cdr list))))

;; toggle read only while reading sources
(defvar zach-read-source-code-p nil
  "Variable controlling read-only-open.")

(defun toggle-read-source-p ()
  "change the read-source flag"
  (interactive)
  (if zach-read-source-code-p (setq zach-read-source-code-p nil) (setq zach-read-source-code-p t))
  (if zach-read-source-code-p (message "read source mode is on") (message "read source mode is off")))

(defun read-only-open ()
  (when read-source-code-p
    (progn
      (message "File %s is now read-only" (buffer-file-name))
      (setq buffer-read-only t))
    ))
  
(add-hook 'find-file-hook 'read-only-open)

(provide 'init-misc)