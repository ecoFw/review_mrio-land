(fset 'wos-review-goto-csv-notes
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("-  |o[,\"" 0 "%d")) arg)))
