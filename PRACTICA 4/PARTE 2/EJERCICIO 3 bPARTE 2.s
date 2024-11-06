            .data
CONTROL: .word 0x10000
DATA:    .word 0x10008
            .code
        #Cargo las direcciones de control y data en registros
        ld $t8,CONTROL($zero)
        ld $t9,DATA($zero)
        #Pongo 8 en algun registro para mandarlo a control
        daddi $t0,$zero,8
        sd $t0,0($t8) ; #Leo un numero
        ld $s0,0($t9) #Guardo en un registro
        sd $t0,0($t8)#LEO OTRO NUMERO
        ld $s1,0($t9)#GUARDO EL NUMERO
#---------------------LEE NUMEROS------------------------------#
#       LEO caracter
        daddi $t0,$zero,9
        sd $t0,0($t8) # LEO CARACTER
        ld $t1,0($t9) #Lo guardo
#--------------------------------------------------------------#

        #MULTIPLICACION
        daddi $t4,$zero,0x2A
        bne $t1,$t4,suma
        dmul $t3,$s1,$s0
        j FIN
#------------------------------------------------------------------#
        #SUMA
suma:   daddi $t4,$zero,0x2B
        bne $t1,$t4,resta
        dadd $t3,$s1,$s0
        j FIN
#----------------------------------------------------------------#
resta:  daddi $t4,$zero,0x2D
        bne $t1,$t4,division
        dsub $t3,$s0,$s1
        j FIN
#---------------------------------------------------------------#
division: dsubu $t3,$s0,$s1
FIN:    daddi $t0,$zero,1
        sd $t3,0($t9)
        sd $t0,0($t8)
        #Leo un numero
        halt