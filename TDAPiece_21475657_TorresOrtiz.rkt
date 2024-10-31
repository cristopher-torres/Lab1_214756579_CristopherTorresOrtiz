#lang racket

(provide (all-defined-out))


;Descripción: Función que permite crear una ficha
;Dom: color (string)
;Rec: piece
;Tipo recursión: No aplica
;Constructor

(define (piece color)
  (if (string? color) ;Verificamos que ingrese un string
      (if (or (equal? color "red") (equal? color "yellow")) ;por temas de implementacion se dejara solo ocupar red y yellow
          (list  color)
          (error "Debe ingresar red o yellow"))
      (error "Ingrese un string")))

;----------------------------------------------------------------------------------------------------------------
;Bloque de selectores

;Descripcion: Funcion que obtiene el color de la ficha
;Dominio: lista
;Recorrido: color
;Tipo recursión: No aplica

(define (get-color piece)
  (car piece))