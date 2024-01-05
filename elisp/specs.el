;; JSON format converter to calc view

(defun my-spec-fmt ()
  "Format json to calc format"
  (interactive)
  (progn
    (my-spec-field-qualification)
    (my-spec-replace)
    (my-spec-clean)))

(defun my-spec-replace ()
  "Replace the json values with human description"
  (interactive)
  (let ((str (buffer-substring
              (point-min) (point-max))))
    (kill-region (point-min) (point-max))
    (insert
      (replace-regexp-in-string "[,\"]" ""
        (replace-regexp-in-string ": [01]" "	Число"
          (replace-regexp-in-string ": \"string\"" "	Строка"                                                                                       
            (replace-regexp-in-string ": true" "	Булево"
              (replace-regexp-in-string ": \"2023.*\"" "	Дата"
                (replace-regexp-in-string ": { *$" "	Объект"
                  (replace-regexp-in-string ": \\[ *$" "	Массив Объектов" str)))))))
      )))

(defun my-spec-clean ()
  "Delete unwantes rows."
  (interactive)
  (progn
    (beginning-of-buffer)
    (flush-lines "[]{}0]")
    (flush-lines "^ *$")
    (replace-regexp-in-region "^ +" "")
  ))

(defun my-spec-field-qualification ()
  "Qualify field names."
  (interactive)
  (let (cword cline (res '()))
    (beginning-of-buffer)
    (while (< (forward-line) 1)
      (setq cline (thing-at-point 'line t))
      (when (and (string-match "\\w\\{2\\}" cline) (list-not-empty-p res))
        (setq cword (current-word))
        (forward-word)
        (backward-word)
        (kill-word 1)
        (insert (concat-string-list cword (seq-filter #'list-not-empty-p res))))
      (cond
       ((string-match "\s*\"?\\([a-zA-Z0-9_-]*\\).*[{[]$" cline)
        (push (match-string 1 cline) res))
       ((string-match "\\(}\\|]\\),?$" cline)
        (pop res))))))

(defun concat-string-list (str xs)
  "Concat string and list content."
  (let ((delimeter "."))
    (concat
     (mapconcat #'pure (reverse xs) delimeter)
     delimeter str)))

(defun pure (arg) arg)

(defun list-not-empty-p (xs)
  (/= (length xs) 0))
