;; https://github.com/jekor/.emacs
;;(tool-bar-mode -1)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)


;; kill region =============================================================
(defun xah-delete-current-text-block ()
  "Delete the current text block or selection, and copy to `kill-ring'.
A “block” is text between blank lines.

URL `http://ergoemacs.org/emacs/emacs_delete_block.html'
Version 2017-07-09"
  (interactive)
  (let ($p1 $p2)
    (if (use-region-p)
        (setq $p1 (region-beginning) $p2 (region-end))
      (progn
        (if (re-search-backward "\n[ \t]*\n+" nil "move")
            (progn (re-search-forward "\n[ \t]*\n+")
                   (setq $p1 (point)))
          (setq $p1 (point)))
        (re-search-forward "\n[ \t]*\n" nil "move")
        (setq $p2 (point))))
    (kill-region $p1 $p2)))
(global-set-key (kbd "C-c k") 'xah-delete-current-text-block)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kill line if no region active                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://emacs-fu.blogspot.co.uk/2009/11/copying-lines-without-selecting-them.html
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; =============== Highlight current line =========================
;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; ========== Enable Line and Column Numbering ==========
;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; font setting
;;(set-default-font "Monaco 14")

;; Set line number mode to always be on
(global-linum-mode t)

;; no startup message
;;(setq inhibit-startup-message t)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Ctrl-RET Ctrl-Shift-RET
;; Insert new line below current line
;; and move cursor to new line
;; it will also indent newline
(global-set-key (kbd "<C-return>") (lambda ()
                   (interactive)
                   (end-of-line)
                   (newline-and-indent)))
;; Insert new line above current line
;; and move cursor to previous line (newly inserted line)
;; it will also indent newline
;; TODO: right now I am unable to goto previous line, FIXIT
(global-set-key (kbd "<C-S-return>") (lambda ()
                       (interactive)
                       (beginning-of-line)
                       (newline-and-indent)
                       (previous-line)))
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; adjust transpose-chars to switch previous two characters
;; source: http://pragmaticemacs.com/emacs/transpose-characters/
(global-set-key (kbd "C-t")
                (lambda () (interactive)
                  (backward-char)
                  (transpose-chars 1)))

; make end and home keys go to the start/end of buffers
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])

;; let's see if it works
(global-set-key (kbd "C-x G") 'end-of-buffer)
(global-set-key (kbd "C-x gg") 'beginning-of-buffer)

(global-set-key (kbd "M-<") 'end-of-buffer)
(global-set-key (kbd "M->") 'beginning-of-buffer)

; ignore case when searching
(setq-default case-fold-search 1)


; show the current line and column numbers in the stats bar as well
(line-number-mode 1)
(column-number-mode 1)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

; source: https://stackoverflow.com/a/88828/2571881
; (defun duplicate-line()
;   (interactive)
;   (move-beginning-of-line 1)
;   (kill-line)
;   (yank)
;   (newline)
;   (yank)
; )
; (global-set-key (kbd "C-d") 'duplicate-line)

; https://stackoverflow.com/a/3446738/2571881
(defun duplicate-line (&optional arg)
  "Duplicate it. With prefix ARG, duplicate ARG times."
  (interactive "p")
  (save-excursion
    (let ((beg (line-beginning-position))
          (end
           (progn (forward-line (1- arg)) (line-end-position))))
      (copy-region-as-kill beg end)
      (end-of-line) (newline)
      (yank)))
  (next-line arg))
(global-set-key (kbd "C-S-d") 'duplicate-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(ido-mode (quote both) nil (ido))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmelade" . "http://marmalade-repo.org/packages/"))))
 '(package-selected-packages
   (quote
    (expand-region ergoemacs-mode evil-visual-mark-mode solarized-theme org color-theme-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tirgger recorded macro
(define-key global-map [f4] 'call-last-kbd-macro)

;; turn on highlighting current line
(global-hl-line-mode 1)

;; turn on bracket match highlight
(show-paren-mode 1)

;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;;Then bind a key to it. I use C-c d.
;; to copy current line 5 times just:
;; M-5 C-c d
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; ================= melpa ==========================================
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
