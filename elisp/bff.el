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

(defun my-json->str ()
  "Convert json to BFF request"
  (interactive)
  (progn
    (search-forward-regexp ":")
    (forward-char)
    (insert "\"")
    (replace-regexp "\"" "\\\\\"")
    (next-line)
    (insert "\"")
    (goto-char (point-min))
    (replace-regexp  "\{\n+\\\\" "\"{")
    (goto-char (point-min))
    (replace-regexp "\n\\| +" "")))
