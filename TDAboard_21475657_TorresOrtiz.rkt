#lang racket

(require "TDAPiece_21475657_TorresOrtiz.rkt")
(provide (all-defined-out))



;----------------------------------------------------------------------------------------------------------------
;Bloque de constructor

;Descripcion: Función que crea un tablero de 7x6
;Dominio: No recibe parámetros de entrada
;Recorrido: board
;Tipo recursión: No aplica

(define (board) (list(list 0 0 0 0 0 0 0)
                     (list 0 0 0 0 0 0 0)
                     (list 0 0 0 0 0 0 0)
                     (list 0 0 0 0 0 0 0)
                     (list 0 0 0 0 0 0 0)
                     (list 0 0 0 0 0 0 0)))

;----------------------------------------------------------------------------------------------------------------
;Bloque de selectores

;Descripcion: Funcion que obtiene la primera lista de la board
;Dominio: lista de listas
;Recorrido: lista
;Tipo recursión: No aplica

(define (my-car-board board)
  (car board))

;Descripcion: Funcion que obtiene la cola de la board
;Dominio: lista de listas
;Recorrido: listas
;Tipo recursión: No aplica

(define (my-cdr-board board)
  (cdr board))


;Descripcion: Funcion que obtiene el primer elemento de la lista winners
;Dominio: list
;Recorrido: primer elemento
;Tipo recursión: No aplica

(define (my-car-winner winners)
  (car winners))

;Descripcion: Funcion que obtiene la cola de la lista winners
;Dominio: list
;Recorrido: list
;Tipo recursión: No aplica

(define (my-cdr-winner winners)
  (cdr winners))

;Descripcion: Obtiene un 0 el cual indica que no hay ganador
;Dominio: winners (list)
;Recorrido: 0
;Selector

(define (get-not-winner winners)
  (my-car-winner winners))

;Descripcion: Obtiene el numero 1
;Dominio: winners (list)
;Recorrido: 1
;Selector

(define (get-winner-1 winners)
  (my-car-winner (my-cdr-winner winners)))

;Descripcion: Obtiene el numero 2
;Dominio: winners(list)
;Recorrido: 2
;Selector
(define (get-winner-2 winners)
  (third winners))


;Descripcion: Funcion que obtiene la primera posicion de la columna
;Dominio: lista
;Recorrido: primer elemento
;Tipo recursión: No aplica

(define (get-firts-column column)
  (car column))

;Descripcion: Funcion que obtiene la cola de la columna
;Dominio: lista
;Recorrido: lista
;Tipo recursión: No aplica

(define(get-tail-column column)
  (cdr column))

;Descripcion: Funcion que obtiene el primer elemento de una fila
;Dominio: row
;Recorrido: primer elemento
;Tipo recursión: No aplica

(define (my-car-row row)
  (car row))

;Descripcion: Funcion que obtiene la cola de la fila
;Dominio: row
;Recorrido: la cola de la fila
;Tipo recursión: No aplica

(define (my-cdr-row row)
  (cdr row))

;Descripcion: Obtiene el segundo elemento de una lista
;Dominio: lista (list)
;Recorrido: segundo elemento
;Selector

(define (get-second-element list)
  (car(cdr list)))

;Descripcion: Obtiene el tercer elemento de una lista
;Dominio: lista (list)
;Recorrido: tercer elemento
;Selector

(define (get-three-element list)
  (third list))

;Descripcion: Obtiene el cuarto elemento de una lista
;Dominio: lista (list)
;Recorrido: cuarto elemento
;Selector

(define (get-four-element list)
  (fourth list))


;----------------------------------------------------------------------------------------------------------------
;Bloque de otras funciones

;Descripción: Función que permite verificar si se puede realizar más jugadas en el tablero.
;Dom: board (board)
;Rec: boolean (#t si se puede jugar, #f si no) 
;Tipo recursión: Cola

(define (board-can-play? board)
  (define(valid-position-in-the-rows? board) 
    (if (null? board) ;caso base, si el tablero llega a la posicion null significa que no hay una posicion valida para jugar y devuelve #f.
        #f
        (if (not(= (board-who-is-winner board) 0))
            #f
            (if(valid-position? (my-car-board board)) ;se verifica si en la primera fila hay una posicion valida es decir una posicion con un 0, si es el caso devuelve #t.
               #t
               (valid-position-in-the-rows? (my-cdr-board board)))))) ;se llama recursivamente a la funcion con el resto de las filas.
  (valid-position-in-the-rows? board))


;Descripcion: Funcion que verifica si hay un ganador vertical, es decir, que hayan 4 fichas seguidas de un mismo color en una columna.
;Dominio: board (board) 
;Recorrido: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador vertical)
;Tipo recursión: natural

(define winners (list 0 1 2))


(define (board-check-vertical-win board)
   (define (check-column num-column)
     (if (= num-column 7)
         (get-not-winner winners)
         (if (equal? (win-column? (get-column board num-column)) 1)
               (get-winner-1 winners)
               (if (equal? (win-column? (get-column board num-column)) 2)
                   (get-winner-2 winners)
                   (check-column (+ num-column 1))))))
  (check-column 0))

      

