;;; ComicsViewer-Resize-Functions.el --- a simple package                     -*- lexical-binding: t; -*-

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

(defun Add-BackSlash (path)
  "Функция добавляет обратный слеш к строке пути, если он необходим"
  (if (string-match "/+$" path) path (concat path "/")))
(defun Close-And-Del-Temp-Image-File ()
  "Функция закытия и удаления временного файла"
  (interactive)
  (let ((Temp-File (concat (Add-BackSlash Default-Comics-Viewer-Temp-Dir) Default-Comics-Viewer-Temp-File)))
    (delete-file Temp-File)
    (mapc (lambda (el)
	    (when (string= Temp-File (buffer-file-name el))
	      (kill-buffer el)))(buffer-list))))
(defun Resize-Image-To-Width-And-Heigth()
  "Функция приводит изображение к размерам окна"
  (interactive)
  (let ((width (nth 2 (window-body-pixel-edges)))
	(height (nth 3 (window-body-pixel-edges)))
	(file-name Comics-Viewer-Current-Image);;поправить под внешнию переменную
	(Temp-Dir (Add-BackSlash Default-Comics-Viewer-Temp-Dir))
	(Temp-File (concat (Add-BackSlash Default-Comics-Viewer-Temp-Dir) Default-Comics-Viewer-Temp-File)))
    (unless (file-directory-p Default-Comics-Viewer-Temp-Dir)
      (make-directory Temp-Dir t))
    (when (shell-command (concat "convert " file-name " -scale " (int-to-string width)
				 "x" (int-to-string height) "! -quality 100 "  Temp-File))
      (kill-buffer (current-buffer));;поправить с проверкой под внешнюю переменную
      (switch-to-buffer (find-file Temp-File))
      (local-set-key (kbd "q") 'Close-And-Del-Temp-Image-File))))

(defun Resize-Image-To-Width-And-Heigth-Optimal()
  "Функция приводит изображение к размерам окна"
  (interactive)
  (let ((width (nth 2 (window-body-pixel-edges)))
	(height (nth 3 (window-body-pixel-edges)))
	(file-name Comics-Viewer-Current-Image);;поправить под внешнию переменную
	(Temp-Dir (Add-BackSlash Default-Comics-Viewer-Temp-Dir))
	(Temp-File (concat (Add-BackSlash Default-Comics-Viewer-Temp-Dir) Default-Comics-Viewer-Temp-File)))
    (unless (file-directory-p Default-Comics-Viewer-Temp-Dir)
      (make-directory Temp-Dir t))
    (when (shell-command (concat "convert " file-name " -scale " (int-to-string width)
				 "x" (int-to-string height) " -quality 100 -gravity center -extent "
				 (int-to-string width) "x" (int-to-string height) " " Temp-File))
      (kill-buffer (current-buffer));;поправить с проверкой под внешнюю переменную
      (switch-to-buffer (find-file Temp-File))
      (local-set-key (kbd "q") 'Close-And-Del-Temp-Image-File))))

(defun Resize-Image-To-Width()
  "Функция приводит изображение к размерам окна"
  (interactive)
  (let ((width (nth 2 (window-body-pixel-edges)))
	(height (nth 3 (window-body-pixel-edges)))
	(file-name Comics-Viewer-Current-Image);;поправить под внешнию переменную
	(Temp-Dir (Add-BackSlash Default-Comics-Viewer-Temp-Dir))
	(Temp-File (concat (Add-BackSlash Default-Comics-Viewer-Temp-Dir) Default-Comics-Viewer-Temp-File)))
    (unless (file-directory-p Default-Comics-Viewer-Temp-Dir)
      (make-directory Temp-Dir t))
    (when (shell-command (concat "convert " file-name " -scale " (int-to-string width)
				 "x! -quality 100 " Temp-File))
      (kill-buffer (current-buffer));;поправить с проверкой под внешнюю переменную
      (switch-to-buffer (find-file Temp-File))
      (local-set-key (kbd "q") 'Close-And-Del-Temp-Image-File))))

(defun Resize-Image-To-Height ()
  "Функция приводит изображение к ширине окна"
  (interactive)
  (let ((width (nth 2 (window-body-pixel-edges)))
	(height (nth 3 (window-body-pixel-edges)))
	(file-name Comics-Viewer-Current-Image);;поправить под внешнию переменную
	(Temp-Dir (Add-BackSlash Default-Comics-Viewer-Temp-Dir))
	(Temp-File (concat (Add-BackSlash Default-Comics-Viewer-Temp-Dir) Default-Comics-Viewer-Temp-File)))
    (unless (file-directory-p Default-Comics-Viewer-Temp-Dir)
      (make-directory Temp-Dir t))    
    (when (shell-command (concat "convert " file-name " -scale x" (int-to-string height) "! -quality 100 " Temp-File))
      (kill-buffer (current-buffer));;поправить с проверкой под внешнюю переменную
      (switch-to-buffer (find-file Temp-File))
      (local-set-key (kbd "q") 'Close-And-Del-Temp-Image-File))))

(provide 'ComicsViewer-Resize-Functions)
;;; ComicsViewer-Resize-Functions.el ends here
