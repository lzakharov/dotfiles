(require 'package)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)

(setq user-full-name "Lev Zakharov"
      user-mail-address "l.j.zakharov@gmail.com")

;; BASIC CUSTOMIZATION
;; --------------------------------------------------------------------
(load-theme 'wombat)

(setq inhibit-startup-message t)      ;; hide the startup message
(tool-bar-mode -1)                    ;; disable the tool bar
(scroll-bar-mode -1)                  ;; disable the scroll bar
(blink-cursor-mode -1)                ;; disable the cursor blinking
(setq ring-bell-function 'ignore)     ;; disable the bell ring
(global-linum-mode t)                 ;; show the line numbers
(column-number-mode t)                ;; show the column number
(size-indication-mode t)              ;; show the current buffer size
(show-paren-mode 1)                   ;; highlight matching brackets

(evil-mode 1)                         ;; enable evil mode
(electric-pair-mode 1)                ;; autocomplete paired brackets
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 4)            ;; how wide a tab is
(setq require-final-newline t)        ;; add newline at end of file

;; set encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; load environment variables from user's shell
(exec-path-from-shell-initialize)

;; show recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; revert the current buffer when its visited file changes on disk
(global-auto-revert-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; switch between visible buffers with shift + arrow keys
(use-package windmove
  :config
  (windmove-default-keybindings))

;; init.el ends here
