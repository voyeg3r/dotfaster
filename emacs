;; https://github.com/jekor/.emacs
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; font setting
(set-default-font "Monaco 14")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Set line number mode to always be on
(global-linum-mode t)

;; no startup message
(setq inhibit-startup-message t)

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

; ignore case when searching
(setq-default case-fold-search 1)

; set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)

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
 '(package-selected-packages
   (quote
    (evil-visual-mark-mode solarized-theme org color-theme-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
