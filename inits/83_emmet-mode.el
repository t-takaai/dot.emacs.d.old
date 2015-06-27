;;----------------------------------------------------------------
;; emmet-mode
;; http://catcher-in-the-tech.net/55/

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'php-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
;(define-key emmet-mode-keymap (kbd "C-c C-j") 'emmet-expand-line)
