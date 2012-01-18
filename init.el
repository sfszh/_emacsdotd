
;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
(require 'el-get) ;; local sources 
(setq el-get-sources
      '((:name magit
               :after (lambda ()
                        (global-set-key (kbd "C-x C-z") 'magit-status)

                        ;; Enable spell checking, fill for log editinghk
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
	       :features "ergoemacs-mode"
	       :after (lambda ()
			(define-key ergoemacs-keymap ergoemacs-kill-region-key 'clipboard-kill-region)
			(define-key ergoemacs-keymap ergoemacs-kill-ring-save-key 'clipboard-kill-ring-save)
			(define-key ergoemacs-keymap ergoemacs-yank-key 'clipboard-yank)
			(define-key ergoemacs-keymap ergoemacs-yank-pop-key 'clipboard-yank-pop)
			(define-key ergoemacs-keymap ergoemacs-copy-all-key 'clipboard-copy-all)
			(define-key ergoemacs-keymap ergoemacs-cut-all-key 'clipboard--cut-all)
			(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us")
			(ergoemacs-mode t)))
	(:name autopair
	       :after(lambda()
		       (autopair-global-mode t)))
        ))

(setq my-packages (append '(el-get 
			    auto-complete
			    magithub
			    lua-mode)
			  (mapcar 'el-get-source-name el-get-sources))) 
(el-get 'sync my-packages)
(el-get 'wait)


;; coding modes configuration are maintain in an seperate coding-config.el
(load-file "~/.emacs.d/coding-config.el")

;; global settings
(tool-bar-mode -1)

;; misc modes configuration which are not managed by el-get
(add-to-list 'load-path "~/.emacs.d/scripts")
(require 'emlib)
(require 'redo+)

(global-set-key [f11] 'toggle-fullscreen)
(add-hook 'after-init-hook 'dim:notify-startup-done)

;; ibuffer
(setq ibuffer-saved-filter-groups
      '(("home"
	 ("emacs-config" (filename . ".emacs.d/"))
	 ("Org" (or (mode . org-mode)
                     (filename . "OrgMode")
                     (name . "^\\*Calendar\\*$")
                     (name . "^diary$")))
	 ("Web Dev" (or (mode . html-mode)
			(mode . css-mode)))
         ("C" (mode . c-mode))
         ("C++" (mode . c++-mode))
         ("Python" (mode . python-mode))
	 ("Elisp" (mode . emacs-lisp-mode))
	 ("Lua" (mode . lua-mode))
         ("Dev Misc" (or (mode . cmake-mode)
                         (filename . "Makefile")
                         (name . "\*Compile")))
         ("LaTeX" (mode . latex-mode))
         ("Terminals" (mode . term-mode))
	 ("Subversion" (name . "\*svn"))
	 ("Magit" (name . "\*magit"))
	 ("ERC" (mode . erc-mode))
         ("Dired" (mode . dired-mode))
	 ("Manual" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*")))
         ("Massages" (or (mode . message-mode)
                     (mode . bbdb-mode)
                     (mode . mail-mode)
                     (mode . gnus-group-mode)
                     (mode . gnus-summary-mode)
                     (mode . gnus-article-mode)
                     (name . "^\\.bbdb$")
                     (name . "^\\.newsrc-dribble")))
        ;; ("MyProject1" (filename . "src/myproject1/"))
        ;; ("MyProject2" (filename . "src/myproject2/"))
)))

(add-hook 'ibuffer-mode-hook 
	  '(lambda ()
               (setq ibuffer-show-empty-filter-groups nil)
               (ibuffer-switch-to-saved-filter-groups "home")))

;; ibus-mode
(add-to-list 'load-path "~/.emacs.d/ibus-el/")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(setq ibus-agent-file-name "~/.emacs.d/ibus-el/ibus-el-agent")
;; Use C-SPC to toggle input status
(ibus-define-common-key (kbd "C-SPC") nil)
(global-set-key (kbd "C-SPC") 'ibus-toggle)
(add-hook 'after-init-hook 'ibus-mode-on)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("ab7d47105b6e5256e04202715509e4b8077dc214dbe21523005d8ff7e91ef178" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
