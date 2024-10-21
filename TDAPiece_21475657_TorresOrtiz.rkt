#lang racket

(provide (all-defined-out))


;Descripción: Función que permite crear una ficha
;Dom: color (string)
;Rec: piece
;Tipo recursión: No aplica
;Constructor

(define (piece color)
  (if (string? color) ;Verificamos que ingrese un string
      (list  color)
      (error "Ingrese un string")))

;----------------------------------------------------------------------------------------------------------------
;Bloque de selectores

;Descripcion: Funcion que obtiene el color de la ficha
;Dominio: lista
;Recorrido: color
;Tipo recursión: No aplica

(define (get-color piece)
  (car piece))