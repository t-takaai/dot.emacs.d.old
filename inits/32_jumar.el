;;----------------------------------------------------------------
;; # jumar (https://github.com/kenoss/jumar) 
;; http://qiita.com/kenoss/items/0617b0c2f04343d4477c
;; https://github.com/kenoss/jumar

(require 'jumar)
(require 'jumar-dwin)
(require 'helm)  ; if you use visualizer.

;; If one needs highlight the line after jump.
(require 'erfi-emacs)
(add-hook 'jumar-post-jump-hook 'erfi-emacs-hl-turn-on-until-next-command)

;; Initialization
(jumar-dwin-use-preconfigured-scheme 'list+history)
(jumar-init)

;; As you like.
(define-key global-map (kbd "C-'")     'jumar-dwin-add-marker)
(define-key global-map (kbd "C-\"")    'jumar-dwin-jump-current)
(define-key global-map (kbd "C-,")     'jumar-dwin-jump-backward)
(define-key global-map (kbd "C-.")     'jumar-dwin-jump-forward)
(define-key global-map (kbd "C-x C-'") 'helm-jumar-dwin-jumarkers)

;; As you need.  Advise jump commands, like `find-tag' and `gtags-find-tag',
;; to add jumarker before/after jump.
(jumar-dwin-advise-jump-command-to-add-jumarker 'find-tag)
; (jumar-dwin-advise-jump-command-to-add-jumarker 'elisp-slime-nav-find-elisp-thing-at-point)

