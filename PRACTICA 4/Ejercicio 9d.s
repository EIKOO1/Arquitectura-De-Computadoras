        .data
cadena: .asciiz ""
        .code
        daddi $t0,$zero,cadena
        daddi $t1,$zero,0x61 ;letra "a" en assci
        daddi $t2,$zero,0x68 ;letra "h"en assci
        daddi $t3,$zero,1
        daddi $t4,$zero,0
loop:   sb $t1,0($t0)
        daddi $t4,$t4,1 
        daddi $t0,$t0,1 #adelanto una posicion
        bne $t4,$t3,loop
        beq $t1,$t2,fin #comparo que no sea "h"
        daddi $t1,$t1,1 #Paso a la siguiente letra
        daddi $t3,$t3,1 #Incremento cantidad para siguente letra
        daddi $t4,$zero,0 #Arranco en 0 la nueva cuenta
        j loop
fin:    sb $t1,cadena($zero)
        halt
