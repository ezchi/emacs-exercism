;;; exercism.el --- Emacs exercism package           -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Enze Chi

;; Author: Enze Chi <enze.chi@gmail.com>
;; Keywords: exercism
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:


(require 'transient)

(defun exercism--async-run (cmd)
  "Run exercism CMD asynchronously."
  (let (cmd (format "exercism %s"))
    (async-shell-command cmd nil *Exercism Errors*)))

(define-suffix-command exercism--run-submit (args)
  ""
  (interactive (list (exercism-submit-arguments)))
  (message "hello"))

(define-transient-command exercism-submit ()
  "Submit solution to exercism."
  ["Argument"
   ("-h" "help" ("-h" "--help"))]
 ["Action"
   ("s" "Submit" exercism--run-submit)])

(defun exercism-submit-arguments ()
  (transient-args 'exercism-submit))

;;;###autoload (autoload 'exercism-dispatch "exercism" nil t)
(define-transient-command exercism-dispatch ()
  "Exercism command dispatch."
  ["Action"
   ("s" "Submit" exercism-submit)])

(defun exercism-dispatch-arguments ()
  (transient-args 'exercism-dispatch))

(provide 'exercism)
;;; exercism.el ends here
