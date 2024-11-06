            .data
CONTROL: .word 0x10000
DATA:    .word 0x10008
result:  .word 0
            .code
        #Cargo las direcciones de control y data en registros
        ld $t8,CONTROL($zero)
        ld $t9,DATA($zero)
        #Pongo 8 en algun registro para mandarlo a control
        daddi $t0,$zero,8
        #Para loopear utilizo un contador
        daddi $t1,$zero,2 #Cantidad de numeros que voy a leer
        daddi $t3,$zero,0 #La suma de los numeros
loop:   beqz $t1,FIN
        sd $t0,0($t8) #MANDO A CONTROL EL NUMERO 8
        ld $t2,0($t9) #Guardo en t2 El numero 
        daddi $t1,$t1,-1 #LE RESTO A LA CANTIDAD DE ELEMENTOS A LEER
        dadd $t3,$t3,$t2 #SUMo
        j loop
FIN:    daddi $t0,$zero,1
        sd $t3,0($t9)
        sd $t0,0($t8)
        #Leo un numero
        halt