;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp-exercise-9-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
재고 목록: (cons 'clown (cons 'doll (cons 'arrow (cons 'ball empty))))

기호 리스트란,
1. empty
2. (cons s los) : s는 심볼, los는 기호 리스트

재고 목록에서,
empty
-> empty는 기호 리스트 (1)

(cons 'ball empty)
-> 'ball이 심볼이고, empty가 기호 리스트이므로, 기호 리스트 (2)

(cons 'arrow (cons 'ball empty))
-> 'arrow가 심볼이고, (cons 'ball empty)가 기호 리스트이므로, 기호 리스트 (2)

(cons 'doll (cons 'arrow (cons 'ball empty)))
-> 'doll가 심볼이고, (cons 'arrow (cons 'ball empty))가 기호 리스트이므로, 기호 리스트 (2)

(cons 'clown (cons 'doll (cons 'arrow (cons 'ball empty))))
-> 'clown이 심볼이고, (cons 'doll (cons 'arrow (cons 'ball empty)))가 기호 리스트이므로, 기호 리스트 (2)


