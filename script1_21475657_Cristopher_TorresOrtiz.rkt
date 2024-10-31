#lang racket

(require "TDAPlayer_21475657_TorresOrtiz.rkt")
(require "TDAboard_21475657_TorresOrtiz.rkt")
(require "TDAPiece_21475657_TorresOrtiz.rkt")
(require "TDAgame_21475657_TorresOrtiz.rkt")


; 1. Creación de jugadores (21 fichas cada uno)
(define p1 (player 1 "vegetta" "red" 0 0 0 21))
(define p2 (player 2 "goku" "yellow" 0 0 0 21))

; 2. Creación de piezas
(define red-piece (piece "red"))
(define yellow-piece (piece "yellow"))

; 3. Creación del tablero inicial
(define b0 (board))

; 4. Creación de un nuevo juego
(define g0 (game p1 p2 b0 1))

; 5. Realizando movimientos para victoria vertical
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
(define g20 (game-player-set-move g19 p2 5)) ;victoria vertical jugador 2

; 6. Verificaciones durante el juego
(display "¿Se puede jugar despues de 5 movimientos? ")
(board-can-play? (game-get-board g5))

(display "¿Se puede jugar después de 20 movimientos? ")
(board-can-play? (game-get-board g20))

(display "Jugador actual después de 19 movimientos: ")
(game-get-current-player g19)

; 7. Verificación de victoria
(display "Verificación de victoria vertical: ")
(board-check-vertical-win (game-get-board g20))

(display "Verificación de victoria horizontal: ")
(board-check-horizontal-win (game-get-board g20))

(display "Verificación de victoria diagonal: ")
(board-check-diagonal-win (game-get-board g20))

(display "Verificación de ganador: ")
(board-who-is-winner (game-get-board g20))

; 8. Verificación de empate
(display "¿Es empate? ")
(game-is-draw? g20)

; 9. Finalizar el juego y actualizar estadísticas
(define ended-game (game-set-end g20)) ;dara 2 victorias para goku y 2 derrotas para vegetta, ya que al finalizar la partida en game-player-set-move tambien se actualizan las estadisticas

; 11. Mostrar historial de movimientos
(display "Historial de movimientos: ")
(game-history ended-game)

; 12. Mostrar estado final del tablero
(displayln "Estado final del tablero: ")
(game-get-board ended-game)

; 13. Actualizar estadísticas de los jugadores
(define updated-p1 (player-update-stats p1 "loss"))
(define updated-p2 (player-update-stats p2 "win"))
  