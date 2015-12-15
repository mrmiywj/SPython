;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; File: TRANSCRIPT-A.SCM
;; 
;; TRANSCRIPT
;; CS61AS - Fall 14 
;; Schython; Project 4
;; Person A
;; @author Michael Ferrin
;; Partner: Karan Das

#|
;;------------------------------------Py-Read----------------------------;;
;; Playing around with the (py-read) command

	STk> (py-read)x = 3
	(0 x = 3)
	STk> (py-read)  if a == 3:
	(2 if a == 3 :)
	STk> (py-read)(3+4)
	(0 |(| 3 + 4 |)|)

;;------------------------------------Common 1----------------------------;;
;; Test to make sure comments are ignored.

	STk> (py-read)x = 3
	(0 x = 3)
	STk> (py-read)x = 3 # I am a comment IGNORE ME
	(0 x = 3)
	STk> (py-read)x = 3 # Om # nom # nom
	(0 x = 3)


;;------------------------------------Common 2----------------------------;;
;; Test to make sure irrelivant spaces are ignored.

	STk> (py-read)x = 3
	(0 x = 3)
	STk>  (py-read) x = 3
	(1 x = 3)
	STk> (py-read)     x = 3
	(5 x = 3)
	STk>     (py-read)   x = 3
	(3 x = 3)


;;---------------------------------------A 3------------------------------;;
;; Test to make sure single and double quotes work correctly
;; according to python.

	STk> (py-read) print "Hello 'world'."
	(1 print "Hello 'world'.")
	STk> (py-read) print 'Hello 'world'.'
	(1 print "Hello " world ".")
	STk> (py-read) print 'Hello "world".'
	(1 print "Hello \"world\".")


