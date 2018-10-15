(server-start)

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

(setq default-frame-alist '((width . 156) (height . 50)))


;; Publishing
;; --------------------------------------------------------------------
(require 'ox-publish)
(setq org-publish-project-alist
      '(("org-notes"
        :base-directory "~/Drive/org/"
        :base-extension "org"
        :publishing-directory "~/Programming/blog/"
        :recursive t
        :publishing-function org-html-publish-to-html
        :headline-label 4
        :auto-preamble t)

        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Programming/blog/"
         :recursive t
         :publishing-function org-publish-attachment)

        ("org" :components ("org-notes" "org-static"))))


;; Theme
;; --------------------------------------------------------------------
(use-package atom-one-dark-theme)
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t
        sml/theme 'respectful)
  (sml/setup))


;; BASIC CUSTOMIZATION
;; --------------------------------------------------------------------
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


;; Org
;; --------------------------------------------------------------------
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; Autocompletion
;; --------------------------------------------------------------------
(use-package company
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

;; Go
;; --------------------------------------------------------------------
(use-package go-mode
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'go-mode-hook 'dumb-jump-mode)
  (setq go-packages-function 'go-packages-go-list))

;; init.el ends here
