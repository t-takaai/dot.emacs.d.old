
;;----------------------------------------------------------------
;; markdown-mode
;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-command "/usr/local/bin/multimarkdown")

(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command 
;   (format "open -a /Applications/Marked\\ 2.app %s" 
   (format "open -a /Applications/MDEdit.app %s" 
       (shell-quote-argument (buffer-file-name))))
  )
(global-set-key "\C-cm" 'markdown-preview-file)
