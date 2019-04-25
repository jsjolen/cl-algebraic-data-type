;;;; defdata-examples.lisp


(in-package #:cl-algebraic-data-type)

;;; Maybe

(defdata (maybe :parametric-on a)
  (just a)
  nothing)

(defun maybe-or-else (m else)
  (match maybe m
    ((just x) x)
    (nothing else)))


;;; Either
(defdata (either :parametric-on (l r))
  (left l)
  (right r))

;;; Point

(defdata (point :mutable t)
  (rect float float))

(defvar *origin* (rect 0.0 0.0))

(defun mirror-point! (pt)
  (with-data (rect x y) pt
    (set-data pt (rect y x))))

(defdata (liszt :parametric-on k)
  (kons k liszt)
  knil)
;; https://gitlab.haskell.org/ghc/ghc/wikis/commentary/compiler/derive-functor
(defun derive-functor (adt) adt)
(defun derive-foldable (adt) adt)
(defun derive-traversable (adt) adt)
