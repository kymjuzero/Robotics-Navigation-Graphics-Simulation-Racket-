;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))



;; An robots state (x, y, direction) is a (cons Nat (cons Nat (cons symbol empty)))
;; requires: each Nat in the list must be <=10


;; (robot-ctl intial change) produces a robot's state according to an inputted command
;; Examples: 
(check-expect (robot-ctl (cons 5 (cons 5 (cons 'North empty))) 'turn-left)
              (cons 5 (cons 5 (cons 'West empty))))
;; robot-ctl: (Listof Any) -> (Listof Any)
(define (robot-ctl initial change)
  (cond [(symbol=? change 'turn-left)
         (cond
           [(symbol=? (first (rest (rest initial))) 'North)
            (cons (first initial) (cons (first (rest initial)) (cons 'West empty)))]
           [(symbol=? (first (rest (rest initial))) 'South)
            (cons (first initial) (cons (first (rest initial)) (cons 'East empty)))]
           [(symbol=? (first (rest (rest initial))) 'East)
            (cons (first initial) (cons (first (rest initial)) (cons 'North empty)))]
           [(symbol=? (first (rest (rest initial))) 'West)
            (cons (first initial) (cons (first (rest initial)) (cons 'South empty)))])]
        [(symbol=? change 'turn-right)
         (cond
           [(symbol=? (first (rest (rest initial))) 'North)
            (cons (first initial) (cons (first (rest initial)) (cons 'East empty)))]
           [(symbol=? (first (rest (rest initial))) 'South)
            (cons (first initial) (cons (first (rest initial)) (cons 'West empty)))]
           [(symbol=? (first (rest (rest initial))) 'East)
            (cons (first initial) (cons (first (rest initial)) (cons 'South empty)))]
           [(symbol=? (first (rest (rest initial))) 'West)
            (cons (first initial) (cons (first (rest initial)) (cons 'North empty)))])]
        [(symbol=? change 'forward)
         (cond
           [(and (symbol=? (first (rest (rest initial))) 'North)
                 (= (first (rest initial)) 10)) initial]
           [(and (symbol=? (first (rest (rest initial))) 'West)
                 (= (first initial) 0)) initial]
           [(and (symbol=? (first (rest (rest initial))) 'South)
                 (= (first (rest initial)) 0)) initial]
           [(and (symbol=? (first (rest (rest initial))) 'East)
                 (= (first initial) 10)) initial]
           [(symbol=? (first (rest (rest initial))) 'North)
            (cons (first initial) (cons (+ (first (rest initial)) 1) (cons 'North empty)))]
           [(symbol=? (first (rest (rest initial))) 'South)
            (cons (first initial) (cons (- (first (rest initial)) 1) (cons 'South empty)))]
           [(symbol=? (first (rest (rest initial))) 'East)
            (cons (- (first initial) 1) (cons (first (rest initial)) (cons 'East empty)))]
           [(symbol=? (first (rest (rest initial))) 'West)
            (cons (+ (first initial) 1) (cons (first (rest initial)) (cons 'West empty)))])]))
;; Tests
(check-expect (robot-ctl (cons 5 (cons 5 (cons 'North empty))) 'turn-left)
              (cons 5 (cons 5 (cons 'West empty))))
(check-expect (robot-ctl (cons 5 (cons 5 (cons 'North empty)))'turn-right)
              (cons 5 (cons 5 (cons 'East empty))))
(check-expect (robot-ctl (cons 5 (cons 5 (cons 'North empty))) 'forward)
              (cons 5 (cons 6 (cons 'North empty))))
(check-expect (robot-ctl (cons 5 (cons 5 (cons 'South empty))) 'forward)
              (cons 5 (cons 4 (cons 'South empty))))
         
        
            
         
        
        
        
        
                                                                                        
            


      

           
