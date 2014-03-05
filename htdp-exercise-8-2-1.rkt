;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
<왜 다음 표현들은 문법적으로 올바른가?>

1. x
<var> 이므로 유효한 표현식

2. (= y z)
(= y z) -> (<var> <exp> <exp>)
y -> <var>
z -> <var>
이므로 유효한 표현식.

3. (= (= y z) 0)
(= (= y z) 0) -> (<var> <exp> <exp>) 
(= y z) -> (<var> <exp> <exp>)
y -> <var>
z -> <var>
0 -> <con>
이므로 유효한 표현식.


<왜 다음 표현들은 문법적으로 올바르지 않은가?>

1. (3 + 4)
(3 + 4) -> (<con> <exp> <exp>)
이므로 <def>에도, <exp>에도 해당되지 않는다.

2. empty? (l)
empty? (l) -> <var> <exp>
이므로 <def>에도, <exp>에도 해당되지 않는다.

3. (x)
(x) -> (<var>)
이므로 <def>에도, <exp>에도 해당되지 않는다.
