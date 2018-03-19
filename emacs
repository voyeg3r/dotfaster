(load-theme 'wombat)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;(set-default 'cursor-type 'hbar)
(ido-mode)
(column-number-mode)
(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(windmove-default-keybindings)

(blink-cursor-mode 1)

;; font setting
(set-default-font "FuraMono Nerd Font 14" nil t)


(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/") t)

(package-initialize)
