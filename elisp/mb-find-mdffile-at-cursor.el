;;; findfile-at-cursor.el ---                        -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Takayuki Takaai

;; Author: Takayuki Takaai <takaai@tauon.local>
;; Keywords: 

;(find-alternate-file (substring (thing-at-point 'filename) 1 -1))
;(find-alternate-file (shell-command-to-string (concat "ag -g " (substring (thing-at-point 'filename) 1 -1) " ~/mebio/MyData/")))
;(find-file (concat (shell-command-to-string (concat "ag -g " (substring (thing-at-point 'filename) 1 -1) " ~/mebio/MyData/"))))
;(shell-command (concat "ag -g " (substring (thing-at-point 'filename) 1 -1) " ~/mebio/MyData/"))

;; (defun findfile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (view-file-other-window (substring (shell-command-to-string (concat "ag -g " (substring (thing-at-point 'filename) 1 -1) " ~/mebio/MyData/")) 0 -1)))

;; (defun mb-find-mdffile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (let
;;       ((SEARCH_DIRECTORY " ~/mebio/MyData")
;;        (SEARCH_SHELL_COMMAND "ag -g "))
;;     (view-file-other-window (substring (shell-command-to-string (concat SEARCH_SHELL_COMMAND (substring (thing-at-point 'filename) 1 -1) SEARCH_DIRECTORY)) 0 -1))
;;   )
;; )
;; (provide 'mb-find-mdffile-at-cursor)

;; (defun mb-find-mdffile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (let
;;       ((SEARCH_DIRECTORY " ~/mebio/MyData")
;;        (SEARCH_SHELL_COMMAND "ag -g ")
;;        (FILE_NAME (substring (thing-at-point 'filename) 1 -1)))
;;     (view-file-other-window (substring (shell-command-to-string (concat SEARCH_SHELL_COMMAND FILE_NAME SEARCH_DIRECTORY)) 0 -1))
;;   )
;; )

;; (defun mb-find-mdffile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (let*
;;       ((SEARCH_DIRECTORY " ~/mebio/MyData")
;;        (SEARCH_SHELL_COMMAND "ag -g ")
;;        (FILE_NAME (substring (thing-at-point 'filename) 1 -1))
;;        (SHELL_COMMAND (concat SEARCH_SHELL_COMMAND FILE_NAME SEARCH_DIRECTORY))
;;        (LONG_FILE_NAME (substring (shell-command-to-string SHELL_COMMAND) 0 -1))
;;        )
;;     (view-file-other-window LONG_FILE_NAME)
;;   )
;; )

;; (defun mb-find-mdffile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (let*
;;       ((SEARCH_DIRECTORY " ~/mebio/MyData")
;;        (SEARCH_SHELL_COMMAND "ag -g ")
;;        (FILE_NAME (substring (thing-at-point 'filename) 1 -1))
;;        (SHELL_COMMAND (concat SEARCH_SHELL_COMMAND FILE_NAME SEARCH_DIRECTORY))
;;        (RESULT (shell-command-to-string SHELL_COMMAND))
;;        (LONG_FILE_NAME
;;         (when (string-match "\\(.+\.mdf\\)\n" RESULT)
;;           (match-string 1 RESULT))
;;         )
;;        )
;;     (view-file-other-window LONG_FILE_NAME)
;;   )
;; )

;; (defun mb-find-mdffile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (let*
;;       ((SEARCH_DIRECTORY " ~/mebio/MyData")
;;        (SEARCH_SHELL_COMMAND "ag -g ")
;;        (FILE_NAME
;;         (let ((FILE (thing-at-point 'filename)))
;;           (when (string-match "{\\(.+\.mdf\\)}" FILE)
;;             (match-string 1 FILE)))
;;         )
;;        (SHELL_COMMAND (concat SEARCH_SHELL_COMMAND FILE_NAME SEARCH_DIRECTORY))
;;        (RESULT (shell-command-to-string SHELL_COMMAND))
;;        (LONG_FILE_NAME
;;         (when (string-match "\\(.+\.mdf\\)\n" RESULT)
;;           (match-string 1 RESULT))
;;         )
;;        )
;;     (view-file-other-window LONG_FILE_NAME)
;;   )
;; )

;; (defun mb-find-mdffile-at-cursor ()
;;   "Find file *.mdf at cursor"
;;   (interactive)
;;   (let*
;;       ((SEARCH_DIRECTORY " ~/mebio/MyData")
;;        (SEARCH_SHELL_COMMAND "ag -g ")
;;        (FILE_NAME
;;         (let ((FILE (thing-at-point 'filename)))
;;           (when (string-match "{\\(.+\.mdf\\)}" FILE)
;;             (match-string 1 FILE)))
;;         )
;;        (SHELL_COMMAND (concat SEARCH_SHELL_COMMAND FILE_NAME SEARCH_DIRECTORY))
;;        (RESULT (shell-command-to-string SHELL_COMMAND))
;;        (LONG_FILE_NAME
;;         (when (string-match "\\(.+\.mdf\\)\n" RESULT)
;;           (match-string 1 RESULT))
;;         )
;;        )
;;     (view-file LONG_FILE_NAME)
;;   )
;; )

(defun mb-find-mdffile-at-cursor (SEARCH_DIRECTORY)
  "Find file *.mdf at cursor"
  (interactive "p")
  (case SEARCH_DIRECTORY
    (4 (setq SEARCH_DIRECTORY "~/mebio/Data"))
    (t (setq SEARCH_DIRECTORY "~/mebio/MyData")))
  (let*
      (
       (SEARCH_SHELL_COMMAND "ag -g")
       (FILE_NAME
        (let ((FILE (thing-at-point 'filename)))
          (when (string-match "{\\(.+\.mdf\\)}" FILE)
            (match-string 1 FILE)))
        )
       (SHELL_COMMAND (concat SEARCH_SHELL_COMMAND " " FILE_NAME " " SEARCH_DIRECTORY))
       (RESULT (shell-command-to-string SHELL_COMMAND))
       (LONG_FILE_NAME
        (when (string-match "\\(.+\.mdf\\)\n" RESULT)
          (match-string 1 RESULT))
        )
       )
    (view-file LONG_FILE_NAME)
  )
)



(provide 'mb-find-mdffile-at-cursor)







