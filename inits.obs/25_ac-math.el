;; ac-math
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `LaTeX-mode`
(add-to-list 'ac-modes 'LaTeX-mode)
(add-to-list 'ac-modes 'yatex-mode)   ; make auto-complete aware of `LaTeX-mode`
(add-to-list 'ac-modes 'org-mode)
 
(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(add-hook 'yatex-mode-hook 'ac-yatex-mode-setup)
(add-hook 'org-mode-hook 'ac-latex-mode-setup)
