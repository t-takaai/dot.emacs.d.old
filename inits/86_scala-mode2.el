
;;----------------------------------------------------------------
;; #scala-mode2
;;
(require 'scala-mode2)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;http://takezoe.hatenablog.com/entry/2015/08/04/115353
(add-hook 'scala-mode-hook 'my-scala-mode-hook)
(defun my-scala-mode-hook ()
  (setq scala-indent:use-javadoc-style t))
