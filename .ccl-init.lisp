(setq *print-pretty* t)

(defmacro make-module-pathname (str)
  `(defparameter
     ,(intern (string-upcase
                (concatenate 'string
                             "*module-" str "*")))
     ,(merge-pathnames (pathname (concatenate 'string str ".lisp"))
                       (merge-pathnames (pathname "Lisp/lib/")
                                        (user-homedir-pathname)))))

(make-module-pathname "ahead-reader")
(make-module-pathname "coordinate-manager")
(make-module-pathname "csv-reader")
(make-module-pathname "database-manager")
(make-module-pathname "date-time")
(make-module-pathname "graph-utils")
(make-module-pathname "ltk")
(make-module-pathname "math")
(make-module-pathname "pict")
(make-module-pathname "regex")
(make-module-pathname "stdlib")
(make-module-pathname "test-utils")
(make-module-pathname "vba")
(make-module-pathname "xml-manager")
