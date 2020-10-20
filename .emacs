
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (protobuf-mode org-ac org company-tabnine web-beautify projectile flx-ido go-mode ggtags))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :background "color-17"))))
 '(diff-context ((t (:foreground "green"))))
 '(diff-function ((t (:inherit diff-header :background "black"))))
 '(diff-removed ((t (:inherit diff-changed :background "red"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "green"))))
 '(font-lock-function-name-face ((t (:foreground "brightred"))))
 '(font-lock-string-face ((t (:foreground "color-33"))))
 '(match ((t (:background "brightblack"))))
 '(minibuffer-prompt ((t (:foreground "yellow")))))
(global-set-key (kbd "M-g") 'goto-line)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
(setq Buffer-menu-name-width 25)
(which-function-mode 1)
(setq-default c-basic-offset 4)
(show-paren-mode 1)
(global-set-key "\C-x\C-b" 'buffer-menu)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(setq-default ident-tabs-mode nil)
(setq tab-width 4)

;; web-beautify
(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

(add-to-list 'load-path "~/Documents/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
     (lambda () (flymake-mode t)))
(require 'protobuf-mode)
