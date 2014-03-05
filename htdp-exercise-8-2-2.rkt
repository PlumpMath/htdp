;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
<왜 다음 정의들은 문법적으로 올바른가?>

1. (define (f x) x)
(define (<var> <var>) <exp>)
<exp> x -> <var>
이므로 유효한 표현식

2. (define (f x) y)
(define (<var> <var>) <exp>)
<exp> y -> <var>
이므로 유효한 표현식.

3. (define (f x y) 3)
(define (<var> <var> <var>) <exp>)
<exp> 3 -> <con>
이므로 유효한 표현식.


<왜 다음 정의들은 문법적으로 올바르지 않은가?>

1. (define (f 'x) x)
(define (<var> <con>) <exp>)
이므로 매개변수 선언부에 <var>가 아닌 <con>이 들어가므로 잘못되었다.

2. (define (f x y z) (x))
(define (<var> <var> <var> <var>) <exp>)
<exp> (x) -> (<var>)
<exp> (x)가 유효하지 않은 표현식이므로 잘못되었다.

3. (define (f) 10)
(define (<var>) <con>)
이므로 <def> 정의에 해당하지 않는다.
