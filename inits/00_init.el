
;;----------------------------------------------------------------
;; #Home Directory
;;
(cd "~/")


;;----------------------------------------------------------------
;; #path
;;
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
 (add-to-list 'load-path default-directory)
 (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (normal-top-level-add-subdirs-to-load-path)))

(add-to-list 'load-path "/usr/local/Cellar/pdf-tools/0.60/elpa")


;;----------------------------------------------------------------
;; #face
;;
(custom-set-faces
 '(default ((t
             (:background "gray15" :foreground "#55FF55")
             ))))
 '(cursor ((((class color)
             (background dark))
            (:background "#00AA00"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           ))


;;----------------------------------------------------------------
;; #cask & pallet
;;
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)
(require 'pallet)



;;----------------------------------------------------------------
;; #package.el
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; インストールしたパッケージにロードパスを通してロードする
(package-initialize)



;;----------------------------------------------------------------
;;  #global key customize
;;
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-g M-g") 'goto-line)
(global-unset-key "\M-c") ;;captalize word



;;----------------------------------------------------------------
;; #path
;;
;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/usr/local/bin"
              "/opt/local/bin"
              "/usr/bin"
              "/usr/sbin"
              "/bin"
              "/sbin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 ;; PATH と exec-path に同じ物を追加します
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

(setenv "MANPATH" (concat "/usr/local/man:/usr/share/man:/Developer/usr/share/man:/sw/share/man" (getenv "MANPATH")))


;;----------------------------------------------------------------
;; #shell
;;
;; shell の存在を確認
(defun skt:shell ()
  (or (executable-find "zsh")
      (executable-find "bash")
      (executable-find "cmdproxy")
      (error "can't find 'shell' command in PATH!!")))

;; Shell 名の設定
(setq shell-file-name (skt:shell))
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)



;;----------------------------------------------------------------
;; #server start for emacs-client
;;
(require 'server)
(unless (server-running-p)
  (server-start))

