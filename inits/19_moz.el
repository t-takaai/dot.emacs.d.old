;;----------------------------------------------------------------
;; moz
;; https://github.com/RenWenshan/emacs-moz-controller
(require 'moz-controller)
(global-set-key (kbd "M-<up>") 'moz-controller-page-up)
(global-set-key (kbd "M-<down>") 'moz-controller-page-down)
(global-set-key (kbd "M-<left>") 'moz-controller-tab-previous)
(global-set-key (kbd "M-<right>") 'moz-controller-tab-next)
(global-set-key (kbd "M-=") 'moz-controller-zoom-in)
(global-set-key (kbd "M--") 'moz-controller-zoom-out)
(global-set-key (kbd "M-0") 'moz-controller-zoom-reset)
(global-set-key (kbd "M-<backspace>") 'moz-controller-tab-close)
(global-set-key (kbd "M-\\") 'moz-controller-get-current-url) ;;動かず
