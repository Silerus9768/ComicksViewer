;;; ComicsViewer-Customs.el --- a simple package                     -*- lexical-binding: t; -*-

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
(defun ComicsViewer-Load-Customs ()
  "Функция загружает настройки по умолчанию"
  (interactive)
(defcustom Default-Comics-Viewer-Temp-Dir (substitute-in-file-name "$HOME/.cache/ComicsViewer/")
  "Директория временных файлов"
  :group 'Comics-Viewer
  :type 'directory)

(defcustom Default-Comics-Viewer-Temp-File "ResizedImage.png"
  "Временный файл"
  :group 'Comics-Viewer
  :type 'string)
(defvar Comics-Viewer-Image-List nil
  "Список изображений")
(defvar Comics-Viewer-Current-Image nil
  "Текущие изображение")
(defvar Comics-Viewer-Current-Image-Index nil
  "Индекс текущего изображение")
)

(provide 'ComicsViewer-Customs)
;;; ComicsViewer-Customs.el ends here
