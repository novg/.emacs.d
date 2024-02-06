(defun my-str->json ()
  "Convert string json."
  (interactive)
  (progn
    (replace-regexp "\"{" "{")
    (replace-regexp "}\"" "}")
    (goto-char (point-min))
    (replace-regexp "\\\\" "")
    (goto-char (point-min))
    (json-pretty-print (point-min) (point-max))))
