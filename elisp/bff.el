;;; package --- Summary
;;; Commentary:
;;; Code:

(defun my-ts->cs ()
  "Convert TypeScript strucrures to CSharp."
  (interactive)
  (progn
    (replace-regexp "export" "public")
    (forward-word 2)
    (insert "\n")
    (next-line)
    ;;
    (set-mark-command nil)
    (re-search-forward ":")
    (kill-region (mark) (point))
    (insert "public")
    (yank)
    (deactivate-mark)
    (backward-delete-char-untabify 1 nil)
    (forward-word)
    (insert " {get; set;}")
    (delete-char 1)
    (forward-line)))

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
  "Convert json to BFF request."
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

;;; bff.el ends here
