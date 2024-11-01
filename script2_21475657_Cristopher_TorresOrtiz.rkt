#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")
(require "TDAgame_21475657_TorresOrtiz.rkt")


(define p1 (player 1 "matias" "rosado" 0 0 0 7))
(define p2 (player 2 "carlos" "negro" 0 0 0 7))



(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))



(define new-board (board))

(define empty-board (board))

(define board-null (board))



(define b1 (board-set-play-piece new-board 4 red-piece))

(define b2 (board-set-play-piece b1 5 yellow-piece))

(define b3 (board-set-play-piece b2 3 yellow-piece))



(define new-game (game p1 p2 new-board 1))

(define game1 (game p1 p2 board-null 1))

(define game2 (game p1 p2 empty-board 1))


(define g1 (game-player-set-move new-game p1 1))  
(define g2 (game-player-set-move g1 p2 6))  
(define g3 (game-player-set-move g2 p1 1))  
(define g4 (game-player-set-move g3 p2 6))  
(define g5 (game-player-set-move g4 p1 6))  
(define g6 (game-player-set-move g5 p2 1))  
(define g7 (game-player-set-move g6 p1 4))  
(define g8 (game-player-set-move g7 p2 3))  
(define g9 (game-player-set-move g8 p1 2))  
(define g10 (game-player-set-move g9 p2 0))  
(define g11 (game-player-set-move g10 p1 0))  
(define g12 (game-player-set-move g11 p2 3))  
(define g13 (game-player-set-move g12 p1 4))  
(define g14 (game-player-set-move g13 p2 0))  
  


(display "¿Se puede jugar despues de 3 movimientos? ")
(board-can-play? (game-get-board g3))

(display "¿Se puede jugar después de 9 movimientos? ")
(board-can-play? (game-get-board g9))

(display "¿Se puede jugar despues de 14 movimientos? ")
(board-can-play? (game-get-board g14))



(display "Jugador actual después de 2 movimientos: ")
(game-get-current-player g2)

(display "Jugador actual después de 5 movimientos: ")
(game-get-current-player g5)

(display "Jugador actual después de 12 movimientos: ")
(game-get-current-player g12)


(display "Verificación de victoria vertical despues de 6 movimientos: ")
(board-check-vertical-win (game-get-board g6))

(display "Verificación de victoria vertical despues de 9 movimientos: ")
(board-check-vertical-win (game-get-board g9))

(display "Verificación de victoria vertical despues de 14 movimientos: ")
(board-check-vertical-win (game-get-board g14))



(display "Verificación de victoria horizontal despues de 6 movimientos: ")
(board-check-horizontal-win (game-get-board g6))

(display "Verificación de victoria horizontal despues de 9 movimientos: ")
(board-check-horizontal-win (game-get-board g9))

(display "Verificación de victoria horizontal despues de 14 movimientos: ")
(board-check-horizontal-win (game-get-board g14))



(display "Verificación de victoria diagonal depues de 6 movimientos: ")
(board-check-diagonal-win (game-get-board g6))

(display "Verificación de victoria diagonal depues de 9 movimientos: ")
(board-check-diagonal-win (game-get-board g9))

(display "Verificación de victoria diagonal depues de 14 movimientos: ")
(board-check-diagonal-win (game-get-board g14))



(display "Verificación de ganador despues de 6 movimientos: ")
(board-who-is-winner (game-get-board g6))

(display "Verificación de ganador despues de 9 movimientos: ")
(board-who-is-winner (game-get-board g9))

(display "Verificación de ganador despues de 14 movimientos: ")
(board-who-is-winner (game-get-board g14))



(display "¿Es empate? despues de 10 movimientos: ")
(game-is-draw? g10)

(display "¿Es empate? despues de 12 movimientos: ")
(game-is-draw? g12)

(display "¿Es empate? despues de 14 movimientos: ")
(game-is-draw? g14)



(define ended1? (game-set-end g9)) 

(define ended2? (game-set-end g12)) 

(define ended-game (game-set-end g14)) 



(display "Historial de movimientos despues de 3 movimientos: ")
(game-history g3)

(display "Historial de movimientos despues de 5 movimientos: ")
(game-history g5)

(display "Historial de movimientos de la partida finalizada: ")
(game-history ended-game)



(displayln "Estado del tablero despues de 5 movimientos: ")
(game-get-board g5)

(displayln "Estado del tablero despues de 12 movimientos: ")
(game-get-board g12)

(displayln "Estado final del tablero: ")
(game-get-board ended-game)


(define updated-p1 (player-update-stats p1 "draw"))
(define updated-p2 (player-update-stats p2 "draw"))