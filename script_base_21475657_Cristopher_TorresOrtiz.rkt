#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")
(require "TDAgame_21475657_TorresOrtiz.rkt")


(define p1 (player 1 "Juan" "red" 0 0 0 10))
(define p2 (player 2 "Mauricio" "yellow" 0 0 0 10))


(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))


(define empty-board (board))


(define g0 (game p1 p2 empty-board 1))


(define g1 (game-player-set-move g0 p1 0))  
(define g2 (game-player-set-move g1 p2 1))  
(define g3 (game-player-set-move g2 p1 1))  
(define g4 (game-player-set-move g3 p2 2))  
(define g5 (game-player-set-move g4 p1 2))  
(define g6 (game-player-set-move g5 p2 3))  
(define g7 (game-player-set-move g6 p1 2))  
(define g8 (game-player-set-move g7 p2 3))  
(define g9 (game-player-set-move g8 p1 3))  
(define g10 (game-player-set-move g9 p2 0)) 
(define g11 (game-player-set-move g10 p1 3)) 


(display "¿Se puede jugar en el tablero vacío? ")
(board-can-play? empty-board)

(display "¿Se puede jugar después de 11 movimientos? ")
(board-can-play? (game-get-board g11))

(display "Jugador actual después de 11 movimientos: ")
(game-get-current-player g11)


(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board g11))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board g11))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board g11))

(display "Verificación de ganador: ")
(board-who-is-winner (game-get-board g11))


(display "¿Es empate? ")
(game-is-draw? g11)


(define ended-game (game-set-end g11))


(display "Historial de movimientos: ")
(game-history ended-game)


(displayln "Estado final del tablero: ")
(game-get-board ended-game)
