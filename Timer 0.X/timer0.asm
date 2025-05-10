PROCESSOR 16F877A
#include <xc.inc>

; CONFIGURAÇÕES OBRIGATÓRIAS
config FOSC = XT        ; Oscilador de cristal 4MHz (ESSENCIAL no PICSimLab)
config WDTE = OFF       ; Watchdog desligado
config PWRTE = ON       ; Power-up Timer ligado
config BOREN = ON       ; Brown-out Reset ligado
config LVP = OFF        ; RB3 como I/O digital

; VARIÁVEIS
PSECT udata_shr
contador:   DS 1
temp:       DS 1

; TABELA PARA DISPLAY CÁTODO COMUM (formato gfedcba)
PSECT code
tabela_display:
    addwf   PCL, F
    retlw   0x3F    ; 0 - 00111111
    retlw   0x06    ; 1 - 00000110
    retlw   0x5B    ; 2 - 01011011
    retlw   0x4F    ; 3 - 01001111
    retlw   0x66    ; 4 - 01100110
    retlw   0x6D    ; 5 - 01101101
    retlw   0x7D    ; 6 - 01111101
    retlw   0x07    ; 7 - 00000111
    retlw   0x7F    ; 8 - 01111111
    retlw   0x6F    ; 9 - 01101111

; PROGRAMA PRINCIPAL
PSECT resetVec,class=CODE,delta=2
    goto    main

PSECT code,class=CODE,delta=2
main:
    ; 1. CONFIGURAÇÃO INICIAL CRÍTICA
    banksel ADCON1
    movlw   0x06
    movwf   ADCON1      ; Todas as portas como digitais
    
    banksel TRISD
    clrf    TRISD       ; PORTD todo como saída
    
    ; 2. TESTE INICIAL DO DISPLAY (mostra '8' por 2 segundos)
    movlw   8
    call    tabela_display
    movwf   PORTD
    call    delay_2s
    
    ; 3. INICIALIZA CONTADOR
    clrf    contador
    movlw   0
    call    tabela_display
    movwf   PORTD

loop:
    ; 4. INCREMENTA E MOSTRA CONTAGEM
    incf    contador, F
    movlw   10
    subwf   contador, W
    btfsc   STATUS, 0
    clrf    contador
    
    movf    contador, W
    call    tabela_display
    movwf   PORTD
    
    call    delay_500ms
    goto    loop

; SUB-ROTINAS DE ATRASO PRECISAS
delay_2s:
    movlw   4
    movwf   temp
delay2s:
    call    delay_500ms
    decfsz  temp, F
    goto    delay2s
    return

delay_500ms:            ; 500ms exatos a 4MHz
    movlw   250
    movwf   temp
d1:
    movlw   250
    movwf   temp+1
d2:
    decfsz  temp+1, F
    goto    d2
    decfsz  temp, F
    goto    d1
    return
    
    END