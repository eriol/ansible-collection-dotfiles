; Enable MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

; Be evil!
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode 1))

; Markdown
(use-package markdown-mode
  :ensure t
  :init (setq markdown-command "multimarkdown")
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))


; (server-start) ; Enable server so other emacsclient connect to this.
(setq inhibit-startup-message t) ; Disable startup message.
(menu-bar-mode -1) ; Disable the menu bar.
(tool-bar-mode -1) ; Disable the toolbar.

; Theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t) 
  (load-theme 'doom-nord t))

; Show the max column indicator in programming modes.
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
