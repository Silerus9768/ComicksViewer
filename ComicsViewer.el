;;; ComicsViewer.el --- a simple package                     -*- lexical-binding: t; -*-

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
(require 'ComicsViewer-Customs)
(require 'ComicsViewer-Resize-Functions)
(ComicsViewer-Load-Customs)
(require 'ComicsViewer-List-Functions)
(provide 'ComicsViewer)
;;; ComicsViewer.el ends here
