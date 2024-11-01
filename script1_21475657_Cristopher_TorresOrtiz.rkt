#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")
(require "TDAgame_21475657_TorresOrtiz.rkt")



(define p1 (player 1 "vegetta" "morado" 0 0 0 21))
(define p2 (player 2 "goku" "naranjo" 0 0 0 21))


(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))



(define b0 (board))

(define empty-board (board))

(define board1 (board))



(define b1 (board-set-play-piece empty-board 1 red-piece))

(define b2 (board-set-play-piece b1 4 yellow-piece))

(define b3 (board-set-play-piece b2 1 yellow-piece))




(define g0 (game p1 p2 b0 1))

(define new-game (game p1 p2 empty-board 1))

(define game1 (game p1 p2 board1 1))



(define g1 (game-player-set-move g0 p1 0))  
(define g2 (game-player-set-move g1 p2 1))  
(define g3 (game-player-set-move g2 p1 2))  
(define g4 (game-player-set-move g3 p2 6))  
(define g5 (game-player-set-move g4 p1 5))  
(define g6 (game-player-set-move g5 p2 5))  
(define g7 (game-player-set-move g6 p1 6))  
(define g8 (game-player-set-move g7 p2 3))  
(define g9 (game-player-set-move g8 p1 4))  
(define g10 (game-player-set-move g9 p2 4))  
(define g11 (game-player-set-move g10 p1 0))  
(define g12 (game-player-set-move g11 p2 5))  
(define g13 (game-player-set-move g12 p1 3))  
(define g14 (game-player-set-move g13 p2 1))  
(define g15 (game-player-set-move g14 p1 2))  
(define g16 (game-player-set-move g15 p2 3))  
(define g17 (game-player-set-move g16 p1 4))  
(define g18 (game-player-set-move g17 p2 5))  
(define g19 (game-player-set-move g18 p1 3))  
(define g20 (game-player-set-move g19 p2 5))


(display "¿Se puede jugar despues de 5 movimientos? ")
(board-can-play? (game-get-board g5))

(display "¿Se puede jugar después de 20 movimientos? ")
(board-can-play? (game-get-board g20))

(display "¿Se puede jugar despues de 10 movimientos? ")
(board-can-play? (game-get-board g10))



(display "Jugador actual después de 7 movimientos: ")
(game-get-current-player g7)

(display "Jugador actual después de 10 movimientos: ")
(game-get-current-player g10)

(display "Jugador actual después de 19 movimientos: ")
(game-get-current-player g19)



(display "Verificación de victoria vertical despues de 11 movimientos: ")
(board-check-vertical-win (game-get-board g11))

(display "Verificación de victoria vertical despues de 5 movimientos: ")
(board-check-vertical-win (game-get-board g5))

(display "Verificación de victoria vertical despues de 20 movimientos: ")
(board-check-vertical-win (game-get-board g20))



(display "Verificación de victoria horizontal despues de 15 movimientos: ")
(board-check-horizontal-win (game-get-board g15))

(display "Verificación de victoria horizontal despues de 10 movimientos: ")
(board-check-horizontal-win (game-get-board g10))

(display "Verificación de victoria horizontal despues de 20 movimientos: ")
(board-check-horizontal-win (game-get-board g20))



(display "Verificación de victoria diagonal depues de 16 movimientos: ")
(board-check-diagonal-win (game-get-board g16))

(display "Verificación de victoria diagonal depues de 7 movimientos: ")
(board-check-diagonal-win (game-get-board g7))

(display "Verificación de victoria diagonal depues de 20 movimientos: ")
(board-check-diagonal-win (game-get-board g20))


(display "Verificación de ganador despues de 9 movimientos: ")
(board-who-is-winner (game-get-board g9))

(display "Verificación de ganador despues de 12 movimientos: ")
(board-who-is-winner (game-get-board g12))

(display "Verificación de ganador despues de 20 movimientos: ")
(board-who-is-winner (game-get-board g20))



(display "¿Es empate? despues de 10 movimientos: ")
(game-is-draw? g10)

(display "¿Es empate? despues de 15 movimientos: ")
(game-is-draw? g15)

(display "¿Es empate? despues de 20 movimientos: ")
(game-is-draw? g20)



(define ended1? (game-set-end g11)) 

(define ended2? (game-set-end g15)) 

(define ended-game (game-set-end g20)) 



(display "Historial de movimientos despues de 5 movimientos: ")
(game-history g5)

(display "Historial de movimientos despues de 8 movimientos: ")
(game-history g8)

(display "Historial de movimientos de la partida finalizada: ")
(game-history ended-game)



(displayln "Estado del tablero despues de 3 movimientos: ")
(game-get-board g3)

(displayln "Estado del tablero despues de 10 movimientos: ")
(game-get-board g10)

(displayln "Estado final del tablero: ")
(game-get-board ended-game)


(define updated-p1 (player-update-stats p1 "loss"))
(define updated-p2 (player-update-stats p2 "win"))
  