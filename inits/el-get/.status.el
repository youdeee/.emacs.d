((chriskempson/tomorrow-theme/GNU\ Emacs status "required" recipe nil)
 (color-theme status "required" recipe
	      (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
		     ("xzf")
		     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
		     (progn
		       (color-theme-initialize)
		       (setq color-theme-is-global t))))
 (color-theme-tomorrow status "required" recipe
		       (:name color-theme-tomorrow :description "Emacs highlighting using Chris Charles's Tomorrow color scheme" :type github :pkgname "ccharles/Tomorrow-Theme" :depends color-theme :prepare
			      (progn
				(autoload 'color-theme-tomorrow "GNU Emacs/color-theme-tomorrow" "color-theme: tomorrow" t)
				(autoload 'color-theme-tomorrow-night "GNU Emacs/color-theme-tomorrow" "color-theme: tomorrow-night" t)
				(autoload 'color-theme-tomorrow-night-eighties "GNU Emacs/color-theme-tomorrow" "color-theme: tomorrow-night-eighties" t)
				(autoload 'color-theme-tomorrow-night-blue "GNU Emacs/color-theme-tomorrow" "color-theme: tomorrow-night-blue" t)
				(autoload 'color-theme-tomorrow-night-bright "GNU Emacs/color-theme-tomorrow" "color-theme: tomorrow-night-bright" t))))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (emacs-jazzradio status "installed" recipe
		  (:name emacs-jazzradio :type github :pkgname "syohex/emacs-jazzradio" :after nil))
 (package status "required" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (let
		       ((old-package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))))
		     (when
			 (file-directory-p old-package-user-dir)
		       (add-to-list 'package-directory-list old-package-user-dir)))
		   (setq package-archives
			 (bound-and-true-p package-archives))
		   (mapc
		    (lambda
		      (pa)
		      (add-to-list 'package-archives pa 'append))
		    '(("ELPA" . "http://tromey.com/elpa/")
		      ("melpa" . "http://melpa.org/packages/")
		      ("gnu" . "http://elpa.gnu.org/packages/")
		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (tomorrow-theme status "installed" recipe
		 (:name tomorrow-theme :type github :pkgname "chriskempson/tomorrow-theme" :after nil)))
