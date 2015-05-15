
;;----------------------------------------------------------------
;; python-mode
;;

;; (setq auto-mode-alist
;;       (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (autoload 'python-mode "python-mode" "Python editing mode." t)

;; (require 'epc)
;; (require 'auto-complete-config)
;; (require 'python)

;; ;;;;; PYTHONPATH上のソースコードがauto-completeの補完対象になる ;;;;;
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
(elpy-enable)
;; Configuring the backend
(setq elpy-rpc-backend "jedi")
;; (require 'jedi)
;; (add-hook 'python-mode-hook 'jedi:setup)
(define-key python-mode-map (kbd "<C-tab>") 'jedi:complete)
;; (setq jedi:complete-on-dot t)
