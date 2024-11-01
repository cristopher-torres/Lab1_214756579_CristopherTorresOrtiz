#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")
(require "TDAgame_21475657_TorresOrtiz.rkt")

; 1. Creación de jugadores (7 fichas cada uno)
(define p1 (player 1 "matias" "red" 0 0 0 7))
(define p2 (player 2 "carlos" "yellow" 0 0 0 7))

; 2. Creación de piezas
(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))

; 3. Creación del tablero inicial
(define board0 (board))

; 4. Creación de un nuevo juego
(define g0 (game p1 p2 board0 1))

; 5. Realizando movimientos para terminar en empate
(define g1 (game-player-set-move g0 p1 1))  
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
  

; 6. Verificaciones durante el juego
(display "¿Se puede jugar despues de 7 movimientos? ")
(board-can-play? (game-get-board g7))

(display "Jugador actual después de 5 movimientos: ")
(game-get-current-player g5)

; 7. Verificación de victoria
(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board g14))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board g14))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board g14))

(display "Verificación de ganador: ")
(board-who-is-winner (game-get-board g14))

; 8. Verificación de empate
(display "¿Es empate? ")
(game-is-draw? g14)

; 9. Finalizar el juego y actualizar estadísticas
(define ended-game (game-set-end g14)) ;dara 2 empates para cada jugador, ya que al finalizar la partida en game-player-set-move tambien se actualizan las estadisticas

; 11. Mostrar historial de movimientos
(display "Historial de movimientos: ")
(game-history ended-game)

; 12. Mostrar estado final del tablero
(displayln "Estado final del tablero: ")
(game-get-board ended-game)

; 13. Actualizar estadísticas de los jugadores
(define updated-p1 (player-update-stats p1 "draw"))
(define updated-p2 (player-update-stats p2 "draw"))
  