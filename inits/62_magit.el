
;;----------------------------------------------------------------
;; #magit
;;
(require 'magit)

;; Warning (:warning): for magit-1.4.0

;; You have just updated to version 1.4.0 of Magit, and have to
;; make a choice.

;; Before running Git, Magit by default reverts all unmodified
;; buffers that visit files tracked in the current repository.
;; This can potentially lead to data loss, so you might want to
;; disable this by adding the following line to your init file:

;;   (setq magit-auto-revert-mode nil)

;; The risk is not as high as it might seem.  Snapshots on MELPA
;; and MELPA-Stable have had this enabled for a long time, so if
;; you have not experienced any data loss in the past, you should
;; probably keep this enabled.

;; Keeping this mode enabled is only problematic if you, for
;; example, use `git reset --hard REV' or `magit-reset-head-hard'
;; and expect Emacs to preserve the old state of some file in a
;; buffer.  If you turn off this mode then file-visiting buffers and
;; the Magit buffer will no longer be in sync, which can be confusing
;; and would complicate many operations.  Note that it is possible
;; to undo an automatic buffer reversion using `C-x u' (`undo').

;; To prevent this message from being shown each time you start
;; Emacs, you must add the following line to your init file:

;;   (setq magit-last-seen-setup-instructions "1.4.0")

;; You might also want to read the release notes:
;; https://raw.githubusercontent.com/magit/magit/next/Documentation/RelNotes/1.4.0.txt


(setq magit-auto-revert-mode nil)

(setq magit-last-seen-setup-instructions "1.4.0")
