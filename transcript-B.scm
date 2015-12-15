;;PERSON B TRANSCRIPT
;;
;;KARAN DAS
;;
;;
;;


#|
1
STk> (py-read)x = 3
(0 x = 3)
STk> (py-read)x = 3 # I am a comment IGNORE ME
(0 x = 3)
STk> (py-read)x = 3 # Om # nom # nom
(0 x = 3)


2
STk> (py-read)x = 3
(0 x = 3)
STk>  (py-read) x = 3
(1 x = 3)
STk> (py-read)     x = 3
(5 x = 3)
STk>     (py-read)   x = 3
(3 x = 3)


B3
STk> (py-read) print 3.14.foo
(1 print 3.14 .foo)
STk> (py-read) print 3.14
(1 print 3.14)
STk> (py-read) print 3.14 + 5.15
(1 print 3.14 + 5.15)


B4
STk> (ask (negate-bool *PY-TRUE*) 'true?)
#f
STk> (ask (negate-bool *PY-FALSE*) 'true?)
#t


B5
>>> 1 in [1, 2, 3]
True
>>> 4 in [1, 2, 3]
False


6
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
|#






