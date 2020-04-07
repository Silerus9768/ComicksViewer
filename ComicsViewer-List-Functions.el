;;; ComicsViewer-List-Functions.el --- a simple package                     -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nick Sretenskiy

;; Author: Nick Sretenskiy <silerus9768@gmail.com>
;; Keywords: lisp
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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Put a description of the package here

;;; Code:

;; code goes here

(defun Add-Image-To-list()
  "Добавляет выделенные файлы в список"
  (interactive)
  (let ((dir-list))
  (mapc (lambda(el)
	  (cond
	   ((file-exists-p el)
	    (when (string-match
		   "\\.\\(tif|tiff|gif|jpeg|jpg|jif|jfif|jp2|jpx|j2k|j2c|png|pdf|zip|rar|tgz|tar|tar\\.gz|gz|cbr|cbz|Z|bz|bz2|xz|7z|tbz|tbz2|tZ\\)$" el)
	      (add-to-list 'Comics-Viewer-Image-List el)))
	   ((file-directory-p el) (add-to-list 'dir-list el))))
	(dired-get-marked-files))
  (mapc (lambda(el)
	  (mapc (lambda(el1)
		  (add-to-list 'Comics-Viewer-Image-List el1))
		(directory-files-recursively
		 el
		 "\\.\\(tif|tiff|gif|jpeg|jpg|jif|jfif|jp2|jpx|j2k|j2c|png|pdf|zip|rar|tgz|tar|tar\\.gz|gz|cbr|cbz|Z|bz|bz2|xz|7z|tbz|tbz2|tZ\\)$"))) dir-list)))

(defun Uncompress-Images-Archive (file Output)
  "Функция распаковывает архив"
  (unless (file-directory-p Output) (make-directory Output t))
  (shell-command (concat "atool --extract-to=" Output " --each --explain "file)))

(defun Add-Image-By-Dired()
  "Запускает dired для добавления элементов"
  (interactive)
  (dired default-directory)
  (local-set-key (kbd "a") 'Add-Image-To-list))

(provide 'ComicsViewer-List-Functions)
;;; ComicsViewer-List-Functions.el ends here
