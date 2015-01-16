;; CHICKEN Scheme specific procedure definitions
;;
;; TODO A lot of these could be done with SRFI-1 procedures

(define datum->string ->string)

(define lex<=?
  (lambda (x y)
    (string<=? (datum->string x) (datum->string y))))

(define sorter (lambda (ls) (sort ls lex<=?)))

(define (remp p lst)
  (cond ((null? lst) '())
        ((p (car lst)) (remp p (cdr lst)))
        (else (cons (car lst) (remp p (cdr lst))))))

(define (exists p ls)
  (cond ((null? ls) #f)
        ((p (car ls)) #t)
        (else (exists p (cdr ls)))))