;Descripcion: Funcion que verifica si hay un ganador horizontal, es decir, que hayan 4 fichas seguidas de un mismo color en una fila.
;Dominio: board (board) 
;Recorrido: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador horizontal)
;Tipo recursión: natural


(define (board-check-horizontal-win board)
   (if (null? board)
       (get-not-winner winners)
       (if (equal? (win-row? (my-car-board board)) 1)
               (get-winner-1 winners)
               (if (equal? (win-row? (my-car-board  board)) 2)
                   (get-winner-2 winners)
                   (board-check-horizontal-win (my-cdr-board board))))))

;Descripcion: Funcion que verifica si hay un ganador diagonal, es decir, que hayan 4 fichas seguidas de un mismo color en una diagonal.
;Dominio: board (board) 
;Recorrido: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador diagonal)
;Tipo recursión: de cola

(define(board-check-diagonal-win board)
  (define (check-diagonal row index)
    (if(= row 6)
       (get-not-winner winners)
       (if (= index 7)
           (check-diagonal (+ row 1) 0)
           (if (or (= (get-victory-player (get-diagonal-asc board row index) 1) 1) (= (get-victory-player (get-diagonal-desc board row index ) 1) 1))
               (get-winner-1 winners)
               (if(or (= (get-victory-player (get-diagonal-asc board row index) 1) 2) (= (get-victory-player (get-diagonal-desc board row index) 1) 2) )
                  (get-winner-2 winners)
                  (check-diagonal row (+ index 1)))))))
  (check-diagonal 0 0))

;Descripcion: Funcion que verifica si hay un ganador, el cual puede ser vertical, horizontal o diagonal
;Dominio: board (board) 
;Recorrido: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador)
;Tipo recursión: no aplica
;declarativa

(define(board-who-is-winner board)
  (if(or (= (board-check-diagonal-win board) 1) (= (board-check-vertical-win board) 1) (= (board-check-horizontal-win board) 1) )
     (get-winner-1 winners)
     (if (or (= (board-check-diagonal-win board) 2) (= (board-check-vertical-win board) 2) (= (board-check-horizontal-win board) 2)  )
         (get-winner-2 winners)
         (get-not-winner winners))))




;----------------------------------------------------------------------------------------------------------------
;Bloque de modificadores

;Descripcion: Funcion que permite jugar una ficha en el tablero
;Dominio: board (board) X column (int) X piece (piece)
;Recorrido: board
;Tipo recursión: no aplica

(define(board-set-play-piece board column piece)
  (if (integer? column)
      (if (and (<= column 6) (>= column 0))
          (if (equal? (get-color piece) "red")
              (if (null? (get-column board column))
                  (error "La columna esta llena")
                  (if (valid-position? (reverse(get-column board column)))
                      (new-board-R board column)
                      (error "La columna esta llena")))
              (if(equal? (get-color piece) "yellow")
                 (if (null? (get-column board column))
                     (error "La columna esta llena")
                     (if (valid-position? (reverse(get-column board column)))
                         (new-board-Y board column)
                         (error "La columna esta llena")))
                 (error "Solo puede usar los colores yellow o red")))
      (error "Se ingreso un numero fuera del rango"))
  (error "Debe ingresar un caracter numerico")))



;----------------------------------------------------------------------------------------------------------------
;Bloque de funciones auxiliares

