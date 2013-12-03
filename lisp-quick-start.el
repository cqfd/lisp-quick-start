;;; lisp-quick-start.el --- Admit it, you were going to type it anyway.

;;; Author: Alan O'Donnell <alan.m.odonnell@gmail.com>
;;; URL: https://github.com/happy4crazy/lisp-quick-start
;;; Version: 0.0.1

(defvar lisp-quick-start-lispy-modes
  '(lisp-interaction-mode
    inferior-emacs-lisp-mode
    emacs-lisp-mode
    clojure-mode))

(defun lisp-quick-start-maybe-insert-left-paren ()
  (when (member major-mode lisp-quick-start-lispy-modes)
    (when (zerop (buffer-size))
      (execute-kbd-macro "("))))

(defadvice switch-to-buffer
    (after lisp-quick-start-switch-to-buffer activate)
  (lisp-quick-start-maybe-insert-left-paren))

(defadvice other-window
    (after lisp-quick-start-other-window activate)
  (lisp-quick-start-maybe-insert-left-paren))

(provide 'lisp-quick-start)

;;; lisp-quick-start.el ends here
