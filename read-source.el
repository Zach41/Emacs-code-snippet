;;; read-source.el --- read source mode -*- lexical-binding: t; -*-

;;; Commentary:
;; make all buffers read only when reading source code

;;; Code:

;; toggle read only while reading sources
(defvar zach--read-source-code-p nil
  "Variable controlling read-only-open.")

(defun toggle-read-source-p ()
  "Change the read-source flag."
  (interactive)
  (if zach--read-source-code-p
      (progn
	(setq zach--read-source-code-p nil)
	(setq buffer-read-only nil))
    (progn
      (setq zach--read-source-code-p t)
      (let ((buffer (current-buffer)))
	(unless (string-match "*terminal<[0-9]\\{1,\\}>*" (buffer-name buffer))
	  (setq buffer-read-only t))))
  (if zach--read-source-code-p (message "read source mode is on") (message "read source mode is off"))))

(defun read-only-open ()
  "If zach--read-source-code-p is set, file opened with read-only mode."
  (when zach--read-source-code-p
    (progn
      (message "File %s is now read-only" (buffer-file-name))
      (setq buffer-read-only t))
    ))
  
(add-hook 'find-file-hook 'read-only-open)

(provide 'read-source)

;;;  package-name ends here
