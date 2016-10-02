;; toggle read only
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
