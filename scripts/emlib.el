;; my emacs lib of a bundle of functions


;; this does NOT work in MS and MAC
;; src: http://www.emacswiki.org/emacs/FullScreen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
;			 (defvar old-fullscreen nil)
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))

(defun dim:notify-startup-done ()
  " notify user that Emacs is now ready"
  (el-get-notify
   "Emacs is ready."
   (format "The init sequence took %g seconds."
           (float-time (time-subtract after-init-time before-init-time)))))

;; provide did not 
(provide 'emlib)
