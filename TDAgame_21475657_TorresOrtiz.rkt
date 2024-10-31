#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")
(provide game game-is-draw? game-get-current-player game-get-board game-set-end game-player-set-move)

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

(define (my-car-game game)
  (car game))

;Descripcion: Funcion que obtiene la cola de la lista game
;Dominio: list
;Recorrido: list
;Tipo recursión: No aplica

(define (my-cdr-game game)
  (cdr game))

;Descripcion: Función que optiene el player 1 de la lista game
;Dominio: game (game)
;Recorrido: player 1 (list)
;Tipo recursión: No aplica

(define(get-player1 game)
  (my-car-game game))

;Descripcion: Función que optiene el player 2 de la lista game
;Dominio: game (game)
;Recorrido: player 2 (list)
;Tipo recursión: No aplica

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
  (if (equal? (can-play? (game-get-board game)) #f)
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
         (list(player-update-stats (get-player1 game) "loss") (player-update-stats (get-player2 game) "win")(game-get-board game) (get-current-turn-game game))
         (list(player-update-stats (get-player1 game) "draw") (player-update-stats (get-player2 game) "draw")(game-get-board game) (get-current-turn-game game)))))



;Descripcion: Función que realiza un movimiento.
;Dominio: game (game) X player (player) X column (int)
;Recorrido: game
;Tipo recursión: no aplica
;declarativa


(define (game-player-set-move game player column)
  (if (or (= (board-who-is-winner (game-get-board game)) 1) (= (board-who-is-winner (game-get-board game)) 2) )
          (error "Ya hay un ganador, el juego ha finalizado")
          (if (or (< column 0) (> column 6))
              (error "Ponga una columna del 0 al 6")
              (if(< (get-remaining-pieces-player(get-player1 game)) 0)
                 (error "El jugador 1 no tiene mas fichas")
                 (if(< (get-remaining-pieces-player(get-player2 game)) 0)
                    (error "El jugador 2 no tiene mas fichas")
                    (if(equal? (game-is-draw? (updated-game game player column)) #t)
                       (game-set-end (updated-game game player column))
                       (if(equal? (get-id-player player) (get-id-player(game-get-current-player game)))
                          (if (= (get-id-player player) 1)
                              (if (=(board-who-is-winner (board-set-play-piece (game-get-board game) column (piece "red"))) 0)
                                  (updated-game game player column)
                                  (game-set-end (updated-game game player column)))
                              (if (=(board-who-is-winner (board-set-play-piece (game-get-board game) column (piece "yellow"))) 0)
                                  (updated-game game player column)
                                  (game-set-end (updated-game game player column))))
                          (error "No es tu turno"))))))))
         


;----------------------------------------------------------------------------------------------------------------
;Bloque de funciones auxiliares

;Descripcion: Función que permite quitar una ficha a un jugador
;Dominio: player (list)
;Recorrido: player(list)
;Tipo recursión: no aplica

(define (remove-piece player)
  (list (get-id-player player) (get-name-player player) (get-color-player player) (get-wins-player player)  (get-losses-player player) (get-draws-player player) (-(get-remaining-pieces-player player) 1)))

;Descripcion: Función que permite actualizar las fichas del jugador, actualizar la board del game y sumar uno al current-turn
;Dominio: player (list) game (game) column (int)
;Recorrido: game (game)
;Tipo recursión: no aplica

(define (updated-game game player column)
  (if(= (get-id-player player) 1)
     (list  (remove-piece (get-player1 game)) (get-player2 game) (board-set-play-piece (game-get-board game) column (piece "red")) (+ (get-current-turn-game game) 1 ))
     (list (get-player1 game) (remove-piece (get-player2 game)) (board-set-play-piece (game-get-board game) column (piece "yellow")) (+ (get-current-turn-game game) 1 ))))

;Descripción: Función que permite verificar si se puede realizar más jugadas en el tablero.
;esta funcion es igual al board-can-play? sin verificar si hay un ganador, ya que me generaba un mal resultado en game-is-draw?.
;Dom: board (board)
;Rec: boolean (#t si se puede jugar, #f si no) 
;Tipo recursión: Cola

(define (can-play? board)
  (define(valid-position-in-the-rows? board) 
    (if (null? board) 
        #f
        (if(valid-position? (my-car-board board)) 
           #t
           (valid-position-in-the-rows? (my-cdr-board board))))) 
  (valid-position-in-the-rows? board))
  