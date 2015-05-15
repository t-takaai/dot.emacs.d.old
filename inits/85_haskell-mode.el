;;----------------------------------------------------------------
;; haskell-mode
;;
(require 'haskell-mode)
(require 'haskell-cabal)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

;; ghc-mod
(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'load-path "~/.cabal/share/x86_64-osx-ghc-7.8.3/ghc-mod-5.2.1.1")
(autoload 'ghc-init "ghc")
(ghc-init)
(add-to-list 'ac-sources 'ac-source-ghc-mod)

(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
