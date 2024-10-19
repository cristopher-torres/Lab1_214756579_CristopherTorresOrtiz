#lang racket


;Descripción: Función que permite crear una ficha
;Dom: color (string)
;Rec: piece
;Tipo recursión: No aplica
;Constructor

(define (piece color)
  (if (string? color) ;Verificamos que ingrese un string
      (if(or (equal? color "red") (equal? color "yellow"))
         (list  color)
         (error "Solo puede ingresar como color red o yellow"))
      (error "Ingrese un string")))
