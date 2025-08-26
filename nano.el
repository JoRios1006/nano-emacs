;;; nano.el --- Modified N Λ N O loader without theme/splash -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;; This is a customised entry point for the nano-emacs modules.  Unlike the
;; upstream `nano.el` it does **not** load nano’s built‑in themes,
;; splash screen, modeline or keybindings.  Instead, it loads only
;; essential modules (layout, session, help) and leaves theming to your
;; own configuration.  You can still use the dark/light colour palettes
;; provided by nano by invoking Emacs with `-dark` or `-light` on the
;; command line; these flags call `nano-theme-set-dark` or
;; `nano-theme-set-light` to update the `nano-color-*` variables without
;; overriding your theme.  All other modules (nano-defaults,
;; nano-modeline, nano-bindings, nano-splash) are intentionally not
;; loaded so that your existing theme, dashboard and keybindings are
;; preserved.

(package-initialize)

;; Load minimal layout settings for consistent margins/fringes
(require 'nano-layout)

;; Register command‑line switches recognised by the original nano.el.  These
;; assignments suppress warnings from `nano-theme` functions but no
;; longer trigger loading of nano’s own theme or splash screen.  When
;; passed, `-dark` or `-light` will call our modified theme functions
;; defined in `nano-theme-dark.el` and `nano-theme-light.el` respectively.
(add-to-list 'command-switch-alist '("-dark"   . (lambda (args) (nano-theme-set-dark))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args) (nano-theme-set-light))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-help" . (lambda (args))))
(add-to-list 'command-switch-alist '("-compact" . (lambda (args))))

;; Support per‑installation customisations.  If a file named
;; `nano-custom.el` exists in the same directory as this file, it will be
;; loaded under the same conditions as the upstream loader.  This makes
;; it easy to extend nano without editing this file.
(let* ((this-file  (or load-file-name (buffer-file-name)))
       (this-dir   (file-name-directory this-file))
       (custom-path  (concat this-dir "nano-custom.el")))
  (when (and (eq nil user-init-file)
             (eq nil custom-file)
             (file-exists-p custom-path))
    (setq user-init-file this-file)
    (setq custom-file custom-path)
    (load custom-file)))

;; Colour palette definitions: we defer loading of `nano-faces` to your
;; init file so that it picks up the colours from your active theme.
;; However, if you invoke Emacs with -dark or -light, call the
;; corresponding functions to update the nano colour variables.  These
;; functions are defined in the patched theme files below.

;; Session management (recentf, savehist, backups) and help modules
;; enhance usability without affecting the UI.  If you don’t need them,
;; simply comment out these lines.
(require 'nano-session)
(unless (member "-no-help" command-line-args)
  (require 'nano-help))

;; Provide the feature so `(require 'nano)` succeeds
(provide 'nano)

;;; nano.el ends here