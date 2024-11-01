#lang racket

(provide (all-defined-out))

;Descripción: Función que permite crear un jugador
;Dom: id (int) X name (string) X color (string) X wins (int) X losses (int) X draws (int) X remaining-pieces (int)
;Rec: player
;Tipo recursión: No aplica
;Constructor

(define (player id name color wins losses draws remaining-pieces)
  (if (and (integer? id) (integer? wins)(integer? losses)(integer? draws)(integer? remaining-pieces)(string? name)(string? color) ) ; Mediante un if verificamos que se ingresen bien los datos
      (if (and (< remaining-pieces 22) (> remaining-pieces 4)) ; verificar que el numero de fichas sea mayor que 4 y menor que 22
          (if (or(and (equal? color "red") (= id 1)) (and (equal? color "yellow") (= id 2))) ; por medidas de implementacion el jugador 1 siempre sera red y el 2 yellow
              (list id name color wins losses draws remaining-pieces)
              (error "El jugador 1 debe tener el color red y el 2 el color yellow"))
          (error "Se ingreso un numero de fichas fuera del rango"))(error "Se ingreso un caracter invalido"))) 
 



;----------------------------------------------------------------------------------------------------------------
;Bloque de otras funciones

(define(player-update-stats player result)
  (if(string? result)
     (if (equal? result "win")
         (list (get-id-player player) (get-name-player player) (get-color-player player) (+ (get-wins-player player) 1) (get-losses-player player) (get-draws-player player) (get-remaining-pieces-player player))
         (if (equal? result "loss")
             (list (get-id-player player) (get-name-player player) (get-color-player player) (get-wins-player player)  (+ (get-losses-player player) 1) (get-draws-player player) (get-remaining-pieces-player player))
             (if (equal? result "draw")
                 (list (get-id-player player) (get-name-player player) (get-color-player player) (get-wins-player player)  (get-losses-player player) (+(get-draws-player player) 1) (get-remaining-pieces-player player))
                 (error "Debe ingresar win o loss o draw "))))
     (error "debe ingresar un string")))

;----------------------------------------------------------------------------------------------------------------
;Bloque de selectores
;Descripcion: Funcion que obtiene la primera posicion de una lista
;Dominio: lista
;Recorrido: primer elemento
;Tipo recursión: No aplica

(define (my-car-player player)
  (car player))

;Descripcion: Funcion que obtiene la cola del elemento
;Dominio: lista
;Recorrido: lista
;Tipo recursión: No aplica

(define (my-cdr-player player)
  (cdr player))

;Descripcion: Obtiene el id del player
;Dominio: player
;Recorrido: id
;Selector
(define (get-id-player player)
  (my-car-player player))

;Descripcion: Obtiene el name del player
;Dominio: player
;Recorrido: name
;Selector
(define (get-name-player player)
  (my-car-player (my-cdr-player player)))

;Descripcion: Obtiene el color del player
;Dominio: player
;Recorrido: color
;Selector
(define (get-color-player player)
  (third player))


;Descripcion: Obtiene las wins del player
;Dominio: player
;Recorrido: wins
;Selector
(define (get-wins-player player)
  (fourth player))

;Descripcion: Obtiene las losses del player
;Dominio: player
;Recorrido: losses
;Selector
(define (get-losses-player player)
  (fifth player))

;Descripcion: Obtiene las draws del player
;Dominio: player
;Recorrido: draws
;Selector
(define (get-draws-player player)
  (sixth player))

;Descripcion: Obtiene las remaining-pieces del player
;Dominio: player
;Recorrido: remaining-pieces
;Selector
(define (get-remaining-pieces-player player)
  (seventh player))
