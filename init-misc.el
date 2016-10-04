;; kill all buffers except exclu_buffers
(setq exclu_buffers '("*terminal<[0-9]\\{1,\\}>*" "*scratch*"))

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
(setq read-source-code-p nil)
(defun toggle-read-source-p ()
  "change the read-source flag"
  (interactive)
  (if read-source-code-p (setq read-source-code-p nil) (setq read-source-code-p t))
  (if read-source-code-p (message "read source mode is on") (message "read source mode is off")))

(defun read-only-open ()
  (when read-source-code-p
    (progn
      (message "File %s is now read-only" (buffer-file-name))
      (setq buffer-read-only t))
    ))
  
(add-hook 'find-file-hook 'read-only-open)

(provide 'init-misc)