;Descripción: recorre una lista (fila en el contexto del proyecto) y verifica si hay 0 dentro de esa lista.
;Dom: board (board)
;Rec: boolean (#t si hay 0, #f si no)
;Tipo recursión: Cola

(define(valid-position? row)
    (if(null? row)  ;caso base, si el tablero llega a la posicion null significa que no hay una posicion valida para jugar.
       #f
       (if(equal? (my-car-board row)0) ;si el primer elemento de la fila tiene un 0 devuelve un #t.
          #t
          (valid-position? (my-cdr-board row))))) ;se llama recursivamente a la funcion para que verifique el resto de la fila.


;Descripción: Pone una ficha en una fila en la posicion de la columna que se indique,es decir, si la columna es 3 y la fila una list (0 0 0 0 0) el resultado sera (0 0 0 ficha 0).
            ; Donde row es una fila, pos es la columna donde se quiere poner la ficha, index es un acumulador para saber donde se pone la ficha, y piece es la ficha que se pondra.
;Dom: row (list), pos (int), index (int), piece(simbolo)
;Rec: board (board)
;Tipo recursión: de cola


(define (put-piece row pos index piece)
  (cond
    ((null? row) '())
    ((= index pos) (cons piece (my-cdr-row row)))
    (else (cons (my-car-row row) (put-piece (my-cdr-row row) pos (+ index 1) piece)))))

;Descripción: Crea un nuevo tablero con una R en la columna que diga el usuario
;Dom: board (board), column (lista)
;Rec: board (board)
;Tipo recursión: de cola


(define (new-board-R board column)
  (if(null? board)
     '()
     (if(null? (my-cdr-board board))
        (cons (put-piece (my-car-board board) column 0 'R) (my-cdr-board board))
      (if (and (not(equal? 'R (list-ref (my-car-board (my-cdr-board board)) column))) (not(equal? 'Y (list-ref (my-car-board (my-cdr-board board)) column))) (equal? 0 (list-ref (my-car-board (my-cdr-board board)) column)))
        (cons (my-car-board board) (new-board-R (my-cdr-board board) column))
        (cons (put-piece (my-car-board board) column 0 'R) (my-cdr-board board))))))

;Descripción: Crea un nuevo tablero con una Y en la columna que diga el usuario
;Dom: board (board), column (lista)
;Rec: board (board)
;Tipo recursión: de cola


(define (new-board-Y board column)
  (if(null? board)
     '()
     (if(null? (my-cdr-board board))
        (cons (put-piece (my-car-board board) column 0 'Y) (my-cdr-board board))
        (if(and (not(equal? (list-ref (my-car-board(my-cdr-board board)) column) 'Y)) (not(equal? (list-ref (my-car-board(my-cdr-board board)) column) 'R)) (equal? 0 (list-ref (my-car-board (my-cdr-board board)) column)))
           (cons(my-car-board board) (new-board-Y (my-cdr-board board) column))
           (cons (put-piece (my-car-board board) column 0 'Y) (my-cdr-board board))))))


;Descripción: Obtiene una columna de la board
;Dom: board (board)
;Rec: list (column)
;Tipo recursión: natural

(define(get-column board column)
  (if (>= column 7)
      '()
   (if (null? board)
       '()
       (cons (list-ref (my-car-board board) column)
            (get-column (my-cdr-board board) column)))))

;Descripción: funcion auxiliar que se usara en verificar la victoria vertical, la cual revisa si hay cuatro fichas seguidas iguales en una columna
;Dom: column(list)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador vertical)
;Tipo recursión: de cola

(define (win-column? column)
  (if (< (length column) 4)
      (get-not-winner winners)
      (if (and (equal? (get-firts-column column) (get-second-element column)) (equal? (get-second-element column) (get-three-element column)) (equal? (get-three-element column) (get-four-element column)))
          (if (equal? (get-firts-column column) 'R)
              (get-winner-1 winners) 
              (if (equal? (get-firts-column column) 'Y)
                  (get-winner-2 winners)
                  (get-not-winner winners)))
          (win-column? (get-tail-column column)))))
                   

;Descripción: funcion auxiliar que se usara en verificar la victoria horizontal, la cual revisa si hay cuatro fichas seguidas iguales en una fila
;Dom: row (list)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador horizontal)
;Tipo recursión: de cola

(define (win-row? row)
  (if (< (length row) 4)  
      (get-not-winner winners)     
      (if (and (equal? (my-car-row row) (get-second-element row)) (equal? (get-second-element row) (get-three-element row)) (equal? (get-three-element row) (get-four-element row)))  
          (if (equal? (my-car-row row) 'R)     
              (get-winner-1 winners)     
              (if (equal? (my-car-row row) 'Y)  
                  (get-winner-2 winners)
                  (get-not-winner winners)))
          (win-row? (my-cdr-row row)))))

;Descripción: Obtiene la columna descendente de un elemento
;Dom: board (board), row (int), column (int)
;Rec: diagonal (list)
;Tipo recursión: natural


(define (get-diagonal-desc board row column)
  (if (or (>= row 6) (>= column 7)) 
      '()
      (cons (list-ref (list-ref board row) column)
            (get-diagonal-desc board (+ row 1) (+ column 1)))))

;Descripción: Obtiene la columna ascendente de un elemento
;Dom: board (board), row (int), column (int)
;Rec: diagonal (list)
;Tipo recursión: natural


(define (get-diagonal-asc board row column)
  (if (or (< row 0) (>= column 7)) 
      '()
      (cons (list-ref(list-ref board row) column)
            (get-diagonal-asc board (- row 1) (+ column 1)))))

;Descripción: funcion auxiliar que se usara en verificar la victoria diagonal, la cual revisa si hay cuatro fichas seguidas iguales en una diagonal
;Dom: diagonal (list), acc (int)
;Rec: int (1 si gana jugador 1, 2 si gana jugador 2, 0 si no hay ganador diagonal)
;Tipo recursión: de cola

(define (get-victory-player diagonal acc)
  (if (null? (my-cdr-row diagonal))
      (get-not-winner winners) 
      (if (= acc 4)
          (if (equal? (my-car-row diagonal) 'R)
              (get-winner-1 winners) 
              (if (equal? (my-car-row diagonal) 'Y)
                  (get-winner-2 winners)
                  (get-not-winner winners)))
          (if (not(equal? (my-car-row diagonal) (my-car-row (my-cdr-row diagonal))))
              (get-victory-player (my-cdr-row diagonal)  1) 
              (get-victory-player (my-cdr-row diagonal)  (+ acc 1))))))
     







