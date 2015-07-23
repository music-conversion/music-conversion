(in-package :t2l)












;; ITA 

(defun ita-mashup (list)
  (let ((title (a-member-of list)))
    (ita-mashup-internal title (remove-if #'(lambda (x) (equalp x title)) list))))

(defun ita-mashup-internal (titles list)
  (cond ((null list) titles)
        (t
         (either
           (let ((next-title (a-member-of list)))
             (ita-mashup-internal (ita-lineup titles next-title)
                                  (remove-if #'(lambda (x) (equalp x next-title)) list)))
           titles))))


(defun ita-lineup (ts1 ts2)
  (let ((ts1-len (length ts1))
        (ts2-len (length ts2)))
    (let ((overlap (an-integer-between 1 (min ts1-len ts2-len))))
      (unless (equalp (subseq ts1 (- ts1-len overlap) ts1-len)
                      (subseq ts2 0 overlap))
        (fail))
      (let ((title (concatenate 'list ts1 (subseq ts2 overlap))))
        (if (> t2l::*mess* 0) (print (format nil " ita-line-up ts1: ~A ts2: ~A" ts1 ts2)))
        title))))

(defun best-ita-mashup (list &key character-count)
  (setf list (remove-if #'null list))
  (let ((score (an-integerv)))
    (assert! (>=v score 0))
    (best-value (solution (let ((title (ita-mashup list)))
                            (assert! (=v score 
                                         (if character-count 
                                             (length title)
                                           (reduce #'+ (mapcar #'length title)))))
                            (print title))
                          (static-ordering #'linear-force))
                score)))



; OMTristan 3.0 TMlibrairie-OM.lisp
;===Rename escalier as stairs 26-06-2007===================
(define-box stairs ((list (1 2 3 4 5 6)) (step 2))
  :indoc '("List" "Step")
  :icon 136
  :doc   "permute en escalier : si pas = 2 ,(1 2 3 4 5 6)  devient (1 3 2 4 3 5 4 6)"
  (let (c)
    (dotimes (i (- (length list)  step))
      (push (nth i list) c)
      (push (nth (+ i pas) list) c))
    (nreverse c)))
