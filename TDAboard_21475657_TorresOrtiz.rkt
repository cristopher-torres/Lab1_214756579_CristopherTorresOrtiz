#lang racket

(require "TDAPiece_21475657_TorresOrtiz.rkt")



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
;Dominio: board
;Recorrido: primera lista
;Tipo recursión: No aplica

(define (my-car-board board)
  (car board))

;Descripcion: Funcion que obtiene la cola de la board
;Dominio: board
;Recorrido: la cola de la board
;Tipo recursión: No aplica

(define (my-cdr-board board)
  (cdr board))



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
        (if(valid-position? (my-car-board board)) ;se verifica si en la primera fila hay una posicion valida es decir una posicion con un 0, si es el caso devuelve #t.
           #t
           (valid-position-in-the-rows? (my-cdr-board board))))) ;se llama recursivamente a la funcion con el resto de las filas.
  (valid-position-in-the-rows? board))



;----------------------------------------------------------------------------------------------------------------
;Bloque de modificadores

;Descripcion: Funcion que permite jugar una ficha en el tablero
;Dominio: board (board) X column (int) X piece (piece)
;Recorrido: board
;Tipo recursión:

(define(board-set-play-piece board column piece)
  (if (integer? column)
      (if (and (< column 7) (>= column 0))
          (if (equal? (get-color piece) "red")
              (if (null? (get-column board column))
                  (error "La columna esta llena")
                  (if (valid-position? (reverse(get-column board column)))
                      #t
                      (error "La columna esta llena")))
              (if(equal? (get-color piece) "yellow")
                 (if (null? (get-column board column))
                     (error "La columna esta llena")
                     (if (valid-position? (reverse(get-column board column)))
                         #t
                         (error "La columna esta llena")))
                 (error "Solo puede usar los colores yellow o red")))
      (error "Se ingreso un numero fuera del rango"))
  (error "Debe ingresar un caracter numerico")))



;----------------------------------------------------------------------------------------------------------------
;Bloque de funciones creadas por mi

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
