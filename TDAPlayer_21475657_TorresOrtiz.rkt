#lang racket

;Descripción: Función que permite crear un jugador
;Dom: id (int) X name (string) X color (string) X wins (int) X losses (int) X draws (int) X remaining-pieces (int)
;Rec: player
;Tipo recursión: No aplica
;Constructor

(define (player id name color wins losses draws remaining-pieces)
  (if (and (integer? id) (integer? wins)(integer? losses)(integer? draws)(integer? remaining-pieces)(string? name)(string? color) ) ; Mediante un if verificamos que se ingresen bien los datos
      (if (and (< remaining-pieces 22) (> remaining-pieces 4)) ; verificar que el numero de fichas sea mayor que 4 y menor que 22
          (list id name color wins losses draws remaining-pieces)
          (error "Se ingreso un numero de fichas fuera del rango"))(error "Se ingreso un caracter invalido"))) 
 


