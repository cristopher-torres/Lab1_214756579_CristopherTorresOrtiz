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


;----------------------------------------------------------------------------------------------------------------
;Bloque de selectores

;Descripcion: Funcion que obtiene el primer elemento de la lista game
;Dominio: list
;Recorrido: primer elemento
;Tipo recursión: No aplica
;Selector

(define (my-car-game game)
  (car game))

;Descripcion: Funcion que obtiene la cola de la lista game
;Dominio: list
;Recorrido: list
;Tipo recursión: No aplica
;Selector

(define (my-cdr-game game)
  (cdr game))

;Descripcion: Función que optiene el player 1 de la lista game
;Dominio: game (game)
;Recorrido: player 1 (list)
;Tipo recursión: No aplica
;Selector

(define(get-player1 game)
  (my-car-game game))

;Descripcion: Función que optiene el player 2 de la lista game
;Dominio: game (game)
;Recorrido: player 2 (list)
;Tipo recursión: No aplica
;Selector

(define(get-player2 game)
  (my-car-game(my-cdr-game game)))

;Descripcion: Obtiene la board del game
;Dominio: game (game)
;Recorrido: board (list)
;Tipo recursión: No aplica
;Selector

(define (game-get-board game)
  (my-car-game(my-cdr-game(my-cdr-game game))))

;Descripcion: Obtiene la el current turn del game
;Dominio: game (game)
;Recorrido: current-turn (int)
;Tipo recursión: No aplica
;Selector

(define (get-current-turn-game game)
  (fourth game))

;Descripcion: Función que obtiene el jugador cuyo turno está en curso.
;Dominio: game (game)
;Recorrido: player
;Tipo recursión: no aplica

(define(game-get-current-player game)
  (if (= (modulo (get-current-turn-game game) 2) 1) ;se asume que el current turn siempre empezara en 1
      (get-player1 game) ; se asume que siempre parte el jugador 1
      (get-player2 game)))


;----------------------------------------------------------------------------------------------------------------
;Bloque de otras funciones

;Descripcion: Función que verifica si el estado actual del juego es empate.
;Dominio: game (game)
;Recorrido: game
;Tipo recursión: no aplica



(define(game-is-draw? game)
  (if (equal? (board-can-play? (game-get-board game)) #f)
      #t
      (if (and (= (get-remaining-pieces-player(get-player1 game)) 0) (= (get-remaining-pieces-player(get-player2 game)) 0) (= (board-who-is-winner(game-get-board game)) 0))
          #t
          #f)))

;----------------------------------------------------------------------------------------------------------------
;Bloque de modificadores


;Descripcion: Función finaliza el juego actualizando las estadísticas de los jugadores según el resultado.
;Dominio: game (game)
;Recorrido: game
;Tipo recursión: no aplica

(define(game-set-end game)
  (if (= (board-who-is-winner (game-get-board game)) 1)
      (list(player-update-stats (get-player1 game) "win") (player-update-stats (get-player2 game) "loss")(game-get-board game) (get-current-turn-game game))
      (if(= (board-who-is-winner (game-get-board game)) 2)
         (list(player-update-stats (get-player2 game) "win") (player-update-stats (get-player1 game) "loss")(game-get-board game) (get-current-turn-game game))
         (list(player-update-stats (get-player1 game) "draw") (player-update-stats (get-player2 game) "draw")(game-get-board game) (get-current-turn-game game)))))
