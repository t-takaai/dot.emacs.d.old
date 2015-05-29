
;;----------------------------------------------------------------
;; # key-combo
;;
(require 'key-combo)
(key-combo-mode 1)
(add-hook 'yatex-mode-hook
  '(lambda ()
     (key-combo-mode t)))

(add-hook 'js2-mode-hook
  '(lambda ()
     (key-combo-mode t)))

(add-hook 'coffee-mode-hook
  '(lambda ()
     (key-combo-mode t)))

(add-hook 'ruby-mode-hook
  '(lambda ()
     (key-combo-mode t)))

(add-hook 'python-mode-hook
  '(lambda ()
     (key-combo-mode t)))

(add-hook 'php-mode-hook
  '(lambda ()
     (key-combo-mode t)))

;; (add-hook 'skk-latin-mode-hook
;;   '(lambda ()
;;      (key-combo-mode t)))


;;; 各モードに対するキー設定
(setq key-combo-lisp-mode-hooks
      '(lisp-mode-hook
        emacs-lisp-mode-hook
        lisp-interaction-mode-hook
        inferior-gauche-mode-hook
        scheme-mode-hook))

(setq key-combo-lisp-default
      '(("."  . " . ")
        (","  . (key-combo-execute-orignal))
        (",@" . " ,@")
        (";"  . (";;;; " ";"))
        ("="  . ("= " "eq " "equal "))
        (">=" . ">= ")))

(setq key-combo-common-mode-hooks
      '(c-mode-common-hook
        php-mode-hook
        ruby-mode-hook
        python-mode-hook
;	robe-mode-hook
        cperl-mode-hook
;        js2-mode-hook
	))

(setq key-combo-common-default
      '((","  . (", " ","))
        ("="  . (" = " " == " " === " "="))
        ("=>" . " => ")
        ("=~" . " =~ ")
        ("=*" . " =* ")
        ("+"  . (" + " " += " "+"))
        ("+=" . " += ")
        ("-"  . (" - " " -= " "-"))
        ("-=" . " -= ")
        ("->" . " -> ")
        (">"  . (" > " " => " " >= " ">"))
        (">=" . " >= ")
        ("%"  . (" % " " %= " "%"))
        ("%="  . " %= ")
        ("!" . (" != " " !~ " "!"))
        ("!="  . " != " )
        ("!~" . " !~ ")
        ("~" . (" =~ " "~"))
        ("::" . " :: ")
        ("&"  . (" & " " && " "&"))
        ("&=" . " &= ")
        ("&&=" . " &&= ")
        ("*"  . (" * " "**" "*"))
        ("*="  . " *= " )
        ("<" . (" < " " <= " "<"))
        ("<=" . " <= ")
        ("<<=" . " <<= ")
        ("<-" . " <- ")
        ("|"  . (" ||= " " || " "|"))
        ("|=" . " |= ")
        ("||=" . " ||= ")
        ("/" . ("/`!!'/" " / " "// "))
        ("/=" . " /= ")
        ("/*" . "/* `!!' */")
        ("{" . ("{`!!'}" "{"))
        ("{|" . "{ |`!!'|  }")
        ("\"" . ("\"`!!'\"" "\""))
        ("'" . ("'`!!''" "'"))
        ("(" . ("(`!!')" "("))))

(setq key-combo-js-mode-hooks
      '(js2-mode-hook
        coffee-mode-hook
	))

(setq key-combo-js-default
      '((","  . (", " ","))
        ("="  . (" = " " == " " === " "="))
        ("=>" . " => ")
        ("=~" . " =~ ")
        ("=*" . " =* ")
        ("+"  . (" + " "++" "+"))
        ("+=" . " += ")
        ("-"  . (" - " "--" "-"))
        ("-=" . " -= ")
        ("->" . " -> ")
        (">"  . (" > " " => " " >= " ">"))
        (">=" . " >= ")
        ("%"  . (" % " " %= " "%"))
        ("%="  . " %= ")
        ("!" . (" != " " !~ " "!"))
        ("!="  . " != " )
        ("!~" . " !~ ")
        ("~" . (" =~ " "~"))
        ("::" . " :: ")
        ("&"  . (" & " " && " "&"))
        ("&=" . " &= ")
        ("&&=" . " &&= ")
        ("*"  . (" * " "**" "*"))
        ("*="  . " *= " )
        ("<" . (" < " " <= " "<"))
        ("<=" . " <= ")
        ("<<=" . " <<= ")
        ("<-" . " <- ")
        ("|"  . (" ||= " " || " "|"))
        ("|=" . " |= ")
        ("||=" . " ||= ")
        ("/" . ("/`!!'/" " / " "// "))
        ("/=" . " /= ")
        ("/*" . "/* `!!' */")
        ("{" . ("{`!!'}" "{"))
        ("{|" . "{ |`!!'|  }")
        ("\"" . ("\"`!!'\"" "\""))
        ("'" . ("'`!!''" "'"))
        ("(" . ("(`!!')" "("))))


(setq key-combo-yatex-mode-hooks
      '(yatex-mode-hook
 	))

(setq key-combo-yatex-default
      '(("," . ",\\ ")
	("=" . " = ")
	(">" . " > ")
	("<" . " < ")
      ("+" . " + ")
      ("-" . " - ")))


(key-combo-define-hook key-combo-common-mode-hooks
                       'key-combo-common-load-default
                       key-combo-common-default)
(key-combo-define-hook key-combo-js-mode-hooks
                       'key-combo-js-load-default
                       key-combo-js-default)
(key-combo-define-hook key-combo-lisp-mode-hooks
                       'key-combo-lisp-load-default
                       key-combo-lisp-default)
(key-combo-define-hook key-combo-yatex-mode-hooks
                       'key-combo-yatex-load-default
                       key-combo-yatex-default)

