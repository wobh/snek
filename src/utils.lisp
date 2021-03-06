
;http://cl-cookbook.sourceforge.net/os.html
(defun cmd-args ()
  (or #+SBCL *posix-argv*
      #+LISPWORKS system:*line-arguments-list*
      #+CMU extensions:*command-line-words*
       nil))


(defun 2* (l) (* l 2))


(defun 2+ (l) (+ l 2))


(defun half (l) (/ l 2))


(defmacro print-every (i n)
  `(if (= 0 (mod ,i ,n)) (print ,i)))


(defun make-dfloat-array (rows &key (cols 2) (initial 0.0d0))
  (make-array
    (list rows cols)
    :initial-element initial
    :element-type 'double-float ))


(defun make-symb-array (rows &key (initial nil))
  (make-array
    rows
    :initial-element initial
    :element-type 'symbol))


(defun make-int-array (rows  &key (cols 2) (initial 0))
  (make-array
    (list rows cols)
    :initial-element initial
    :element-type 'integer))


(defun make-vec (&optional (n 10))
  (make-array
    n
    :fill-pointer 0
    :initial-element nil))


(defun arr (n &optional (adjustable nil))
  (make-array n :fill-pointer 0 :adjustable adjustable))


(defun to-list (aa)
  (loop for i from 0 below (length aa)
    collect (aref aa i)))


(defun to-int (x)
  (coerce x 'integer))


(defun to-int* (xx)
  (mapcar (lambda (x) (coerce x 'integer)) xx))


(defun to-dfloat (x)
  (coerce x 'double-float))


(defun to-dfloat* (xx)
  (mapcar (lambda (x) (coerce x 'double-float)) xx))


(defun x-or-large (x &optional (l 100000.0d0) (lim 0.00001d0))
  (if (> x lim) x l))


(defmacro val-if-eql (a b)
  (with-gensyms (aname)
    `(let ((,aname ,a))
      (if (eql ,aname ,b) ,aname nil))))


(defmacro white (&optional (alpha 1.0d0))
  `(list 1.0d0 1.0d0 1.0d0 ,alpha))


(defmacro black (&optional (alpha 1.0d0))
  `(list 0.0d0 0.0d0 0.0d0 ,alpha))


(defmacro dark (&optional (alpha 1.0d0))
  `(list 0.2d0 0.2d0 0.2d0 ,alpha))


(defmacro gray (v &optional (alpha 1.0d0))
  `(list ,v ,v ,v ,alpha))


(defun append-postfix (fn postfix)
  (concatenate 'string fn postfix))

