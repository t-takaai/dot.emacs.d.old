;;; 84_yaml-mode.el ---                              -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Takayuki Takaai

;; Author: Takayuki Takaai <takaai@tauon.local>


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(define-key yaml-mode-map "\C-m" 'newline-and-indent)
