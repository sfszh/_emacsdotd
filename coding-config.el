;; only coding mode configuration of init.el

;; Make sure spaces are used when indenting code
(setq-default indent-tabs-mode nil)

(defun code-common-setup()
    (linum-mode t))
;; FIXME: RET need a dwim function to suit auto-complete etc.
;;  (local-set-key (kbd "RET") 'newline-and-indent))

;; elisp mode
(defun elisp-mode-setup()
    (linum-mode t)
    (setq lisp-body-indent 4)           ;indent the body
    (local-set-key (kbd "M-<tab>") 'lisp-complete-symbol)) ;alt-tab is the universal "change to other frame"

(add-hook 'emacs-lisp-mode-hook '(lambda () 
				     (code-common-setup)
				     (elisp-mode-setup)))

;; python-mode
(add-hook 'python-mode-hook
          #'(lambda ()
                (setq autopair-handle-action-fns
                      (list #'autopair-default-handle-action
                            #'autopair-python-triple-quote-action))))
;; cc-mode
(require 'cc-mode)
(defun cc-mode-setup()
    (c-set-style "bsd")
    (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook #'(lambda () (cc-mode-setup)
				    (remove-dos-eol)))
					;do not autopair '{' in comments
(add-hook 'c++-mode-hook
          #'(lambda ()
		(push ?{
		      (getf autopair-dont-pair :comment))))

(add-hook 'c-initialization-hook
          (lambda()
              (define-key c-mode-base-map (kbd "C-<f1>")  'compile)
              (define-key c-mode-base-map (kbd "C-<f2>")  'gdb)
              (define-key c-mode-base-map (kbd "RET")     'newline-and-indent)
              (define-key c-mode-base-map (kbd "M-<tab>") 'semantic-ia-complete-symbol-menu)
              (define-key c-mode-base-map (kbd "<backtab>") 'toggle-buffer-folding)
              (define-key c-mode-base-map (kbd "C-M-<mouse-1>") 'semantic-ia-fast-mouse-jump)
              ))
(defun gdb-mode-setup()
    (setq gdb-many-windows t))
					;    (define-key (kbd "C-<f1>") 'gdb-restore-windows))
(add-hook 'gdb-mode-hook 'gdb-mode-setup)


;; whitespace-mode
					; make whitespace-mode use just basic coloring
(setq whitespace-style (quote
			( spaces tabs newline space-mark tab-mark newline-mark)))

;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
      '(
	(space-mark 32 [183] [46]) ; normal space
	(space-mark 160 [164] [95])
	(space-mark 2208 [2212] [95])
	(space-mark 2336 [2340] [95])
	(space-mark 3616 [3620] [95])
	(space-mark 3872 [3876] [95])
	(newline-mark 10 [182 10]) ; newlne
	(tab-mark 9 [9655 9] [92 9]) ; tab
	))

