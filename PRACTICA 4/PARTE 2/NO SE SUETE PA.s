.data
X: .byte 45
Y: .byte 0
color: .byte 255, 0, 0, 0
CONTROL: .word32 0x10000                   
DATA: .word32 0x10008                                               
.code
lwu $s0, CONTROL($zero)     #DIRECCION DE CONTROL EN $S0
lwu $s1, DATA($zero)        # DIREC DE DATA EN $S1
lwu $t0, color($zero)       #Guarda en $t0, el color En este caso rojo al maximo
sw $t0, 0($s1)              #Manda $t0(EL COLOR) A DATO
         lbu $t1,Y($zero)       #COMPLETAR #GUARDO LA DIRECC
lbu $t2,X($zero)            #GUARDA EN $T2 La cordenada X
daddi $t4,$zero,50          #Suma en $t4 50
daddi $t5,$zero,5           #En $t5 le suma 5
loop: sb $t1,4($s1)            #loop: mando lo que esta en $t1,con desplazamiento 4 a dato
        sb $t2,5($s1)         #COMPLETAR        $mando en la 
daddi $t3, $zero, 5         #SUMA 5 A EL REGISTRO T3
sd $t3,0($s0)               #GUARDA MANDA T3 A CONTROL
daddi $t2, $t2, 1           # T2 LE SUMA 1
bne $t4,$t2,loop            #SI T4 NO ES IGUAL A T2 SALTO A LOOP
daddi $t2,$zero,45
daddi $t1,$t1,1             #SUMA t1+1
bne $t5, $t1, loop          #$SI T5 ES DISTINTO DE T1 SALTO A LOOP
nop
nop 
halt