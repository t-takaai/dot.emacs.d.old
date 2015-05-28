;;; 83_coffee-mode.el ---                            -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Takayuki Takaai

;; Author: Takayuki Takaai <takaai@tauon.local>

(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))