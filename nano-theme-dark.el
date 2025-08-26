;;; nano-theme-dark.el --- Selenized dark palette for nano -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;; This file redefines the dark palette for nano to use colours from the
;; Selenized dark colour scheme.  When you call `nano-theme-set-dark`,
;; it sets the various `nano-color-*` variables to values taken from
;; the selenized dark specification.  See the upstream specification
;; for details【646016900453456†L8-L29】.  You can invoke this function
;; manually or via the `-dark` command line switch handled in
;; `nano.el`.  No faces are applied here; `nano-faces` should still be
;; loaded after your own theme to pick up these variables.

(require 'nano-base-colors)

(defun nano-theme-set-dark ()
  "Apply the selenized dark nano colour palette."
  ;; According to selenized dark palette【646016900453456†L14-L29】:
  ;; Backgrounds and foregrounds
  (setq frame-background-mode 'dark)
  (setq nano-color-background "#103c48")  ;; bg_0
  (setq nano-color-highlight  "#184956")  ;; bg_1
  (setq nano-color-subtle     "#2d5b69")  ;; bg_2
  (setq nano-color-faded      "#72898f")  ;; dim_0
  (setq nano-color-foreground "#adbcbc")  ;; fg_0
  (setq nano-color-strong     "#adbcbc")  ;; strong = same as foreground
  ;; Accent colours
  (setq nano-color-salient    "#4695f7")  ;; blue
  (setq nano-color-popout     "#fa5750")  ;; red
  (setq nano-color-critical   "#dbb32d")  ;; yellow
  ;; Provide backwards‑compatible variable names expected by some modules.
  (setq nano-dark-background nano-color-background)
  (setq nano-dark-highlight  nano-color-highlight)
  (setq nano-dark-subtle     nano-color-subtle)
  (setq nano-dark-faded      nano-color-faded)
  (setq nano-dark-foreground nano-color-foreground)
  (setq nano-dark-strong     nano-color-strong)
  (setq nano-dark-salient    nano-color-salient)
  (setq nano-dark-popout     nano-color-popout)
  (setq nano-dark-critical   nano-color-critical)
  ;; Record the current theme name for toggling
  (setq nano-theme-var "dark"))

(provide 'nano-theme-dark)

;;; nano-theme-dark.el ends here