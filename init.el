;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
(require 'el-get) ;; local sources 
(setq el-get-sources
      '((:name magit
               :after (lambda ()
                        (global-set-key (kbd "C-x C-z") 'magit-status)

                        ;; Enable spell checking, fill for log editing
                        (add-hook 'magit-log-edit-mode-hook
                                  (lambda()
                                    (auto-fill-mode 1)
                                    (flyspell-mode 1)))))
	(:name yasnippet
	       :type git
	       :url "https://github.com/capitaomorte/yasnippet.git")

	(:name ergoemacs-keybindings
	       :description "A emacs keybinding set based on ergonomics."
	       :type svn
	       :url "http://ergoemacs.googlecode.com/svn/trunk/ergoemacs/ergoemacs-keybindings"
	       :features "ergoemacs-mode")
        ))

(setq my-packages (append '(el-get 
			    auto-complete 
			    color-theme) 
			  (mapcar 'el-get-source-name el-get-sources))) 
(el-get 'sync my-packages)
(el-get 'wait)
;; el-get 

(defun dim:notify-startup-done ()
  " notify user that Emacs is now ready"
  (el-get-notify
   "Emacs is ready."
   (format "The init sequence took %g seconds."
           (float-time (time-subtract after-init-time before-init-time)))))

(add-hook 'after-init-hook 'dim:notify-startup-done)