;;---------------------------------------A 4------------------------------;;
;; Test to see if the __contains__ method works correctly.

	STk> (define test-num-1 (make-py-num 3))
	test-num-1
	STk> (define test-num-2 (make-py-num 2))
	test-num-2
	STk> (define test-list
	            (make-py-list (list (make-py-num 3) (make-py-num 4)
	                                (make-py-num 5) (make-py-num 6))))
	test-list
	STk> (ask (ask test-list '__contains__ test-num-1) 'true?)
	#t
	STk> (ask (ask test-list '__contains__ test-num-2) 'true?)
	#f


;;---------------------------------------A 5------------------------------;;
;; Logical and tests.

	>>> x = 3
	>>> (x == 3) and (x == 4)
	False
	>>> True and 3 and 5
	5
	>>> True and 3 and False
	False

;; Logical or tests.

	>>> True or 3 or False
	True
	>>> True or 3 or False
	True
	>>> (x == 3) or (x == 4)
	True
	>>> True or 3 or 5
	True


;;------------------------------------Common 6----------------------------;;
;; Python while loop fun.

	>>> x = 3
	>>> while x < 5:
	... print x
	... x = x + 1
	... 
	3
	4
	>>> x = 3
	>>> while x < 5:
	... print x
	... break
	... 
	3
	>>> x = 3
	>>> while x < 5:
	... x = x + 1
	... continue
	... 


;;---------------------------------------A 7------------------------------;;
;; Python for loop fun.

	>>> for i in range(3, 10, 2):
	... print i
	... 
	3
	5
	7
	9
	>>> for i in range(7):
	... print i
	... 
	0
	1
	2
	3
	4
	5
	6
	>>> for k in range(9):
	... print k
	... 
	0
	1
	2
	3
	4
	5
	6
	7
	8
	>>> for j in range(3, 7):
	... print j
	... 
	3
	4
	5
	6


;;------------------------------------Common 8----------------------------;;
;; Practice with dictionaries.  Much more visual than java maps.

	>>> x = {"hello" : "world", "foo" : "bar"}
	>>> x
	{ "hello" : "world", "foo" : "bar" }
	>>> x["hello"] # dictionaries can be subscripted, like lists. They expect keys as their subscript input, and if the dictionary contains that key, it will return the associated value 'world'
    "world"
	>>> x["hello"]
	"world"
	>>> x["foo"]
	"bar"
	>>> x[1] = 2
	>>> x
	{ "hello" : "world", "foo" : "bar", 1 : 2 }
	>>> x["hello"] = x[1] + 3
	>>> x
	{ "hello" : 5, "foo" : "bar", 1 : 2 }
	>>> x = { 1 : "a", 2 : "b" }
	>>> x
	{ 1 : "a", 2 : "b" }
	>>> 1 in x
	True
	>>> 2 in x
	True


;;------------------------------------Common 9----------------------------;;
;; READ-ME:
;; My partner did not complete B7 which is neccesary to for me to load
;; my programs.py and for me to run my memoize.py.  In order to get
;; around this problem, and still have the same learning experience I typed
;; everything directly into Python which I downloaded on my computer
;; (rather that into our scheme implementation of Python).  While it wasn't
;; as satisfying as running code on our scheme version, I was still able
;; complete everything as shown below.  I hope this will be acceptable given
;; what the circumstances.  Thanks! - Michael.
;; 

;; Testing out fibinacci numbers.
	>>> def fib(n):
	...         if n == 0 or n == 1 : # fib(0) = 0; fib(1) = 1
	...           return n
	...         else:
	...           return fib(n-1) + fib(n-2) # fib(n) = fib(n-1) + fib(n-2)
	... 
	>>> fib(1)
	1
	>>> fib(0)
	0
	>>> fib(4)
	3
	>>> fib(100)
	*ETERNAL WAITING*


;; Trying fib with memoization (This is insanely fast).
	>>> def make_fib_memos():
	...         fib_memos = {}
	...         def fib(x):
	...           if x in fib_memos:     #fibonacci(x) has already been computed, return this value
	...             return fib_memos[x]
	...           elif x <= 1:
	...             return x
	...           else:
	...             t = fib(x-1) + fib(x-2)
	...             fib_memos[x] = t
	...             return t
	...         return fib
	... 
	>>> memo_fib = make_fib_memos()
	>>> print memo_fib(10)
	55
	>>> print memo_fib(50)
	12586269025
	>>> print memo_fib(100)
	354224848179261915075


;; Factorial with memoization.
	>>> def make_fact_memos():
	...         fact_memos = {}
	...         def fact(x):
	...           if x in fact_memos:    # we've already computed fact(x)
	...             return fact_memos[x]
	...           elif x <= 1:
	...             return x            # fact(0) = fact(1) = 1
	...           else:
	...             t = x * fact(x-1)
	...             fact_memos[x] = t
	...             return t
	...         return fact
	... 
	>>> memo_fact = make_fact_memos()
	>>> print memo_fact(0)
	0
	>>> print memo_fact(2)
	2
	>>> print memo_fact(20)
	2432902008176640000


;; Defining my own memoize procedure.
	>>> def memoize(procedure):
	...     info = {}
	...     def help(i):
	...         if i in info:
	...             return info[i]
	...         elif i not in info:
	...             k = procedure(i, help)
	...             info[i] = k
	...             return info[i]
	...     return help
	... 


;; Crossing my fingers for memoizing factorial.
	>>> def __factorial(x, memo):
	...         if x <= 1:
	...           return x
	...         else:
	...           return x * memo(x-1)
	... 
	>>> factorial = memoize(__factorial)
	>>> factorial(0)
	0
	>>> factorial(2)
	2
	>>> factorial(20)
	2432902008176640000


;; It worked! This is very useful.  How did I not learn about it in 
;; CS10 or 61b?
	>>> def __fib(x, memo):
	...         if x <= 1:
	...           return x
	...         else:
	...           return memo(x-1) + memo(x-2)
	... 
	>>> fib_memo = memoize(__fib)
	>>> fib_memo(10)
	55
	>>> fib_memo(50)
	12586269025
	>>> fib_memo(100)
	354224848179261915075L


;;-------------------------------------The End-----------------------------;;
|#





















