;;; init.el --- Mark's Emacs config  -*- lexical-binding: t -*-

;; --- Package system (for when we install things later) ---
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; --- Basic sanity ---
(setq inhibit-startup-screen t)                ; skip the splash
(setq make-backup-files nil)                   ; no foo~ files
(setq create-lockfiles nil)                    ; no .#foo files (Windows hates these)
(global-auto-revert-mode 1)                    ; reload files changed on disk
(setq auto-revert-verbose nil)                 ; quietly
(setq-default indent-tabs-mode nil)            ; spaces, not tabs
(column-number-mode 1)                         ; show col in modeline
(show-paren-mode 1)                            ; highlight matching parens

;; --- Keybindings ---
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)

;; --- UI chrome ---
(menu-bar-mode 1)                       ; keep menu while ramping up
(tool-bar-mode -1)                        ; lose toolbar icons
(scroll-bar-mode -1)                    ; lose scrollbars

;; --- Appearance ---
(load-theme 'modus-operandi t)   ; light, subdued, warm off-white

;; Sans-serif for body text matches the Obsidian look
;; Segoe UI ships with Windows; falls back gracefully if not present
;; Monospace as the default — code, modeline, minibuffer, *scratch*, etc.
(set-face-attribute 'default nil
                    :family "Cascadia Code"
                    :height 140)

;; Same monospace for things that explicitly request fixed-pitch
(set-face-attribute 'fixed-pitch nil
                    :family "Cascadia Code"
                    :height 140)

;; Proportional font for prose buffers (opt-in via variable-pitch-mode)
(set-face-attribute 'variable-pitch nil
                    :family "Segoe UI"
                    :height 150)

;; Prose-y modes get proportional font automatically
(add-hook 'text-mode-hook #'variable-pitch-mode)
(add-hook 'markdown-mode-hook #'variable-pitch-mode)
(add-hook 'org-mode-hook #'variable-pitch-mode)

;; Breathing room
(set-fringe-mode 12)                    ; wider margins
(setq-default line-spacing 0.2)         ; 20% extra between lines

;;; init.el ends here
