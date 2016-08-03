(defun csv-separators-toggle ()
  (interactive)
  (cond ((equal (car csv-separators) ",")
         (custom-set-variables '(csv-separators '("\t" ",")))
         (message "Separator -> TAB"))
        (t
         (custom-set-variables '(csv-separators '("," "\t")))
         (message "Separator -> ,"))))
