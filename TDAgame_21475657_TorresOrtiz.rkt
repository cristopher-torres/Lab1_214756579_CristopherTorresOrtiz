#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")


;----------------------------------------------------------------------------------------------------------------
;Bloque de constructor

;Descripcion: Función que crea un game
;Dominio: player1 (player) X player2 (player) X board (board) X current-turn (int)
;Recorrido: game
;Tipo recursión: No aplica


(define (game player1 player2 board current-turn)
  (if (>= current-turn 1)
      (list player1 player2 board current-turn)
      (error "El current-turn debe ser mayor que 0")))


