;; myfns.ss: PLAN interpreter

;; Main interpreter function
;; Everything starts here
(define (myinterpreter inputProg)
	(if (null? inputProg)'()
	;; evaluate the programs
	(cons (evalProgs (car inputProg))
	(myinterpreter (cdr inputProg)))))

;; Evaluate the program
(define (evalProgs prog)
	(evalExpr (cadr prog) '()))

;; Evaluate the expression using the given bindings.
(define (evalExpr expr bindings)
	(cond
	;; if integer, return integer
	((integer? expr)expr)
	;; if symbol, look up variable in the binding list
	((symbol? expr)(lookBinding bindings expr))
	;; if myignore, return 0
	((equal? (car expr) 'myignore)0)
	;; if myadd, add the value of two sub-expression
	((equal? (car expr) 'myadd)
		(+ (evalExpr (cadr expr) bindings)(evalExpr (caddr expr) bindings)))
	;; if mymul, calculate the product of two sub-expression
    	((equal? (car expr) 'mymul)(* (evalExpr (cadr expr) bindings)(evalExpr (caddr expr) bindings)))
	;; if myneg, negate the value of sub-expression
    	((equal? (car expr) 'myneg)(- (evalExpr (cadr expr) bindings)))
	;; if mylet, add new binding and evaluate expression
    	((equal? (car expr) 'mylet)
     		(let ((var (cadr expr))
           	      (exp (caddr expr))
           	      (body (cadddr expr)))
       		      (let ((newBinding (extendBList bindings var (evalExpr exp bindings))))
         	      	(evalExpr body newBinding))))))

;; Lookup the given variable in the given binding list
(define (lookBinding bindingList var)
	(let ((binding (car bindingList)))
	(if (equal? (car binding) var) 
		(cdr binding)
		(lookBinding (cdr bindingList)))))

;; Extend the binding list with a new binding
(define (extendBList bindingList var value)
	(cons (cons var value)bindingList))