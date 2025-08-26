;;; nano-theme-light.el --- Selenized light palette for nano -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;; This file provides a light colour palette based on the Selenized
;; **light** specification.  The function `nano-theme-set-light` assigns
;; the `nano-color-*` variables to values taken from the official
;; selenized light palette.  Use this in conjunction with your own
;; theme (e.g., selenized-solarized-light) to ensure that the semantic
;; faces defined by nano match the overall colour scheme.  You can call
;; this function via the `-light` switch when starting Emacs.

(require 'nano-base-colors)

(defun nano-theme-set-light ()
  "Apply the selenized light nano colour palette."
  (setq frame-background-mode 'light)
  ;; Backgrounds and foregrounds【646016900453456†L116-L124】
  ;; Assign colours from the Selenized light palette.  See
  ;; https://github.com/jan-warchol/selenized for details.
  ;; Backgrounds and foregrounds
  (setq nano-color-background "#fbf3db")  ;; bg_0 – very light beige
  (setq nano-color-highlight  "#ece3cc")  ;; bg_1 – slightly darker beige
  (setq nano-color-subtle     "#d5cdb6")  ;; bg_2 – subtle background
  (setq nano-color-faded      "#909995")  ;; dim_0 – muted gray/green
  (setq nano-color-foreground "#53676d")  ;; fg_0 – main text colour
  (setq nano-color-strong     "#3a4d53")  ;; fg_1 – strong/emphasised text
  ;; Accent colours from Selenized light
  (setq nano-color-salient    "#0072d4")  ;; blue
  (setq nano-color-popout     "#d2212d")  ;; red
  (setq nano-color-critical   "#ad8900")  ;; yellow
  ;; Provide backwards‑compatible variable names expected by some modules.
  (setq nano-light-background nano-color-background)
  (setq nano-light-highlight  nano-color-highlight)
  (setq nano-light-subtle     nano-color-subtle)
  (setq nano-light-faded      nano-color-faded)
  (setq nano-light-foreground nano-color-foreground)
  (setq nano-light-strong     nano-color-strong)
  (setq nano-light-salient    nano-color-salient)
  (setq nano-light-popout     nano-color-popout)
  (setq nano-light-critical   nano-color-critical)
  ;; Record the current theme
  (setq nano-theme-var "light"))

(provide 'nano-theme-light)

;;; nano-theme-light.el ends here