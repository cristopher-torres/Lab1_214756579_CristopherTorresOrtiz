#lang racket


;Descripción: Función que permite crear una ficha
;Dom: color (string)
;Rec: piece
;Tipo recursión: No aplica
;Constructor

(define (piece color)
  (if (string? color) ;Verificamos que ingrese un string
      (list  color)
      (error "Ingrese un string")))