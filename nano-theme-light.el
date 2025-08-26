;;; nano-theme-light.el --- Selenized white palette for nano -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;; This file provides a light colour palette based on the Selenized white
;; theme.  The function `nano-theme-set-light` assigns the `nano-color-*`
;; variables to values taken from the selenized white specification【646016900453456†L110-L140】.  Use this in conjunction with
;; your own theme (e.g., selenized-solarized-white) to ensure that the
;; semantic faces defined by nano match the overall colour scheme.  You
;; can call this function via the `-light` switch when starting Emacs.

(require 'nano-base-colors)

(defun nano-theme-set-light ()
  "Apply the selenized white nano colour palette."
  (setq frame-background-mode 'light)
  ;; Backgrounds and foregrounds【646016900453456†L116-L124】
  (setq nano-color-background "#ffffff")  ;; bg_0 (pure white)
  (setq nano-color-highlight  "#ebebeb")  ;; bg_1
  (setq nano-color-subtle     "#cdcdcd")  ;; bg_2
  (setq nano-color-faded      "#878787")  ;; dim_0
  (setq nano-color-foreground "#474747")  ;; fg_0
  (setq nano-color-strong     "#474747")  ;; strong = foreground
  ;; Accent colours【646016900453456†L125-L139】
  (setq nano-color-salient    "#0064e4")  ;; blue
  (setq nano-color-popout     "#d6000c")  ;; red
  (setq nano-color-critical   "#c49700")  ;; yellow
  ;; Record the current theme
  (setq nano-theme-var "light"))

(provide 'nano-theme-light)

;;; nano-theme-light.el ends here