;; Procedures whose definition might conflict with other R5RS Scheme
;; implementations

(define datum->string
  (lambda (x)
    (call-with-string-output-port
      (lambda (p) (display x p)))))

(define lex<=?
  (lambda (x y)
    (string<=? (datum->string x) (datum->string y))))

(define sorter (lambda (ls) (sort lex<=? ls)))
